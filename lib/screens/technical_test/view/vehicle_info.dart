import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class VehicleInfo extends StatelessWidget {
  VehicleInfo({super.key});
  final TextEditingController manufactureController = TextEditingController();
  final TextEditingController vinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
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
                    text: "Vehicle Information Section",
                    textStyle: KTextStyles().normal(
                      fontSize: 16,
                      textColor: KColors.kPrimary,
                    )),
                heightBox(.04),
                const TechnicalTestTileDrop(
                    title: "Vehicle Manufacturer", lable: "volkswagen"),
                const TechnicalTestTileDrop(
                    title: "Specific Model", lable: "Civic"),
                TechnicalTestTile(
                    title: "Year of Manufacture",
                    lable: "2015",
                    controller: manufactureController),
                TechnicalTestTile(
                    title: "VIN (Vehicle Identification Number)",
                    lable: "5545848771517-H",
                    controller: vinController),
                const Spacer(),
                Center(
                  child: CustomText(
                      text: "Step 01 of 05",
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
                    Get.toNamed("/generalinspection");
                  },
                ),
                heightBox(.02),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
