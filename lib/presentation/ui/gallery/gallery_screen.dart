import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../base/base_state_and_utils.dart';
import '../edit_profile/profile_shared_bloc.dart';
import 'gallery_bloc.dart';

class GalleryScreen extends StatefulWidget {
  @override
  _GalleryScreenState createState() => _GalleryScreenState();
}

class _GalleryScreenState extends BaseState<GalleryScreen, GalleryBloc> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          child: const Text('send data to edit profile'),
          onPressed: () {
            context.read<ProfileSharedBloc>().sendData(100);
            AutoRouter.of(context).pop();
          },
        ),
      ),
    );
  }
}
