// import 'package:flutter/material.dart';

// class NavigationService {
//   static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

//   void removeAndNavigateToRoute(String route) {
//     navigatorKey.currentState?.popAndPushNamed(route);
//   }

//   void navigateToRoute(String route) {
//     navigatorKey.currentState?.pushNamed(route);
//   }

//   void navigateToPage(Widget page) {
//     navigatorKey.currentState
//         ?.push(MaterialPageRoute(builder: (BuildContext context) {
//       return page;
//     }));
//   }

//   void goBack() {
//     navigatorKey.currentState?.pop();
//   }
// }

import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  void removeAndNavigateToRoute(String _route) {
    navigatorKey.currentState?.popAndPushNamed(_route);
  }

  void navigateToRoute(String _route) {
    navigatorKey.currentState?.pushNamed(_route);
  }

  void navigateToPage(Widget _page) {
    navigatorKey.currentState?.push(
      MaterialPageRoute(
        builder: (BuildContext _context) {
          return _page;
        },
      ),
    );
  }

  String? getCurrentRoute() {
    return ModalRoute.of(navigatorKey.currentState!.context)?.settings.name!;
  }

  void goBack() {
    navigatorKey.currentState?.pop();
  }
}
