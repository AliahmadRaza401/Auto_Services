import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

final TextEditingController passwordController = TextEditingController();
final TextEditingController confirmPasswordController = TextEditingController();

class Resetpassword extends StatelessWidget {
  const Resetpassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "", actions: []),
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
                isCPassword: true,
                isPassword: true,
                lableColor: KColors.kTcolor,
                controller: passwordController,
                label: "Password",
                hintText: "",
                keyboardType: TextInputType.emailAddress,
                suffixIcon: const Icon(null),
                prefixIcon: const Icon(null),
                hasPrefix: false,
                hasSuffix: true,
              ),
              heightBox(.01),
              CustomTextField2(
                isPassword: true,
                isCPassword: true,
                lableColor: KColors.kTcolor,
                controller: confirmPasswordController,
                label: "Confirm Password",
                hintText: "",
                keyboardType: TextInputType.emailAddress,
                prefixIcon: const Icon(null),
                hasPrefix: false,
                hasSuffix: true,
                suffixIcon: const Icon(null),
              ),
              heightBox(.04),
              PrimaryButton(
                height: .06,
                width: .9,
                text: "Submit",
                function: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}
