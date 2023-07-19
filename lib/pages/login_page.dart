// import 'package:flutter/material.dart';
// import '../widgets/custom_input_fields.dart';
// import '../widgets/rounded_button.dart';

// class LoginPage extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _LoginPageState();
//   }
// }

// class _LoginPageState extends State<LoginPage> {
//   late double _deviceHeight;
//   late double _deviceWidth;

//   final _loginFormKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     _deviceHeight = MediaQuery.of(context).size.height;
//     _deviceWidth = MediaQuery.of(context).size.width;
//     return _buildUI();
//   }

//   Widget _buildUI() {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.symmetric(
//           horizontal: _deviceWidth * 0.03,
//           vertical: _deviceHeight * 0.02,
//         ),
//         height: _deviceHeight * 0.98,
//         width: _deviceWidth * 0.97,
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             _pageTitle(),
//             SizedBox(
//               height: _deviceHeight * 0.04,
//             )
//             _loginForm(),
//             _loginButton(),
//             SizedBox(
//               width: _deviceWidth * 0.05,
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _pageTitle() {
//     return Container(
//       height: _deviceHeight * 0.10,
//       child: Text(
//         'Project-Kooli1',
//         style: TextStyle(
//           color: Colors.white,
//           fontSize: 40,
//           fontWeight: FontWeight.w600,
//         ),
//       ),
//     );
//   }

//   Widget _loginForm() {
//     return Container(
//       height: _deviceHeight * 0.18,
//       child: Form(
//         key: _loginFormKey,
//         child: Column(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             CustomTextFormField(
//               onSaved: (value) {},
//               regex:
//                   r"^[a-zA-Z0-9.a-zA-Z0.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[A-zA-Z]+",
//               hintText: "Email",
//               obscureText: false,
//             ),
//             CustomTextFormField(
//               onSaved: (value) {},
//               regex: r".{8,}",
//               hintText: "Password",
//               obscureText: true,
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Widget _loginButton() {
//     return RoundedButton(
//       name: "Login",
//       height: _deviceHeight * 0.065,
//       width: _deviceWidth * 0.65,
//       onPressed: () {},
//     );
//   }
// }

import 'package:flutter/material.dart';
import '../widgets/custom_input_fields.dart';
import '../widgets/rounded_button.dart';
import '../providers/authentication_provider.dart';
import '../services/navigation_service.dart';
import 'package:provider/provider.dart';
import 'package:get_it/get_it.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  late double _deviceHeight;
  late double _deviceWidth;

  late AuthenticationProvider _auth;
  late NavigationService _navigation;

  final _loginFormKey = GlobalKey<FormState>();

  String? _email;
  String? _password;

  @override
  Widget build(BuildContext context) {
    _deviceHeight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;
    _auth = Provider.of<AuthenticationProvider>(context);
    _navigation = GetIt.instance.get<NavigationService>();
    return _buildUI();
  }

  Widget _buildUI() {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: _deviceWidth * 0.03,
          vertical: _deviceHeight * 0.02,
        ),
        height: _deviceHeight * 0.98,
        width: _deviceWidth * 0.97,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            _pageTitle(),
            SizedBox(
              height: _deviceHeight * 0.04,
            ),
            _loginForm(),
            SizedBox(
              height: _deviceHeight * 0.04,
            ),
            _loginButton(),
            SizedBox(
              height: _deviceHeight * 0.05,
            ),
            _registerAccountLink(),
            SizedBox(
              width: _deviceWidth * 0.02,
            ),
          ],
        ),
      ),
    );
  }

  Widget _pageTitle() {
    return SizedBox(
      height: _deviceHeight * 0.10,
      child: const Text(
        'Project-Kooli1',
        style: TextStyle(
          color: Colors.white,
          fontSize: 40,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _loginForm() {
    return SizedBox(
      height: _deviceHeight * 0.18,
      child: SingleChildScrollView(
        child: Form(
          key: _loginFormKey,
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: CustomTextFormField(
                  onSaved: (value) {
                    setState(() {
                      _email = value;
                    });
                  },
                  regex:
                      r"^[a-zA-Z0-9.a-zA-Z0.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[A-zA-Z]+",
                  hintText: "Email",
                  obscureText: false,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: CustomTextFormField(
                  onSaved: (value) {
                    setState(() {
                      _password = value;
                    });
                  },
                  regex: r".{8,}",
                  hintText: "Password",
                  obscureText: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return RoundedButton(
      name: "Login",
      height: _deviceHeight * 0.065,
      width: _deviceWidth * 0.65,
      onPressed: () {
        if (_loginFormKey.currentState!.validate()) {
          _loginFormKey.currentState!.save();
          _auth.loginUsingEmailAndPassword(_email!, _password!);
        }
      },
    );
  }

  Widget _registerAccountLink() {
    return GestureDetector(
      onTap: () => _navigation.navigateToRoute('/register'),
      child: Container(
        child: const Text(
          'Don\'t have an account?',
          style: TextStyle(
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}