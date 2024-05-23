import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';
import 'package:flutter/cupertino.dart';

final TextEditingController emailController = TextEditingController();

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        appBar: CustomAppBar(title: "", actions: []),
        body: Center(
          child: SizedBox(
            height: context.height,
            width: kWidth(.9),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomText(
                    text: "Forget Pasword",
                    textStyle: KTextStyles().heading(
                      textColor: KColors.kPrimary,
                      fontSize: 32,
                    )),
                heightBox(.005),
                CustomText(
                    maxLines: 2,
                    text:
                        " It was popularised in the 1960s with the release of Letraset sheetscontaining Lorem Ipsum.",
                    textStyle: KTextStyles().heading(
                      textColor: KColors.kTcolor,
                      fontSize: 14,
                    )),
                heightBox(.04),
                CustomTextField2(
                  lableColor: KColors.kTcolor,
                  controller: emailController,
                  label: "Email I'D/ Mobile Number",
                  hintText: "",
                  keyboardType: TextInputType.emailAddress,
                  suffixIcon: Icon(null),
                  prefixIcon: Icon(null),
                  hasPrefix: false,
                  hasSuffix: false,
                ),
                heightBox(.04),
                PrimaryButton(
                  height: .06,
                  width: .9,
                  text: "Continue",
                  function: () {
                    Get.toNamed("/verification");
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
