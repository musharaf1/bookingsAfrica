import 'package:bookingsAfricaApp/locator.dart';
import 'package:bookingsAfricaApp/ui/router.dart';
import "package:flutter/material.dart";

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  setUpLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // this widget is the root of your application
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'PaySimpleMerchant',
      onGenerateRoute: Router.generateRoute,
      initialRoute: 'splash',
    );
  }
}
