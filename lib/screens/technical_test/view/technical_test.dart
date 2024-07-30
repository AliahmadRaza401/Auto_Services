import 'package:auto_services/widgets/widgets_imports.dart';

class TechnicalTest extends StatelessWidget {
  const TechnicalTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              maxLines: 2,
              text: "Vehicle",
              textStyle: KTextStyles().normal(
                  textColor: KColors.kBlack,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
            CustomText(
              maxLines: 2,
              text: "Technical Test",
              textStyle: KTextStyles().normal(
                  textColor: KColors.kBlack,
                  fontSize: 32,
                  fontWeight: FontWeight.w600),
            ),
            heightBox(.04),
            Image.asset(
              "assets/images/vehicletechnical.png",
              height: kHeight(.25),
              width: kWidth(.9),
            ),
            heightBox(.04),
            PrimaryButton(
              width: .8,
              text: "Book Now",
              function: () {
                Get.toNamed("/technicaltesthome");
              },
            ),
          ],
        ),
      ),
    );
  }
}
