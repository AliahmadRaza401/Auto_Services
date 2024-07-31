import 'package:auto_services/screens/technical_test/controller/technical_test_controller.dart';
import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

import '../../../common_models/booking.dart';
import 'technical_test_booking_info.dart';
import 'technical_test_report.dart';

class TechnicalTestAllBookings extends StatelessWidget {
  const TechnicalTestAllBookings({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TechnicalTestController.instance;
    return Scaffold(
      appBar: const CustomAppBar(title: "All Test Bookings", actions: []),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              padding: EdgeInsets.symmetric(vertical: kWidth(0.04)),
              itemBuilder: (context, index) => TechTestCard(
                booking: controller.techTestList[index],
                onDetail: () {
                  controller.selectedBooking.value = controller.techTestList[index];
                  Get.to(() => const TechnicalTestBookingInfo());
                },
                viewReport: () {
                  controller.fetchBookingTechTestReport(bookingId: controller.techTestList[index].id);
                  Get.to(() => const TechnicalTestReportScreen());
                },
              ),
              separatorBuilder: (context, index) => heightBox(.04),
              itemCount: controller.techTestList.length,
            );
          }
        }),
      ),
    );
  }
}

class TechTestCard extends StatelessWidget {
  const TechTestCard({super.key, required this.booking, this.onDetail, this.viewReport});

  final BookingModel booking;
  final VoidCallback? onDetail;
  final VoidCallback? viewReport;

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.transparent;
    statusColor = switch (booking.status) { 'Pending' => Colors.amber, 'Accepted' => Colors.lightBlue, 'Rejected' => Colors.red, 'Completed' => Colors.green, _ => Colors.transparent };
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kWidth(0.05)),
      padding: EdgeInsets.all(kWidth(0.03)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kWidth(0.04)),
        border: Border.all(color: KColors.kPrimary, width: 1),
      ),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/icons/accepttow.png", width: kWidth(.15)),
              widthBox(.02),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: 'Brand', textStyle: KTextStyles().small()),
                          CustomText(text: booking.brand, textStyle: KTextStyles().small(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      widthBox(0.04),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: 'Car', textStyle: KTextStyles().small()),
                          CustomText(text: booking.car, textStyle: KTextStyles().small(fontWeight: FontWeight.bold)),
                        ],
                      ),
                      widthBox(0.04),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: 'Model', textStyle: KTextStyles().small()),
                          CustomText(text: booking.carModel, textStyle: KTextStyles().small(fontWeight: FontWeight.bold)),
                        ],
                      ),
                    ],
                  ),
                  heightBox(0.02),
                  Row(
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: 'Preferred Date', textStyle: KTextStyles().small()),
                          CustomText(text: booking.preferredDate, textStyle: KTextStyles().normal(fontWeight: FontWeight.w500)),
                        ],
                      ),
                      widthBox(0.04),
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: 'Preferred Time', textStyle: KTextStyles().small()),
                          CustomText(text: booking.preferredTime, textStyle: KTextStyles().normal(fontWeight: FontWeight.w500)),
                        ],
                      ),
                    ],
                  ),
                ],
              )),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                alignment: Alignment.center,
                decoration: ShapeDecoration(shape: const StadiumBorder(), color: statusColor),
                child: CustomText(text: booking.status ?? '-----', textStyle: KTextStyles().normal(textColor: KColors.kWhite)),
              ),
            ],
          ),
          heightBox(.02),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              PrimaryButton(
                borderRadius: .03,
                width: booking.status == 'Completed' ? .4 : 1,
                text: "View Info",
                color: KColors.kTertiary,
                function: onDetail ?? () {},
              ),
              if (booking.status == 'Completed') ...[
                PrimaryButton(
                  width: .4,
                  text: "View Report",
                  function: viewReport ?? () {},
                ),
              ],
            ],
          ),
        ],
      ),
    );
  }
}
