import '../widgets/widgets_imports.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    Key? key,
    this.isCenter = true,
    this.size = .4,
  }) : super(key: key);
  final bool isCenter;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: isCenter ? Alignment.center : Alignment.topCenter,
      child: LottieBuilder.asset(
        "assets/animations/loader.json",
        repeat: true,
        width: kWidth(size),
      ),
    );
  }
}

class NoDataLoader extends StatelessWidget {
  const NoDataLoader({
    Key? key,
    this.isCenter = true,
    this.size = .4,
  }) : super(key: key);
  final bool isCenter;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCenter ? Alignment.center : Alignment.topCenter,
      child: SizedBox(
        height: kHeight(.24),
        child: LottieBuilder.asset(
          "assets/animations/no_data.json",
          repeat: true,
          width: kWidth(size),
        ),
      ),
    );
  }
}

class NetLoader extends StatelessWidget {
  const NetLoader({
    Key? key,
    this.isCenter = true,
    this.size = .4,
    this.buttonColor = KColors.kPrimary,
  }) : super(key: key);
  final bool isCenter;
  final double size;
  final Color buttonColor;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCenter ? Alignment.center : Alignment.topCenter,
      child: SizedBox(
        height: kHeight(.26),
        child: Column(
          children: [
            LottieBuilder.asset(
              "assets/animations/internet.json",
              repeat: true,
              width: kWidth(size),
            ),
            heightBox(.02),
            CustomText(
              text: "No Internet Connection!!",
              textStyle: KTextStyles().normal(),
            ),
          ],
        ),
      ),
    );
  }
}

class ErrorLoader extends StatelessWidget {
  const ErrorLoader({
    Key? key,
    this.isCenter = true,
    this.size = .4,
    required this.function,
    this.buttonColor = KColors.kPrimary,
  }) : super(key: key);
  final bool isCenter;
  final double size;
  final Color buttonColor;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: isCenter ? Alignment.center : Alignment.topCenter,
      child: SizedBox(
        height: kHeight(.28),
        child: Column(
          children: [
            LottieBuilder.asset(
              "assets/animations/error.json",
              width: kWidth(size),
            ),
            heightBox(.02),
            PrimaryButton(
              text: "Retry",
              function: function,
              color: buttonColor,
              width: .4,
            ),
          ],
        ),
      ),
    );
  }
}
