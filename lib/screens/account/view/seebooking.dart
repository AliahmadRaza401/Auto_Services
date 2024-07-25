import 'package:auto_services/widgets/widgets_imports.dart';

class SeeBooking extends StatelessWidget {
  const SeeBooking({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              heightBox(.02),
              ListView.separated(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const Center(child: SeeBookingBox());
                  },
                  separatorBuilder: (context, index) => heightBox(0.02),
                  itemCount: 3)
            ],
          ),
        ),
      ),
    );
  }
}

class SeeBookingBox extends StatelessWidget {
  const SeeBookingBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kHeight(.3),
      width: kWidth(.9),
      decoration: BoxDecoration(
          border: Border.all(color: KColors.kBorderColor),
          borderRadius: BorderRadius.circular(kWidth(.04))),
      padding: EdgeInsets.all(kWidth(.02)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomText(
              text: "A Booking for 3 PM Today",
              textStyle: KTextStyles().normal(
                  textColor: KColors.kPrimary,
                  fontSize: 18,
                  fontWeight: FontWeight.w600)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const BookingPersonsBox(
                  img: "assets/images/bookingperson.jpeg",
                  title: "Alina Khan",
                  subtitle: "User Name"),
              Icon(
                Icons.swap_horiz,
                size: kHeight(.04),
              ),
              const BookingPersonsBox(
                  img: "assets/images/carmechanic.jpeg",
                  title: "Waleed Paracha",
                  subtitle: "Car Mechanic"),
            ],
          ),
          PrimaryButton(
            fontsize: 12,
            width: .8,
            text: "See Booking Details",
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
                            text: "The Service Has Been Done",
                            textStyle: KTextStyles().normal(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                            )),
                        heightBox(.05),
                        PrimaryButton(
                          color: KColors.kTextcolor.withOpacity(.7),
                          fontsize: 20,
                          width: .7,
                          text: "Done",
                          function: () {
                            Get.toNamed("");
                          },
                        )
                      ],
                    ),
                  ));
            },
          )
        ],
      ),
    );
  }
}

class BookingPersonsBox extends StatelessWidget {
  final String img, title, subtitle;
  const BookingPersonsBox({
    super.key,
    required this.img,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kWidth(.3),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: KColors.kWhite,
            radius: kHeight(.035),
            foregroundImage: AssetImage(img),
          ),
          CustomText(
            text: title,
            textStyle: KTextStyles().normal(
                textColor: KColors.kTertiary,
                fontSize: 17,
                fontWeight: FontWeight.w600),
          ),
          CustomText(
            text: subtitle,
            textStyle: KTextStyles().normal(
                textColor: KColors.kTcolor,
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
