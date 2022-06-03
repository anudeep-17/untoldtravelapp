import 'package:flutter/material.dart';
import 'package:untoldtravelapp/screens/HomeScreen';



void main() {
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Init.instance.initialize(),
        builder: (context, AsyncSnapshot snapshot) {
          // Show splash screen while waiting for app resources to load:
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const MaterialApp(
              home: Splash(),
              debugShowCheckedModeBanner: false,
            );
          }
          else {
            return MaterialApp(
              title: 'Untold Travel',
              useInheritedMediaQuery: true,
              // locale: DevicePreview.locale(context),
              // builder: DevicePreview.appBuilder,
              theme: ThemeData.light(),
              darkTheme: ThemeData.dark(),
              home: HomeScreen(),
              debugShowCheckedModeBanner: false,
            );
          }
        }
    );
  }
}


class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor:
      lightMode ? const Color(0xFFFFFFFF) : const Color(0xFFFFFFFF),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: lightMode
              ? Image.asset('assets/photos/UT_water.gif', fit: BoxFit.cover)
              : Image.asset('assets/photos/UT_water.gif',fit: BoxFit.cover)),
    );
  }
}

class Init {
  Init._();
  static final instance = Init._();

  Future initialize() async {
    // This is where you can initialize the resources needed by your app while
    // the splash screen is displayed.  Remove the following example because
    // delaying the user experience is a bad design practice!
    await Future.delayed(const Duration(seconds: 3));
  }
}