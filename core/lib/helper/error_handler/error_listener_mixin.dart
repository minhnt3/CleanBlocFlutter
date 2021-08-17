import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../generated/l10n.dart';
import '../../utils/view_utils.dart';
import 'local/local_error_listener.dart';
import 'remote/remote_error_listener.dart';

mixin ErrorListenerMixin implements LocalErrorListener, RemoteErrorListener {
  @override
  void onHttpError(BuildContext context, String message) {
    _showSnackBar(context: context, message: message);
  }

  @override
  void onServerInternalError(BuildContext context, String message) {
    _showSnackBar(context: context, message: message);
  }

  @override
  void onNetworkError(BuildContext context, String message) {
    _showSnackBar(context: context, message: message);
  }

  @override
  void onNoInterNetConnectionError(BuildContext context, String message) {
    _showSnackBar(context: context, message: message);
  }

  /// TODO: refactor later
  @override
  void onSessionExpiredError(BuildContext context, String message) {
    _showAlertDialog(
      message: message,
      context: context,
      onActionPressed: () => Get.offAllNamed('/login'),
    );
  }

  @override
  void onServerError(
    BuildContext context,
    RemoteException exception,
  ) {
    _showSnackBar(
      context: context,
      message: exception.firstServerErrorMessage ?? S.of(context).unexpected_error,
    );
  }

  @override
  void onTimeoutError(BuildContext context, String message) {
    _showSnackBar(context: context, message: message);
  }

  @override
  void onUnexpectedError(BuildContext context, String message) {
    _showSnackBar(context: context, message: message);
  }

  void _showSnackBar({
    required BuildContext context,
    required String message,
  }) {
    showSnackBar(message);
  }

  void _showAlertDialog({
    required BuildContext context,
    required String message,
    VoidCallback? onActionPressed,
  }) {
    showAlertDialog(
      message: message,
      onActionPressed: onActionPressed,
    );
  }
}
