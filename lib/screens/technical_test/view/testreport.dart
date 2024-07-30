import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class Testreport extends StatelessWidget {
  const Testreport({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Test Report", actions: []),
      body: Center(
        child: SizedBox(
          height: context.height,
          width: kWidth(.9),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(
                    text: "General Inspection",
                    textStyle: KTextStyles().normal(
                        fontSize: 16,
                        textColor: KColors.kPrimary,
                        fontWeight: FontWeight.bold)),
                heightBox(.04),
                const TestReportTile(
                    title: "Engine Oil Level Check", lable: "Yes"),
                const TestReportTile(
                    title: "Coolant Level Check", lable: "Yes"),
                const TestReportTile(
                    title: "Battery Health Check", lable: "Yes"),
                const TestReportTile(
                    title: "Tire Pressure Check", lable: "Yes"),
                const TestReportTile(
                    title: "Tire Tread Depth Check", lable: "Yes"),
                const TestReportTile(
                    title: "Exterior Lights Check", lable: "Yes"),
                heightBox(.02),
                CustomText(
                    text: "Engine Health",
                    textStyle: KTextStyles().normal(
                        fontSize: 16,
                        textColor: KColors.kPrimary,
                        fontWeight: FontWeight.bold)),
                heightBox(.04),
                const TestReportTile(title: "Engine Light Check", lable: "Yes"),
                const TestReportTile(title: "Engine Noise Check", lable: "Yes"),
                const TestReportTile(
                    title: "Engine Fluid Leaks Check", lable: "Yes"),
                const TestReportTile(
                    title: "Belts and Hoses Inspection", lable: "Yes"),
                const TestReportTile(title: "Air Filter Check", lable: "Yes"),
                CustomText(
                    text: "Brake System",
                    textStyle: KTextStyles().normal(
                        fontSize: 16,
                        textColor: KColors.kPrimary,
                        fontWeight: FontWeight.bold)),
                heightBox(.04),
                const TestReportTile(
                    title: "Brake Pads and Rotors Check", lable: "Yes"),
                const TestReportTile(title: "Brake Fluid Check", lable: "Yes"),
                const TestReportTile(title: "Brake Lines Check", lable: "Yes"),
                const TestReportTile(
                    title: "Brake Performance Test", lable: "Yes"),
                heightBox(.02),
                CustomText(
                    text: "Suspension and Steering",
                    textStyle: KTextStyles().normal(
                        fontSize: 16,
                        textColor: KColors.kPrimary,
                        fontWeight: FontWeight.bold)),
                heightBox(.04),
                const TestReportTile(
                    title: "Shock Absorbers Leaks Check", lable: "Yes"),
                const TestReportTile(
                    title: "Steering Components Check", lable: "Yes"),
                const TestReportTile(
                    title: "Wheel Alignment Check", lable: "Yes"),
                heightBox(.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
