import 'package:bookingsAfricaApp/ui/view_model.dart/base_view_model.dart';
import 'package:bookingsAfricaApp/ui/view_model.dart/splash_screenVM.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // final size = MediaQuery.of(context).size;
    return BaseViewModel<SplashScreenVM>(
      providerReady: (provider) => provider.startUp(context),
      builder: (context, provider, _) => Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Container(
            child: Center(
              child: Image.asset('assets/images/booking.png'),
            ),
          ),
        ),
      ),
    );
  }
}
