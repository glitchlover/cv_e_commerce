library flog;

import 'dart:developer' as dev;
import 'package:flutter/foundation.dart' as flutter;
import 'package:flutter/material.dart';

part "log_color.dart";
part "log_config.dart";
part "log_level.dart";

RegExp dartFileRegx = RegExp(r'[A-Za-z]+.dart');

/// Logger singleton.
class Flog {
  static LogLevel _minLogLevel = LogLevel.mark;
  static int _headerWidth = 15;
  static bool _headerRightAlign = true;
  static bool _logDevToolsOnly = false;
  static const bool _logEmojiAsPrefix = true;
  static const int _initialFrameIndex = 1;

  static final Flog _singleton = Flog._create();

  Flog._create();

  factory Flog.init() {
    mark("Flog initialized");
    return _singleton;
  }

  static LogLevel get logLevel => _minLogLevel;
  static void setLogLevel(LogLevel level) => _minLogLevel = level;

  static int get headerWidth => _headerWidth;
  static void setHeaderWidth(int width) => _headerWidth = width;

  static bool get headerRightAlign => _headerRightAlign;
  static void setHeaderRightAlign(bool rightAlign) =>
      _headerRightAlign = rightAlign;

  static bool get logDevToolsOnly => _logDevToolsOnly;
  static void setLogDevToolsOnly(bool option) => _logDevToolsOnly = option;

  static void _flog(String header, Object? message, LogLevel level,
      {Object? object, StackTrace? trace, String? description}) {
    // Break if in release mode:
    if (flutter.kReleaseMode) return;
    // Otherwise, log the message to DevTools if option has been set:
    if (logDevToolsOnly) {
      dev.log(
        message.toString(),
        time: null,
        sequenceNumber: null,
        level: number[level]!,
        name: header,
        zone: null,
        error: object,
        stackTrace: trace,
      );
      // And break out of function to not print to terminal:
      return;
    }
    // From here on, print to terminal and to DevTools:
    String headerFull = '';
    String? prefix = _logEmojiAsPrefix ? emoji[level] : symbol[level];
    if (headerRightAlign) {
      headerFull = '$prefix ${header.padLeft(headerWidth)} : ';
    } else {
      headerFull = '$prefix ${header.padRight(headerWidth)} : ';
    }
    flutter.debugPrint(
        '${color[level]}$headerFull${color[level]}${message.toString()}\x1B[0m');
    if (object != null) {
      // If log call passed an object to print:
      try {
        // Try to print object.
        flutter.debugPrint('${color[level]}$object\x1B[0m');
      } catch (error) {
        // Otherwise, print error.
        flutter.debugPrint('${color[level]}$error\x1B[0m');
      }
    }
    if (trace != null) debugPrintStack(stackTrace: trace, maxFrames: 3);
    if (description != null) debugPrint('⇢ $description');
  }

  static void mark(Object? message, {String? description}) {
    String header = _generateHeader(StackTrace.current);
    _flog(header, message, LogLevel.mark);
  }

  static void trace(Object? message, {String? description}) {
    String header = _generateHeader(StackTrace.current);
    _flog(header, message, LogLevel.trace, trace: StackTrace.current);
  }

  static void debug(Object? message, {String? description}) {
    String header = _generateHeader(StackTrace.current);
    _flog(header, message, LogLevel.debug);
  }

  static void info(Object? message, {String? description}) {
    String header = _generateHeader(StackTrace.current);
    _flog(header, message, LogLevel.info, description: description);
  }

  static void success(Object? message, {String? description}) {
    String header = _generateHeader(StackTrace.current);
    _flog(header, message, LogLevel.success);
  }

  static void warning(Object? message, {String? description}) {
    String header = _generateHeader(StackTrace.current);
    _flog(header, message, LogLevel.warning);
  }

  static void error(Object? message, {String? description}) {
    String header = _generateHeader(StackTrace.current);
    _flog(header, message, LogLevel.error);
  }

  static void errorObject(Object error, Object? message,
      {String? description}) {
    String header = _generateHeader(StackTrace.current);
    _flog(header, message, LogLevel.error, object: error);
  }

  static void fatal(Object? error, Object? message, {String? description}) {
    String header = _generateHeader(StackTrace.current);
    _flog(header, message, LogLevel.fatal, object: error);
  }

  static String _generateHeader(StackTrace trace) {
    var frames = trace.toString().split('\n');

    var traceString = frames[_initialFrameIndex];

    // ignore: unused_local_variable
    final (lineInfo, fileInfo, callerInfo) = _analyzeFrame(traceString);

    String callerMethod = callerInfo.length == 2 ? callerInfo[1] : callerInfo[0];
    String callerClass = callerInfo[0];

    return callerInfo.length == 2 
    ? "$callerClass > $callerMethod $lineInfo"
    : "$callerMethod $lineInfo";
  }

  static (String, String, List<String>) _analyzeFrame(String frame) {
    var indexOfFileName = frame.indexOf(dartFileRegx);
    String fileInfo = frame.substring(indexOfFileName);
    String lineInfo =
        "${getLineColor()}${getLineNumber(fileInfo)}:${getColumnNumber(fileInfo)}${ansi[Color.reset]}"
            .replaceAll(")", "");
    List<String> callerInfo = frame
        .replaceAll(RegExp(r'\s'), "")
        .replaceAll(RegExp(r'[0-9#]'), "")
        .replaceAll("_", "")
        .split("(")[0]
        .split(".");

    return (lineInfo, fileInfo, callerInfo);
  }

  static String getColumnNumber(String fileInfo) => fileInfo.split(":")[2];

  static String getLineNumber(String fileInfo) => fileInfo.split(":")[1];

  static String? getLineColor() => ansi[Color.cyan];

}

// /// Implements the behavior of the log function from the dart:developer package.
// static void log(
//   Object? message, {
//   DateTime? time,
//   int? sequenceNumber,
//   int level = 0,
//   String name = '',
//   Zone? zone,
//   Object? error,
//   StackTrace? stackTrace,
// }) {
//   dev.log(
//     message,
//     time: time,
//     sequenceNumber: sequenceNumber,
//     level: level,
//     name: name,
//     zone: zone,
//     error: error,
//     stackTrace: stackTrace,
//   );
// }


