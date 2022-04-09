import 'package:flutter/material.dart';
import 'package:food_app/core/service_injector/service_injector.dart';
import 'package:food_app/module/home_bottom_navigation_.dart';
import 'package:food_app/shared/auth/signup.dart';
import 'package:food_app/shared/widgets/buttons/primary_raised_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_app/shared/widgets/buttons/round_outline_icon_button.dart';

class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

class _SigninState extends State<Signin> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/flags.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 170),
          padding: const EdgeInsets.all(15),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w800,
                        fontFamily: 'GideonRoman',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        label: Text('Email'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: password,
                      decoration: const InputDecoration(
                        label: Text('Password'),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            'Forgot Password?',
                            style: TextStyle(color: Colors.grey),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 15),
                    PrimaryButton(
                      onTap: (startLoading, stopLoading, btnState) {
                        si.routerService
                            .nextRoute(context, const HomeBottomNavigation());
                      },
                      buttonTitle: 'Login',
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'OR',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Connect Using',
                  style: TextStyle(color: Colors.grey),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    RoundOutlinedIconButton(
                      icon: FontAwesomeIcons.google,
                      color: Colors.red,
                      onPressed: () {},
                    ),
                    const SizedBox(width: 15),
                    RoundOutlinedIconButton(
                      icon: FontAwesomeIcons.facebookF,
                      color: Colors.blue,
                      onPressed: () {},
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don\'t have an account?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () =>
                          si.routerService.nextRoute(context, const Signup()),
                      child: const Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
