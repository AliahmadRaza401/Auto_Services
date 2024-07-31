import 'package:auto_services/screens/technical_test/controller/technical_test_controller.dart';
import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class TechnicalTestReportScreen extends StatelessWidget {
  const TechnicalTestReportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TechnicalTestController.instance;
    return Scaffold(
      appBar: const CustomAppBar(title: "Car Technical Test Report", actions: []),
      body: Center(
        child: Obx(() {
          if (controller.isLoading.value) {
            return const CircularProgressIndicator();
          } else {
            return SizedBox(
              height: context.height,
              width: kWidth(.9),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "General Inspection", textStyle: KTextStyles().normal(fontSize: 16, textColor: KColors.kPrimary, fontWeight: FontWeight.bold)),
                    heightBox(.02),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Engine Oil Level Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.engineOilCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.01),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Coolant Level Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.coolantLevelCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.01),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Battery Health Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.batteryHealthCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.01),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Tire Pressure Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.tirePressureCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.01),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Tire Tread Depth Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.tireTreadDepthCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.01),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Exterior Lights Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.exteriorLightCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.02),
                    CustomText(text: "Engine Health", textStyle: KTextStyles().normal(fontSize: 16, textColor: KColors.kPrimary, fontWeight: FontWeight.bold)),
                    heightBox(.02),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Engine Light Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.engineLightCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.01),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Engine Noise Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.engineNoiseCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.01),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Engine Fluid Leaks Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.engineFluidLeakCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.01),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Belts and Hoses Inspection', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.beltAndHoseCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.01),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Air Filter Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.airFilterCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.02),
                    CustomText(text: "Brake System", textStyle: KTextStyles().normal(fontSize: 16, textColor: KColors.kPrimary, fontWeight: FontWeight.bold)),
                    heightBox(.02),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Brake Pads and Rotors Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.brakePadAndRotorCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.01),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Brake Fluid Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.brakeFluidCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.01),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Brake Lines Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.brakeLinesCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.01),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Brake Performance Test', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.brakePerformanceCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.02),
                    CustomText(text: "Suspension and Steering", textStyle: KTextStyles().normal(fontSize: 16, textColor: KColors.kPrimary, fontWeight: FontWeight.bold)),
                    heightBox(.02),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Shock Absorbers Leaks Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.shockAbsorberLeakCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.01),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Steering Components Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.steeringComponentCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.01),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: 'Wheel Alignment Check', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                        heightBox(.005),
                        Container(
                          height: 55,
                          width: context.width,
                          padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(kWidth(.04)),
                            border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                          ),
                          alignment: Alignment.centerLeft,
                          child: Obx(() {
                            return Text(controller.selectedReport.value?.wheelAlignmentCheck ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                          }),
                        ),
                      ],
                    ),
                    heightBox(.04),
                  ],
                ),
              ),
            );
          }
        }),
      ),
    );
  }
}
