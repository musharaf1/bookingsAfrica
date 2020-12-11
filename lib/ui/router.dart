import 'package:bookingsAfricaApp/ui/screen/home_screen.dart';
import 'package:bookingsAfricaApp/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';

/// here we have the routes in static variable so it is easy for us to change

const splash = 'splash';
const home = '/';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case splash:
        return MaterialPageRoute(builder: (_) => SplashScreen());
        break;
      case home:
        return MaterialPageRoute(builder: (_) => HomeScreen());
        break;

      default:
        return MaterialPageRoute(
            builder: (_) => Scaffold(
                  body: Center(
                    child: Text('No Route define for ${settings.name}'),
                  ),
                ));
    }
  }
}
