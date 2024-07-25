import 'package:auto_services/common_models/booking.dart';
import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

import '../controller/car_repair_controller.dart';

class CarRepairBooking extends StatelessWidget {
  const CarRepairBooking({super.key});

  @override
  Widget build(BuildContext context) {
    final carRepairController = CarRepairController.instance;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Car Repairing Requests', actions: []),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Obx(() {
          if (carRepairController.carRepairBookings.isEmpty) {
            return Center(child: CustomText(text: 'Currently No Booking', textStyle: KTextStyles().subHeading()));
          } else {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: kWidth(0.05)),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => SeeBookingBox(booking: carRepairController.carRepairBookings[index]),
              separatorBuilder: (context, index) => heightBox(0.02),
              itemCount: carRepairController.carRepairBookings.length,
            );
          }
        }),
      ),
    );
  }
}

class SeeBookingBox extends StatelessWidget {
  const SeeBookingBox({super.key, required this.booking});

  final BookingModel booking;

  @override
  Widget build(BuildContext context) {
    var statusColor = Colors.transparent;
    statusColor = switch (booking.status) {
      'Pending' => Colors.amber,
      'Accepted' => Colors.lightBlue,
      'Rejected' => Colors.red,
      'Completed' => Colors.green,
      _ => Colors.transparent,
    };
    return Container(
      height: kHeight(.3),
      width: kWidth(.9),
      decoration: BoxDecoration(border: Border.all(color: KColors.kBorderColor), borderRadius: BorderRadius.circular(kWidth(.04))),
      padding: EdgeInsets.all(kWidth(.02)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          if (!['Pending', 'Completed', 'Cancelled'].contains(booking.status)) ...[
            CustomText(text: "A Booking for 3 PM Today", textStyle: KTextStyles().normal(textColor: KColors.kPrimary, fontSize: 18, fontWeight: FontWeight.w600)),
          ] else ...[
            Container(
              height: 35,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              alignment: Alignment.center,
              decoration: ShapeDecoration(shape: const StadiumBorder(), color: statusColor),
              child: CustomText(text: booking?.status ?? '-----', textStyle: KTextStyles().normal(textColor: KColors.kWhite)),
            ),
          ],
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              BookingPersonsBox(img: booking.customerProfilePic, title: booking.customerName, subtitle: 'Customer'),
              Icon(Icons.swap_horiz, size: kHeight(.04)),
              BookingPersonsBox(img: booking.mechanicProfilePic, title: booking.mechanicName, subtitle: 'Mechanic'),
            ],
          ),
          if (booking.subServiceDetail != null)
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
                          ),
                        ),
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
                  ),
                );
              },
            )
        ],
      ),
    );
  }
}

class BookingPersonsBox extends StatelessWidget {
  final String img, title, subtitle;
  const BookingPersonsBox({super.key, required this.img, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: kWidth(.3),
      child: Column(
        children: [
          CircleAvatar(
            backgroundColor: KColors.kWhite,
            radius: kHeight(.035),
            child: ClipOval(
              child: Image.network(img, width: 100, height: 100, fit: BoxFit.cover, errorBuilder: (_, obj, trace) => Image.asset('', width: 100, height: 100, fit: BoxFit.cover)),
            ),
          ),
          CustomText(
            text: title,
            textStyle: KTextStyles().normal(textColor: KColors.kTertiary, fontSize: 17, fontWeight: FontWeight.w600),
          ),
          CustomText(
            text: subtitle,
            textStyle: KTextStyles().normal(textColor: KColors.kTcolor, fontSize: 12, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
