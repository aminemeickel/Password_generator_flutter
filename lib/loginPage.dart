import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'components/costumButton.dart';
import 'core/preference.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.all(20.0),
            child: Align(
              alignment: Alignment.topRight,
              child: CustomButton(
                text: 'Login',
                color: Colors.green,
                width: 70,
                height: 40,
                size: size,
                fontSize: 16,
                onPressed: () async {
                  var pref = PreferenceDriver.instance;
                  var login = await pref.write('isLogin', true);
                  Navigator.of(context)
                      .pushNamedAndRemoveUntil('/', (route) => false);
                  print(login);
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Image.asset('assets/image1.png'),
          ),
        ],
      ),
    );
  }
}
