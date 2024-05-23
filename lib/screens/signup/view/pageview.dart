import 'package:auto_services/screens/signup/view/forgetpassword.dart';
import 'package:auto_services/screens/signup/view/resetpassword.dart';
import 'package:auto_services/screens/signup/view/verification.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Pages extends StatelessWidget {
  Pages({super.key});
  final controller = PageController(initialPage: 1);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: PageView(
          controller: controller,
          children: [
            ForgetPassword(),
            VerificationScreen(),
            Resetpassword(),
          ],
        ),
      ),
    );
  }
}
