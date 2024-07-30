import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class BookTechnicalTest extends StatelessWidget {
  BookTechnicalTest({super.key});
  final TextEditingController manufactureController = TextEditingController();
  final TextEditingController dateController = TextEditingController();

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
                  text: "Enter your Booking Details",
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
                  title: "Preferred Date",
                  lable: "01 June 2024",
                  controller: dateController),
              const TechnicalTestTileDrop(
                title: "Preferred Time",
                lable: "03:30 Pm",
              ),
              const Spacer(),
              PrimaryButton(
                height: .07,
                width: .9,
                text: "Continue",
                function: () {
                  Get.bottomSheet(
                      isScrollControlled: true,
                      Container(
                        height: kHeight(.4),
                        width: kWidth(.9),
                        decoration: BoxDecoration(
                          color: KColors.kWhite,
                          borderRadius: BorderRadius.vertical(
                              top: Radius.circular(kWidth(.04))),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Divider(
                              thickness: 3,
                              color: KColors.kBorderColor,
                              indent: kWidth(.35),
                              endIndent: kWidth(.35),
                            ),
                            const Divider(
                              thickness: 1,
                              color: KColors.kBorderColor,
                            ),
                            Image.asset(
                              "assets/icons/accepttow.png",
                              height: kHeight(.15),
                            ),
                            heightBox(.01),
                            CustomText(
                                text: "Technical Test report is ready",
                                textStyle: KTextStyles().normal(fontSize: 20)),
                            heightBox(.01),
                            PrimaryButton(
                              width: .8,
                              text: "View",
                              function: () {
                                Get.toNamed("/vehicleinfo");
                              },
                            ),
                            heightBox(.01),
                            OutlineButton(
                              width: .8,
                              borderRadius: .03,
                              text: "Share as Pdf",
                              function: () {},
                            ),
                          ],
                        ),
                      ));
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
