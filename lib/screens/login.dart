import 'package:auto_services/widgets/widgets_imports.dart';

class Login extends StatelessWidget {
  Login({super.key});
  final TextEditingController emailController = TextEditingController();
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
        body: SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                  text: "Log In",
                  textStyle: KTextStyles().heading(
                      fontSize: 32,
                      fontWeight: FontWeight.w600,
                      textColor: KColors.kPrimary)),
              CustomText(
                  text: "Welcome back",
                  textStyle: KTextStyles().heading(
                      fontSize: 34,
                      fontWeight: FontWeight.w500,
                      textColor: KColors.kTertiary)),
              CustomText(
                  text: "Sign in to access your account",
                  textStyle: KTextStyles().normal(
                      fontWeight: FontWeight.w500,
                      textColor: KColors.kTertiary)),
              heightBox(.02),
              SizedBox(
                width: kWidth(.9),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: emailController,
                      label: "Email Address",
                      hintText: "",
                      keyboardType: TextInputType.emailAddress,
                      hasPrefix: false,
                      hasSuffix: false,
                      suffixIcon: const Icon(null),
                      prefixIcon: const Icon(null),
                    ),
                    heightBox(.01),
                    CustomTextField(
                      isCPassword: true,
                      isPassword: true,
                      controller: emailController,
                      label: "Password",
                      hintText: "",
                      keyboardType: TextInputType.emailAddress,
                      hasPrefix: false,
                      hasSuffix: true,
                      suffixIcon: const Icon(null),
                      prefixIcon: const Icon(null),
                    ),
                    heightBox(0.01),
                    Align(
                      alignment: Alignment.centerRight,
                      child: GestureDetector(
                        onTap: () {
                          Get.toNamed("/pages");
                        },
                        child: CustomText(
                            text: "Forget password ?",
                            textStyle: KTextStyles().small(
                                fontSize: 12, textColor: KColors.kTcolor)),
                      ),
                    ),
                    heightBox(.02),
                    Divider(
                      thickness: 1,
                      color: KColors.kTcolor.withOpacity(.2),
                    ),
                    heightBox(0.02),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        // SizedBox(
                        //   child: Row(
                        //     children: [
                        //       Icon(
                        //         Icons.facebook,
                        //         color: Color(0xff1877F2),
                        //         size: kHeight(.04),
                        //       ),
                        //       widthBox(.04),
                        //       CustomText(
                        //           text: "FACEBOOK",
                        //           textStyle: KTextStyles().normal(
                        //               fontSize: 16, fontWeight: FontWeight.w500))
                        //     ],
                        //   ),
                        // ),
                        IconTextButton2(
                          width: .4,
                          color: KColors.kWhite,
                          text: "FACEBOOK",
                          img: "assets/images/facebook.png",
                          function: () {},
                        ),
                        IconTextButton2(
                          width: .4,
                          color: KColors.kWhite,
                          text: "GOOGLE",
                          img: "assets/images/G.png",
                          function: () {},
                        ),

                        // SizedBox(
                        //   child: Row(
                        //     children: [
                        //       Icon(

                        //         size: kHeight(.04),
                        //       ),
                        //       widthBox(.04),
                        //       CustomText(
                        //           text: "GOOGLE",
                        //           textStyle: KTextStyles().normal(
                        //               fontSize: 16, fontWeight: FontWeight.w500))
                        //     ],
                        //   ),
                        // )
                      ],
                    )
                  ],
                ),
              ),
              heightBox(0.05),
              PrimaryButton(
                width: 0.9,
                text: "Log In",
                function: () {
                  Get.toNamed("/consumerservice");
                },
              ),
              heightBox(0.05),
              CustomRichText(
                normalColor: const Color(0xff3B4054),
                focusedColor: KColors.kPrimary,
                normalText: "Don't have an account? ",
                focusedText: "Sign Up",
                nextpage: () {
                  Get.toNamed("signup");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
