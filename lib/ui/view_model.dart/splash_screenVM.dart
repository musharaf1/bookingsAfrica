import 'package:bookingsAfricaApp/core/provider_model/base_provider_model.dart';
import 'package:bookingsAfricaApp/network_services/shared_preference.dart';
import 'package:flutter/material.dart';

import '../../locator.dart';

class SplashScreenVM extends BaseProviderModel {
  final keyStore = locator<SharedPref>();

  Future<void> startUp(BuildContext context) async {
    if (await keyStore.myFirst ?? true) {
      await Future.delayed(Duration(seconds: 2));
      keyStore.setIsFirstTime(false);
      Navigator.pushNamed(context, '/');
    } else {
      await Future.delayed(Duration(seconds: 2));
      Navigator.pushNamed(context, '/');
    }
  }
}
