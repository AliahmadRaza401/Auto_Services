import 'package:auto_services/widgets/widgets_imports.dart';

class ConsumerService extends StatelessWidget {
  const ConsumerService({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          children: [
            Container(
              height: kHeight(.55),
              width: context.width,
              decoration: BoxDecoration(
                color: KColors.kPrimary,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(kWidth(.04)),
                ),
              ),
              child: Column(
                children: [
                  heightBox(.05),
                  GestureDetector(
                    onTap: () {
                      Get.toNamed("/consumerprofile");
                    },
                    child: Container(
                      height: kHeight(.11),
                      width: kWidth(.9),
                      padding: EdgeInsets.all(kWidth(0.02)),
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: KColors.kWhite,
                            radius: kHeight(.04),
                            foregroundImage: const AssetImage(
                              "assets/images/carmechanic.jpeg",
                            ),
                          ),
                          // Container(
                          //   height: kHeight(0.08),
                          //   width: kWidth(0.2),
                          //   decoration: BoxDecoration(
                          //       shape: BoxShape.circle, color: KColors.kGreen),
                          //   child: ClipRRect(
                          //       clipBehavior: Clip.antiAlias,
                          //       child: Image.asset("assets/images/carmechanic.jpeg")),
                          // ),
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
                  ),
                  Divider(
                    thickness: 1,
                    color: KColors.kWhite,
                    endIndent: kWidth(.1),
                    indent: kWidth(.1),
                  ),
                  heightBox(.03),
                  const ConsumerServiceTile(
                      img: "assets/icons/consumer.png",
                      title: "No. of Mechanics",
                      subtitle: "onBoard: 39"),
                  const ConsumerServiceTile(
                      img: "assets/icons/consumer2.png",
                      title: "No. of Users Registered",
                      subtitle: "on the App: 3926"),
                  const ConsumerServiceTile(
                      img: "assets/icons/consumer3.png",
                      title: "No. of Service Booked",
                      subtitle: "Today : 870"),
                ],
              ),
            ),
            heightBox(.1),
            OutlineIconTextButton2(
              height: .06,
              borderRadius: .02,
              width: .7,
              text: "Consumer Service",
              img: "assets/icons/consumer4.png",
              function: () {
                Get.toNamed("/serviceapproval");
              },
            ),
            heightBox(.02),
            OutlineIconTextButton2(
              height: .06,
              borderRadius: .02,
              width: .7,
              text: "See Booking",
              img: "assets/icons/consumer5.png",
              function: () {
                Get.toNamed("/seebooking");
              },
            )
          ],
        ),
      ),
    );
  }
}

class ConsumerServiceTile extends StatelessWidget {
  final String img, title, subtitle;
  const ConsumerServiceTile({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kHeight(.09),
      width: kWidth(.75),
      padding: EdgeInsets.all(kWidth(0.02)),
      alignment: Alignment.center,
      child: Row(
        children: [
          Container(
            height: kHeight(.1),
            width: kWidth(.14),
            decoration: BoxDecoration(
                color: KColors.noColor,
                shape: BoxShape.circle,
                border: Border.all(color: KColors.kWhite)),
            alignment: Alignment.center,
            child: Image.asset(
              img,
              height: kHeight(.025),
            ),
          ),
          widthBox(.04),
          SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: kWidth(.5),
                  child: CustomText(
                      alignText: TextAlign.center,
                      text: title,
                      textStyle: KTextStyles().normal(
                          textColor: KColors.kWhite,
                          fontSize: 18,
                          fontWeight: FontWeight.w500)),
                ),
                CustomText(
                  alignText: TextAlign.center,
                  text: subtitle,
                  textStyle: KTextStyles().normal(
                      textColor: KColors.kWhite,
                      fontSize: 18,
                      fontWeight: FontWeight.w500),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
