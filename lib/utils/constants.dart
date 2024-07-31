import 'package:auto_services/common_models/user.dart';

import '../widgets/widgets_imports.dart';

/// App Constants

String appVersion = "0.0.0";

/// GetX Constants

var obscureText = true.obs;
var obscureTextCP = true.obs;
var defaultObscureText = false.obs;
final selectedService = Rxn<String>();
final userData = Rxn<UserModel>();

/// API Constants

const Map<String, String> headers = {
  'Content-Type': 'application/json',
  'Accept': 'application/json',
};

class TechnicalTestTileDrop extends StatelessWidget {
  final String title, lable;

  const TechnicalTestTileDrop({super.key, required this.title, required this.lable});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, textStyle: KTextStyles().normal()),
        heightBox(.005),
        AbsorbPointer(
          absorbing: true,
          child: CustomTextField2(
            suffixIconColor: KColors.kBlack,
            themeColor: KColors.kBlack,
            hasPrefix: false,
            hasSuffix: true,
            controller: TextEditingController(),
            label: lable,
            hintText: "",
            keyboardType: TextInputType.text,
            suffixIcon: const Icon(
              CupertinoIcons.chevron_down,
              color: KColors.kBlack,
            ),
            prefixIcon: const Icon(null),
          ),
        ),
        heightBox(.02),
      ],
    );
  }
}

class TechnicalTestTile extends StatelessWidget {
  final String title, lable;
  final TextEditingController controller;

  const TechnicalTestTile({
    super.key,
    required this.title,
    required this.lable,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, textStyle: KTextStyles().normal()),
        heightBox(.005),
        CustomTextField2(
          suffixIconColor: KColors.kBlack,
          themeColor: KColors.kBlack,
          hasPrefix: false,
          hasSuffix: false,
          controller: controller,
          label: lable,
          hintText: "",
          keyboardType: TextInputType.text,
          suffixIcon: const Icon(null),
          prefixIcon: const Icon(null),
        ),
        heightBox(.02),
      ],
    );
  }
}

class TestReportTile extends StatelessWidget {
  final String title, lable;

  const TestReportTile({
    super.key,
    required this.title,
    required this.lable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, textStyle: KTextStyles().normal()),
        heightBox(.005),
        Align(
          alignment: Alignment.centerRight,
          child: SizedBox(
            width: kWidth(.85),
            child: CustomText(
                alignText: TextAlign.left,
                text: lable,
                textStyle: KTextStyles().normal(
                  textColor: KColors.kTcolor,
                )),
          ),
        ),
        // AbsorbPointer(
        //   absorbing: true,
        //   child: CustomTextField2(
        //     suffixIconColor: KColors.kBlack,
        //     themeColor: KColors.kBlack,
        //     hasPrefix: false,
        //     hasSuffix: false,
        //     controller: TextEditingController(),
        //     label: lable,
        //     hintText: "",
        //     keyboardType: TextInputType.text,
        //     suffixIcon: Icon(null),
        //     prefixIcon: Icon(null),
        //   ),
        // ),
        heightBox(.02),
      ],
    );
  }
}
