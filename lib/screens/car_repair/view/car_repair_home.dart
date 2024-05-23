import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class CarRepairHome extends StatelessWidget {
  const CarRepairHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "", actions: []),
      body: Center(
        child: SizedBox(
          height: context.height,
          width: kWidth(0.8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox(0.04),
              CustomText(
                alignText: TextAlign.left,
                maxLines: 3,
                text: "Total Car Care &\nAuto Repair\nServices",
                textStyle: KTextStyles().subHeading(
                    fontSize: 36,
                    fontWeight: FontWeight.w700,
                    textColor: KColors.kPrimary),
              ),
              heightBox(0.04),
              PrimaryButton(
                borderRadius: .06,
                fontsize: 24,
                height: 0.08,
                width: .5,
                text: "Book Now",
                function: () {
                  Get.bottomSheet(
                      isScrollControlled: true,
                      Container(
                        height: kHeight(0.5),
                        width: kWidth(.9),
                        decoration: BoxDecoration(
                          color: KColors.kWhite,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(
                            kWidth(.08),
                          )),
                        ),
                        child: Column(
                          children: [
                            heightBox(.008),
                            Center(
                              child: Divider(
                                thickness: 4,
                                color: KColors.kBorderColor,
                                indent: kHeight(.18),
                                endIndent: kHeight(.18),
                              ),
                            ),
                            const Divider(
                              thickness: 1,
                              color: KColors.kBorderColor,
                            ),
                            heightBox(.05),
                            Image.asset(
                              "assets/icons/accepttow.png",
                              height: kHeight(0.15),
                            ),
                            heightBox(.05),
                            CustomText(
                                text: "A new Booking is received",
                                textStyle: KTextStyles().normal(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w800,
                                )),
                            heightBox(.05),
                            PrimaryButton(
                              fontsize: 20,
                              width: .7,
                              text: "View",
                              function: () {
                                Get.toNamed("/booknow");
                              },
                            )
                          ],
                        ),
                      ));
                },
              ),
              heightBox(0.04),
              Image.asset(
                "assets/images/carrepair.PNG",
                height: kHeight(0.35),
                fit: BoxFit.fitWidth,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
