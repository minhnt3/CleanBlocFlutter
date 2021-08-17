import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../shared/extensions.dart';
import '../base/base_state.dart';
import '../users/users_bottom_sheet.dart';
import 'home_detail_bloc.dart';

class HomeDetailScreen extends StatefulWidget {
  const HomeDetailScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HomeDetailState();
  }
}

class _HomeDetailState extends BaseState<HomeDetailScreen, HomeDetailBloc> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          StreamBuilder<int>(
              stream: bloc.demoController.stream,
              builder: (context, snapshot) {
                return Text('Call back from bottom sheet: ${snapshot.data}');
              }),
          ElevatedButton(
              onPressed: () {
                context.showBottomSheet(
                    (_) => ChangeNotifierProvider.value(value: bloc, child: UsersBottomSheet()));
              },
              child: const Text('show bottom sheet'))
        ],
      ),
    );
  }
}
