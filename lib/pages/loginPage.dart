import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/costumButton.dart';
import '../core/preference.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/image1.png'),
          SizedBox(
            height: 20,
          ),
          CustomButton(
            text: 'Welcome',
            color: Theme.of(context).primaryColor,
            height: 45,
            size: size,
            fontSize: 20,
            onPressed: () async {
              var pref = PreferenceDriver.instance;
              var login = await pref.write('isLogin', true);
              Navigator.of(context)
                  .pushNamedAndRemoveUntil('/', (route) => false);
              print(login);
            },
          )
        ],
      ),
    );
  }
}
