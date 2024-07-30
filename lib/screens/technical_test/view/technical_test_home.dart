import 'package:auto_services/widgets/widgets_imports.dart';

class TechnicalTestHome extends StatelessWidget {
  const TechnicalTestHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(
                  color: KColors.kPrimary,
                  borderRadius: BorderRadius.vertical(
                      bottom: Radius.circular(kWidth(.04)))),
              height: kHeight(.2),
              width: context.width,
              alignment: Alignment.center,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor: KColors.kWhite,
                    radius: kHeight(.04),
                    foregroundImage: const AssetImage(
                      "assets/images/carmechanic.jpeg",
                    ),
                  ),
                  widthBox(.04),
                  SizedBox(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: "Waleed Paracha",
                            textStyle: KTextStyles().normal(
                                textColor: KColors.kWhite,
                                fontSize: 20,
                                fontWeight: FontWeight.w600)),
                        CustomText(
                          text: "Admin",
                          textStyle: KTextStyles().normal(
                              textColor: KColors.kWhite,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            heightBox(.2),
            OutlineIconTextButton2(
              height: .06,
              borderRadius: .02,
              width: .9,
              text: "Book Technical Test",
              img: "assets/icons/consumer5.png",
              function: () {
                Get.toNamed("/booktechnicaltest");
              },
            ),
            heightBox(.02),
            OutlineIconTextButton2(
              height: .06,
              borderRadius: .02,
              width: .9,
              text: "See the report of test",
              img: "assets/icons/consumer4.png",
              function: () {
                Get.toNamed("/reportoftest");
              },
            ),
          ],
        ),
      ),
    );
  }
}
