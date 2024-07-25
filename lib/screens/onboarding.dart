import 'package:auto_services/widgets/widgets_imports.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';

import 'auth/view/login.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      finishButtonText: 'Go',
      onFinish: () {
        Navigator.push(
          context,
          CupertinoPageRoute(
            builder: (context) => LoginScreen(),
          ),
        );
      },
      finishButtonStyle: const FinishButtonStyle(
        shape: CircleBorder(),
        backgroundColor: KColors.kTertiary,
      ),
      skipIcon: const Icon(CupertinoIcons.forward),
      controllerColor: KColors.kTertiary,
      totalPage: 3,
      headerBackgroundColor: Colors.white,
      pageBackgroundColor: Colors.white,
      background: [
        Image.asset(
          'assets/images/onboarding1.png',
          height: 400,
        ),
        Image.asset(
          'assets/images/onboarding2.png',
          height: 400,
        ),
        Image.asset(
          'assets/images/onboarding3.png',
          height: 400,
        ),
      ],
      speed: 1.8,
      pageBodies: [
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Explore The\nWorld Easily',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: KColors.kTertiary,
                  fontSize: 36.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'To your desire',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: KColors.kTertiary,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Explore The\nWorld Easily',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: KColors.kTertiary,
                  fontSize: 36.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'To your desire',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: KColors.kTertiary,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: const Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 480,
              ),
              Text(
                'Explore The\nWorld Easily',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: KColors.kTertiary,
                  fontSize: 36.0,
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'To your desire',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: KColors.kTertiary,
                  fontSize: 24.0,
                  fontWeight: FontWeight.w300,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
