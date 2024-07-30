import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class ReportOfTest extends StatelessWidget {
  const ReportOfTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Report of Test", actions: []),
      body: Center(
        child: SizedBox(
          height: context.height,
          width: kWidth(.9),
          child: Column(
            children: [
              heightBox(.02),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const ReportTestBox();
                  },
                  separatorBuilder: (context, index) => heightBox(.04),
                  itemCount: 4),
            ],
          ),
        ),
      ),
    );
  }
}

class ReportTestBox extends StatelessWidget {
  const ReportTestBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              "assets/icons/accepttow.png",
              height: kHeight(.06),
            ),
            widthBox(.04),
            CustomText(
                text: "Date & Time",
                textStyle: KTextStyles().normal(fontSize: 16)),
          ],
        ),
        heightBox(.01),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            OutlineButton(
              borderRadius: .03,
              width: .42,
              text: "Delete",
              function: () {},
            ),
            PrimaryButton(
              width: .42,
              text: "View",
              function: () {
                Get.toNamed("/testreport");
              },
            )
          ],
        )
      ],
    );
  }
}
