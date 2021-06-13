import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../generated/l10n.dart';

extension ShowSnackBarBuildContextExtension on BuildContext {
  void showSnackBar(
    String message, [
    Duration duration = const Duration(seconds: 3),
  ]) {
    final messengerState = ScaffoldMessenger.maybeOf(this);
    if (messengerState == null) {
      return;
    }
    messengerState.hideCurrentSnackBar();
    messengerState.showSnackBar(
      SnackBar(
        content: Text(message),
        duration: duration,
      ),
    );
  }

  void showLoadingDialog() {
    showDialog<void>(
      context: this,
      barrierDismissible: false,
      useSafeArea: false,
      builder: (context) {
        return const Material(
          type: MaterialType.transparency,
          child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
        );
      },
    );
  }

  void hideDialog() {
    Navigator.of(this).pop();
  }

  void hideKeyboard() {
    final FocusScopeNode currentFocus = FocusScope.of(this);
    if (!currentFocus.hasPrimaryFocus && currentFocus.focusedChild != null) {
      FocusManager.instance.primaryFocus?.unfocus();
    }
  }

  void showAlertDialog(
    String message,
    VoidCallback defaultActionPressed,
  ) {
    showDialog(
      context: this,
      builder: (_) => CupertinoAlertDialog(
        content: Text(message),
        actions: <Widget>[
          CupertinoDialogAction(
            child: Text(S.of(this).ok),
            isDefaultAction: true,
            onPressed: defaultActionPressed,
          )
        ],
      ),
    );
  }

  void showBottomSheet(WidgetBuilder builder) {
    showModalBottomSheet(context: this, builder: builder);
  }
}
