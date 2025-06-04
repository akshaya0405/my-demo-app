import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'pages/splash_screen.dart';
import 'pages/login_page.dart';
import 'pages/home_page.dart';
import 'pages/widget_page.dart';
import 'pages/ui_components_page.dart';
import 'routes/app_routes.dart';
import 'pages/user_page.dart';
import 'pages/cruds_example_page.dart';
import 'service/notification_service.dart';
// import 'package:flutter_uxcam/flutter_uxcam.dart';
import 'package:flutter_microsoft_clarity/flutter_microsoft_clarity.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBzU-ikWXglaTGZ3JMBMxXhuDOqudw4po4",
            authDomain: "my-demo-app-fb781.firebaseapp.com",
            projectId: "my-demo-app-fb781",
            storageBucket: "my-demo-app-fb781.firebasestorage.app",
            messagingSenderId: "926378740352",
            appId: "1:926378740352:web:9815cf2bc48709be953465"));
  } else {
    await Firebase.initializeApp();
  }
  await NotificationService.init(); // Initialize notifications

  // FlutterMicrosoftClarity.initialize(apiToken: 'SEU_TOKEN_DE_API');
  WidgetsFlutterBinding.ensureInitialized();
  FlutterMicrosoftClarity().init(projectId: 'r0sng38czk');
  runApp(DemoApp());

  // runApp(
  //   DemoApp(),
  // );
}

class DemoApp extends StatefulWidget {
  @override
  _DemoAppState createState() => _DemoAppState();
}

class _DemoAppState extends State<DemoApp> {
  ThemeMode _themeMode = ThemeMode.dark; // Default to dark theme

  void _toggleTheme() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    //   FlutterUxcam
    //       .optIntoSchematicRecordings(); /* Confirm that you have user
    // permission for screen recording */
    //   FlutterUxConfig config = FlutterUxConfig(
    //       userAppKey: "emyb2rgqih8xdnz", enableAutomaticScreenNameTagging: false);
    //   FlutterUxcam.startWithConfiguration(config);

    return MaterialApp(
      title: 'DemoApp',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        //color scheme
        colorScheme: ColorScheme.light(
            primary: const Color.fromARGB(220, 12, 23, 138),
            secondary: const Color.fromARGB(220, 211, 213, 234)),
        canvasColor: const Color.fromARGB(255, 255, 252, 252),
        //card color
        cardColor: Color.fromARGB(129, 206, 206, 210),
        // background color
        scaffoldBackgroundColor: const Color.fromARGB(255, 246, 243, 243),
        //app bar
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(220, 12, 23, 138),
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 230, 230, 240),
          ),
        ),
        //text
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 56, 56, 57),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: const Color.fromARGB(221, 136, 136, 136),
          ),
        ),
        //input
        inputDecorationTheme: InputDecorationTheme(
          labelStyle:
              TextStyle(color: Colors.blueAccent, fontWeight: FontWeight.w500),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue, width: 2),
            borderRadius: BorderRadius.circular(10),
          ),
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent, width: 1),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        //button
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromARGB(220, 12, 23, 138),
            foregroundColor: const Color.fromARGB(255, 236, 229, 229),
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 32),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
      darkTheme: ThemeData(
        //color scheme
        colorScheme: ColorScheme.dark(
            primary: const Color.fromARGB(220, 12, 23, 138),
            secondary: const Color.fromARGB(220, 211, 213, 234)),
        canvasColor: const Color.fromARGB(66, 45, 44, 44),
        //card color
        cardColor: Color.fromARGB(129, 54, 51, 53),
        //background color
        scaffoldBackgroundColor: const Color.fromARGB(255, 21, 21, 21),
        //app bar
        appBarTheme: AppBarTheme(
          backgroundColor: const Color.fromARGB(220, 12, 23, 138),
          titleTextStyle: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 230, 230, 240),
          ),
        ),
        //text
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            color: const Color.fromARGB(255, 209, 210, 212),
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Colors.white70,
          ),
        ),
      ),
      themeMode: _themeMode,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (context) =>
            SplashScreen(onToggleTheme: _toggleTheme),
        AppRoutes.login: (context) => LoginPage(onToggleTheme: _toggleTheme),
        AppRoutes.home: (context) => HomePage(onToggleTheme: _toggleTheme),
        AppRoutes.widgetsPage: (context) =>
            WidgetPage(onToggleTheme: _toggleTheme),
        AppRoutes.uiComponentsPage: (context) =>
            UIComponentsPage(onToggleTheme: _toggleTheme),
        AppRoutes.userPageList: (context) =>
            UserPageList(onToggleTheme: _toggleTheme),
        AppRoutes.crudExamplePage: (context) =>
            CrudExamplePage(onToggleTheme: _toggleTheme),
      },
    );
  }
}
