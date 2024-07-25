import 'package:auto_services/screens/auth/controller/registration_controller.dart';
import 'package:auto_services/screens/auth/view/login.dart';
import 'package:auto_services/utils/validation.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class RegistrationScreen extends StatelessWidget {
  const RegistrationScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegistrationController());
    return GestureDetector(
      behavior: HitTestBehavior.translucent,
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: SizedBox(
            height: context.height,
            width: context.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                heightBox(.02),
                CustomText(text: "Sign Up", textStyle: KTextStyles().heading(fontSize: 32, fontWeight: FontWeight.w600, textColor: KColors.kPrimary)),
                heightBox(.03),
                SizedBox(
                  width: kWidth(.9),
                  child: Form(
                    key: controller.registerFormKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: controller.nameController,
                          label: "Name",
                          hintText: "",
                          keyboardType: TextInputType.name,
                          hasPrefix: false,
                          hasSuffix: false,
                          suffixIcon: const Icon(null),
                          prefixIcon: const Icon(null),
                          function: (val) => KValidator.validateEmptyField('Name', val),
                        ),
                        heightBox(0.01),
                        CustomTextField(
                          controller: controller.emailController,
                          label: "Email",
                          hintText: "",
                          keyboardType: TextInputType.emailAddress,
                          hasPrefix: false,
                          hasSuffix: false,
                          suffixIcon: const Icon(null),
                          prefixIcon: const Icon(null),
                          function: (val) => KValidator.validateEmail(val),
                        ),
                        heightBox(.01),
                        CustomTextField(
                          controller: controller.phoneController,
                          label: "Phone No.",
                          hintText: "",
                          keyboardType: TextInputType.phone,
                          hasPrefix: false,
                          hasSuffix: false,
                          suffixIcon: const Icon(null),
                          prefixIcon: const Icon(null),
                          function: (val) => KValidator.validateEmptyField('Phone No.', val),
                        ),
                        heightBox(.01),
                        CustomTextField(
                          isCPassword: true,
                          isPassword: true,
                          controller: controller.passwordController,
                          label: "Password",
                          hintText: "",
                          keyboardType: TextInputType.visiblePassword,
                          hasPrefix: false,
                          hasSuffix: true,
                          suffixIcon: const Icon(null),
                          prefixIcon: const Icon(null),
                          function: (val) => KValidator.validatePassword(val),
                        ),
                        heightBox(0.01),
                        Align(
                          alignment: Alignment.centerRight,
                          child: CustomText(text: "Forget password ?", textStyle: KTextStyles().small(fontSize: 12, textColor: KColors.kTcolor)),
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
                                fillColor: WidgetStateProperty.resolveWith((states) => KColors.kPrimary),
                                checkColor: KColors.kWhite,
                                value: controller.agreeTermsCheck.value,
                                onChanged: (value) => controller.agreeTermsCheck.value = !controller.agreeTermsCheck.value,
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
                                nextpage: () {},
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                heightBox(0.05),
                PrimaryButton(
                  width: 0.9,
                  text: "Create Account",
                  function: () => controller.registerFunc(),
                ),
                heightBox(0.05),
                CustomRichText(
                  normalColor: const Color(0xff3B4054),
                  focusedColor: KColors.kPrimary,
                  normalText: "Already have an account? ",
                  focusedText: "Sign in",
                  nextpage: () => Get.to(() => const LoginScreen()),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
