import 'package:rxdart/rxdart.dart';
import '../../utils/log_utils.dart';

class StreamLoggerConfig {
  static bool enableStreamLogger = true;
}

class StreamLogger {
  static const bool needLogOnListen = true;
  static const bool needLogOnData = true;
  static const bool needLogOnError = true;
  static const bool needLogOnDone = true;
  static const bool needLogOnCancel = true;

  const StreamLogger._();

  static Stream<T> logOnNotification<T>(Stream<T> stream, String name,
      {required bool onListen,
      required bool onData,
      required bool onError,
      required bool onDone,
      required bool onCancel}) {
    return stream.doOnListen(() {
      if (onListen) printKV('▶️ ${DateTime.now()}', '$name: onSubscribed');
    }).doOnData((event) {
      if (onData) printKV('🟢 ${DateTime.now()}', '$name: $event');
    }).doOnCancel(() {
      if (onCancel) printKV('🟡 ${DateTime.now()}', '$name: onCanceled');
    }).doOnError((e, _) {
      if (onError) printKV('🔴 ${DateTime.now()}', '$name: $e');
    }).doOnDone(() {
      if (onDone) printKV('☑️️ ${DateTime.now()}', '$name: onCompleted');
    });
  }
}
