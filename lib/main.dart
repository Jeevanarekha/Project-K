import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/splash_page.dart';
import './services/navigation_service.dart';
import './pages/login_page.dart';
import './providers/authentication_provider.dart';
import './pages/home_page.dart';
import './pages/register_page.dart';

void main() {
  runApp(
    SplashPage(
      key: UniqueKey(),
      onInitializationComplete: () {
        runApp(
          const MainApp(),
        );
      },
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (BuildContext context) {
            return AuthenticationProvider();
          },
        )
      ],
      child: MaterialApp(
        title: "Project-Kooli1",
        theme: ThemeData(
          scaffoldBackgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
          bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            backgroundColor: Color.fromRGBO(36, 35, 37, 1.0),
          ),
          colorScheme: const ColorScheme.dark(
            background: Color.fromRGBO(36, 35, 49, 1.0),
          ),
        ),
        navigatorKey: NavigationService.navigatorKey,
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext context) => const LoginPage(),
          '/register': (BuildContext context) => RegisterPage(),
          '/home': (BuildContext context) => HomePage(),
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import './pages/splash_page.dart';
// import './services/navigation_service.dart';
// import './pages/login_page.dart';
// import './providers/authentication_provider.dart';
// import './pages/home_page.dart';
// import './pages/register_page.dart';

// void main() {
//   runApp(MainApp());
// }

// class MainApp extends StatelessWidget {
//   const MainApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MultiProvider(
//       providers: [
//         ChangeNotifierProvider<AuthenticationProvider>(
//           create: (BuildContext context) {
//             return AuthenticationProvider();
//           },
//         )
//       ],
//       child: MaterialApp(
//         title: "Project-Kooli1",
//         theme: ThemeData(
//           scaffoldBackgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
//           bottomNavigationBarTheme: const BottomNavigationBarThemeData(
//             backgroundColor: Color.fromRGBO(36, 35, 37, 1.0),
//           ),
//           colorScheme: const ColorScheme.dark(
//             background: Color.fromRGBO(36, 35, 49, 1.0),
//           ),
//         ),
//         navigatorKey: NavigationService.navigatorKey,
//         initialRoute: '/splash',
//         onGenerateRoute: (settings) {
//           switch (settings.name) {
//             // case '/splash':
//             //   return MaterialPageRoute(builder: (context) => SplashPage());
//             case '/login':
//               return MaterialPageRoute(builder: (context) => LoginPage());
//             case '/register':
//               return MaterialPageRoute(builder: (context) => RegisterPage());
//             case '/home':
//               return MaterialPageRoute(builder: (context) => HomePage());
//             default:
//               return null;
//           }
//         },
//       ),
//     );
//   }
// }
