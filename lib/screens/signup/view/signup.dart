import 'package:auto_services/screens/signup/controller/signup_controller.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final SignUpController controller = Get.put(SignUpController());
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
              heightBox(.05),
              SizedBox(
                width: kWidth(.9),
                child: Column(
                  children: [
                    CustomTextField(
                      controller: nameController,
                      label: "Name",
                      hintText: "",
                      keyboardType: TextInputType.emailAddress,
                      hasPrefix: false,
                      hasSuffix: false,
                      suffixIcon: const Icon(null),
                      prefixIcon: const Icon(null),
                    ),
                    heightBox(0.01),
                    CustomTextField(
                      controller: emailController,
                      label: "Email/Phone No.",
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
                      controller: passwordController,
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
                      child: CustomText(
                          text: "Forget password ?",
                          textStyle: KTextStyles()
                              .small(fontSize: 12, textColor: KColors.kTcolor)),
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
                      ],
                    ),
                    heightBox(.02),
                    Row(
                      children: [
                        Obx(() {
                          return Checkbox(
                            fillColor: WidgetStateProperty.resolveWith(
                                (states) => KColors.kPrimary),
                            checkColor: KColors.kWhite,
                            value: controller.isChecked.value,
                            onChanged: (value) {
                              controller.toggleCheckbox();
                            },
                          );
                        }),
                        SizedBox(
                          width: kWidth(.65),
                          child: CustomRichText(
                            normalFontSize: 12,
                            focusedFontSize: 12,
                            maxLines: 2,
                            normalColor: const Color(0xff3B4054),
                            focusedColor: KColors.kPrimary,
                            normalText: "I'm agree to the ",
                            focusedText: "Terms of Service and Privacy Policy",
                            nextpage: () {
                              Get.toNamed("login");
                            },
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              heightBox(0.05),
              PrimaryButton(
                width: 0.9,
                text: "Create Account",
                function: () {},
              ),
              heightBox(0.05),
              CustomRichText(
                normalColor: const Color(0xff3B4054),
                focusedColor: KColors.kPrimary,
                normalText: "Already have an account? ",
                focusedText: "Sign in",
                nextpage: () {
                  Get.toNamed("login");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
