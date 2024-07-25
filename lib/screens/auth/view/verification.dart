import 'package:auto_services/widgets/widgets_imports.dart';
import 'package:pinput/pinput.dart';

class VerificationScreen extends StatelessWidget {
  VerificationScreen({super.key});
  final TextEditingController pinController = TextEditingController();
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
        body: Center(
          child: SizedBox(
            height: context.height,
            width: kWidth(.9),
            child: Form(
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      //login text
                      CustomText(
                          text: "Enter OTP",
                          textStyle: KTextStyles().heading(
                            textColor: KColors.kPrimary,
                            fontSize: 32,
                          )),
                      heightBox(.005),
                      CustomText(
                          maxLines: 2,
                          text:
                              "Enter the OTP code we just sent\nyou on your registered Email/Phone number",
                          textStyle: KTextStyles().heading(
                            textColor: KColors.kTcolor,
                            fontSize: 14,
                          )),
                      heightBox(.05),
                      //pin field
                      Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: kWidth(.05),
                        ),
                        child: Container(
                          width: kWidth(.9),
                          clipBehavior: Clip.antiAlias,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.03)),
                          ),
                          child: Pinput(
                            keyboardType: TextInputType.visiblePassword,
                            autofocus: true,
                            length: 6,
                            obscureText: true,
                            controller: pinController,
                            defaultPinTheme: PinTheme(
                              width: kWidth(.2),
                              height: kWidth(.16),
                              textStyle: const TextStyle(
                                fontSize: 18,
                                color: KColors.kPrimary,
                                fontWeight: FontWeight.w600,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: KColors.kBorderColor),
                                color: KColors.kWhite,
                              ),
                            ),
                          ),
                        ),
                      ),
                      heightBox(.08),
                      // login button
                      PrimaryButton(
                        borderRadius: .03,
                        width: .9,
                        text: 'Reset Password',
                        function: () async {
                          Get.toNamed("/resetpassword");
                        },
                      ),
                      heightBox(.05),
                      CustomRichText(
                        normalColor: const Color(0xff3B4054),
                        focusedColor: KColors.kPrimary,
                        normalText: "Didn't get OTP? ",
                        focusedText: "Resend OTP",
                        nextpage: () {},
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
