import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class BrakeSystem extends StatelessWidget {
  const BrakeSystem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Technical Test", actions: []),
      body: Center(
        child: SizedBox(
          height: context.height,
          width: kWidth(.9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox(.02),
              CustomText(
                  text: "Brake System",
                  textStyle: KTextStyles().normal(
                      fontSize: 16,
                      textColor: KColors.kPrimary,
                      fontWeight: FontWeight.bold)),
              heightBox(.04),
              const TechnicalTestTileDrop(
                  title: "Brake Pads and Rotors Check", lable: "Yes"),
              const TechnicalTestTileDrop(
                  title: "Brake Fluid Check", lable: "Yes"),
              const TechnicalTestTileDrop(
                  title: "Brake Lines Check", lable: "Yes"),
              const TechnicalTestTileDrop(
                  title: "Brake Performance Test", lable: "Yes"),
              const Spacer(),
              Center(
                child: CustomText(
                    text: "Step 04 of 05",
                    textStyle: KTextStyles().normal(
                      fontSize: 16,
                      textColor: KColors.kPrimary,
                    )),
              ),
              heightBox(.01),
              PrimaryButton(
                height: .07,
                width: .9,
                text: "Continue",
                function: () {
                  Get.toNamed("/suspensionsteering");
                },
              ),
              heightBox(.02),
            ],
          ),
        ),
      ),
    );
  }
}
