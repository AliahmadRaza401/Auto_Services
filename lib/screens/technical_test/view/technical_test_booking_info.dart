import 'package:auto_services/screens/technical_test/controller/technical_test_controller.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

import '../../../widgets/custom_app_bar.dart';

class TechnicalTestBookingInfo extends StatelessWidget {
  const TechnicalTestBookingInfo({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = TechnicalTestController.instance;
    return Scaffold(
      appBar: const CustomAppBar(title: "Booking Info", actions: []),
      body: Center(
        child: SizedBox(
          height: context.height,
          width: kWidth(.9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox(.02),
              CustomText(text: "Booking Details", textStyle: KTextStyles().normal(fontSize: 16, textColor: KColors.kPrimary)),
              heightBox(.025),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Vehicle Manufacture', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                  heightBox(.005),
                  Container(
                    height: 55,
                    width: context.width,
                    padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kWidth(.04)),
                      border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Obx(() {
                      return Text(controller.selectedBooking.value?.brand ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                    }),
                  ),
                ],
              ),
              heightBox(.025),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Vehicle', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                  heightBox(.005),
                  Container(
                    height: 55,
                    width: context.width,
                    padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kWidth(.04)),
                      border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Obx(() {
                      return Text(controller.selectedBooking.value?.car ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                    }),
                  ),
                ],
              ),
              heightBox(.025),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Manufacturing Year (Model)', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                  heightBox(.005),
                  Container(
                    height: 55,
                    width: context.width,
                    padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kWidth(.04)),
                      border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Obx(() {
                      return Text(controller.selectedBooking.value?.carModel ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                    }),
                  ),
                ],
              ),
              heightBox(.025),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Preferred Date', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                  heightBox(.005),
                  Container(
                    height: 55,
                    width: context.width,
                    padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kWidth(.04)),
                      border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Obx(() {
                      return Text(controller.selectedBooking.value?.preferredDate ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                    }),
                  ),
                ],
              ),
              heightBox(.025),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Preferred Time', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                  heightBox(.005),
                  Container(
                    height: 55,
                    width: context.width,
                    padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kWidth(.04)),
                      border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Obx(() {
                      return Text(controller.selectedBooking.value?.preferredTime ?? '-----', style: KTextStyles().subHeading(fontSize: 16, textColor: KColors.kPrimary));
                    }),
                  ),
                ],
              ),
              heightBox(.02),
            ],
          ),
        ),
      ),
    );
  }
}
