import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class GeneralInspection extends StatelessWidget {
  const GeneralInspection({super.key});

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
                  text: "General Inspection",
                  textStyle: KTextStyles().normal(
                    fontSize: 16,
                    textColor: KColors.kPrimary,
                  )),
              heightBox(.04),
              const TechnicalTestTileDrop(
                  title: "Engine Oil Level Check", lable: "Yes"),
              const TechnicalTestTileDrop(
                  title: "Coolant Level Check", lable: "Yes"),
              const TechnicalTestTileDrop(
                  title: "Battery Health Check", lable: "Yes"),
              const TechnicalTestTileDrop(
                  title: "Tire Pressure Check", lable: "Yes"),
              const TechnicalTestTileDrop(
                  title: "Tire Tread Depth Check", lable: "Yes"),
              const TechnicalTestTileDrop(
                  title: "Exterior Lights Check", lable: "Yes"),
              const Spacer(),
              Center(
                child: CustomText(
                    text: "Step 02 of 05",
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
                  Get.toNamed("/enginehealth");
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
