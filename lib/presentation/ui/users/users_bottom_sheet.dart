import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base/base_state.dart';
import '../home_detail/home_detail_bloc.dart';
import 'users_bloc.dart';

class UsersBottomSheet extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _UsersBottomSheetState();
  }
}

class _UsersBottomSheetState extends BaseState<UsersBottomSheet, UsersBloc> {
  @override
  Widget build(BuildContext context) {
    return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          StreamBuilder<int>(
              stream: context.read<HomeDetailBloc>().demoData,
              builder: (context, snapshot) {
                return Text('receive data from home detail ${snapshot.data}');
              }),
          ElevatedButton(
            onPressed: () {
              context.read<HomeDetailBloc>().demoController.add(9999);
              AutoRouter.of(context).pop();
            },
            child: const Text('send data to home detail'),
          ),
        ]);
  }
}
