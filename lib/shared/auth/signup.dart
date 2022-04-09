import 'package:flutter/material.dart';
import 'package:food_app/core/service_injector/service_injector.dart';
import 'package:food_app/module/home_bottom_navigation_.dart';
import 'package:food_app/shared/auth/signin.dart';
import 'package:food_app/shared/widgets/buttons/primary_raised_button.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  String selectedCountryCode = '';
  List codes = [];
  @override
  void initState() {
    super.initState();
    si.persistenceStorageservice
        .readJson('assets/json/phone.json')
        .then((value) {
      for (var phoneCode in value['countries']) {
        codes.add(phoneCode['code']);
      }
    });
    // print(codes);
  }

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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'GideonRoman',
                      ),
                    ),
                    const SizedBox(height: 30),
                    TextFormField(
                      controller: name,
                      decoration: const InputDecoration(
                        label: Text('Name'),
                      ),
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: email,
                      decoration: const InputDecoration(
                        label: Text('Email'),
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: phone,
                      decoration: InputDecoration(
                        prefix: Padding(
                          padding: const EdgeInsets.only(right: 5.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<dynamic>(
                              items: si.utilityService
                                  .getDropdownItems(items: codes),
                              hint: const Text('+234'),
                              // value: selectedCountryCode,
                              underline: Container(),
                              onChanged: (value) {
                                setState(() {
                                  selectedCountryCode = value;
                                });
                              },
                            ),
                          ),
                        ),
                        label: const Text('Phone'),
                      ),
                      keyboardType: TextInputType.phone,
                    ),
                    const SizedBox(height: 15),
                    TextFormField(
                      controller: password,
                      decoration: const InputDecoration(
                        label: Text('Password'),
                      ),
                      obscureText: true,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'By sigining up you agree with our',
                          style: TextStyle(color: Colors.grey, fontSize: 12),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: const Text(
                            'Terms and Conditions',
                            style: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w500,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    PrimaryButton(
                      onTap: (startLoading, stopLoading, btnState) {
                        si.routerService
                            .nextRoute(context, const HomeBottomNavigation());
                      },
                      buttonTitle: 'Continue',
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: TextStyle(color: Colors.grey),
                    ),
                    GestureDetector(
                      onTap: () =>
                          si.routerService.nextRoute(context, const Signin()),
                      child: const Text(
                        'Sign In',
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
