import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}

class _HomePageState extends State<HomePage> {
  int _currentPage = 0;
  final List<Widget> _pages = [
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.green,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentPage,
        onTap: (_index) {
          setState(() {
            _currentPage = _index;
          });
        },
        items: [
          BottomNavigationBarItem(
            label: "Chats",
            icon: Icon(Icons.chat_bubble_sharp),
          ),
          BottomNavigationBarItem(
            label: "Users",
            icon: Icon(
              Icons.supervised_user_circle_sharp,
            ),
          ),
        ],
      ),
    );
  }
}

// 2nd code

// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _HomePageState();
//   }
// }

// class _HomePageState extends State<HomePage> {
//   int _currentPage = 0;
//   final List<Widget> _pages = [
//     Container(
//       color: Colors.red,
//     ),
//     Container(
//       color: Colors.green,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return _buildUI();
//   }

//   Widget _buildUI() {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: _pages[_currentPage],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentPage,
//         onTap: (_index) {
//           setState(() {
//             _currentPage = _index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             label: "Chats",
//             icon: Icon(Icons.chat_bubble_sharp),
//           ),
//           BottomNavigationBarItem(
//             label: "Users",
//             icon: Icon(Icons.supervised_user_circle_sharp),
//           ),
//         ],
//       ),
//     );
//   }
// }

// 3rd code

// import 'package:flutter/material.dart';

// class HomePage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _HomePageState();
//   }
// }

// class _HomePageState extends State<HomePage> {
//   int _currentPage = 0;
//   final List<Widget> _pages = [
//     Container(
//       color: Colors.red,
//     ),
//     Container(
//       color: Colors.green,
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return _buildUI();
//   }

//   Widget _buildUI() {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Home Page'),
//       ),
//       body: PageView(
//         children: _pages,
//         onPageChanged: (index) {
//           setState(() {
//             _currentPage = index;
//           });
//         },
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _currentPage,
//         onTap: (index) {
//           setState(() {
//             _currentPage = index;
//           });
//         },
//         items: [
//           BottomNavigationBarItem(
//             label: "Chats",
//             icon: Icon(Icons.chat_bubble_sharp),
//           ),
//           BottomNavigationBarItem(
//             label: "Users",
//             icon: Icon(Icons.supervised_user_circle_sharp),
//           ),
//         ],
//       ),
//     );
//   }
// }
