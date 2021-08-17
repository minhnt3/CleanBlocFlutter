import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../helper/error_handler/error_handler_factory.dart';
import '../helper/error_handler/error_listener_mixin.dart';
import '../utils/view_utils.dart';
import 'base_controller.dart';

abstract class BasePage<C extends BaseController> extends GetWidget<C> with ErrorListenerMixin {
  const BasePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder(
      builder: (C controller) => buildPage(context),
      initState: initState,
      dispose: dispose,
      didChangeDependencies: didChangeDependencies,
      didUpdateWidget: didUpdateWidget,
    );
  }

  Widget buildPage(BuildContext context);

  void initState(GetBuilderState<C> state) {
    controller.exception.listen(
      (error) {
        if (error != null) {
          ErrorHandlerFactory.handleErrorByType(state.context, error, this);
        }
      },
    );

    controller.loading.listen(handleLoading);
  }

  void handleLoading(bool isLoading) {
    isLoading ? showLoading() : hideLoading();
  }

  void dispose(GetBuilderState<C> state) {}

  void didChangeDependencies(GetBuilderState<C> state) {}

  void didUpdateWidget(GetBuilder oldWidget, GetBuilderState<C> state) {}
}
