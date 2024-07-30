import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class EngineHealth extends StatelessWidget {
  const EngineHealth({super.key});

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
                  text: "Engine Health",
                  textStyle: KTextStyles().normal(
                      fontSize: 16,
                      textColor: KColors.kPrimary,
                      fontWeight: FontWeight.bold)),
              heightBox(.04),
              const TechnicalTestTileDrop(
                  title: "Engine Light Check", lable: "Yes"),
              const TechnicalTestTileDrop(
                  title: "Engine Noise Check", lable: "Yes"),
              const TechnicalTestTileDrop(
                  title: "Engine Fluid Leaks Check", lable: "Yes"),
              const TechnicalTestTileDrop(
                  title: "Belts and Hoses Inspection", lable: "Yes"),
              const TechnicalTestTileDrop(
                  title: "Air Filter Check", lable: "Yes"),
              const Spacer(),
              Center(
                child: CustomText(
                    text: "Step 03 of 05",
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
                  Get.toNamed("/brakesystem");
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
