import 'package:auto_services/common_models/booking.dart';
import 'package:auto_services/screens/car_tow/controller/car_tow_controller.dart';
import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';
import 'package:dotted_line/dotted_line.dart';

class CarTowHistoryScreen extends StatelessWidget {
  const CarTowHistoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final carTowController = CarTowController.instance;
    return Scaffold(
      appBar: const CustomAppBar(title: "Car Tow Requests History", actions: []),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              heightBox(.02),
              Obx(() {
                return ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  padding: EdgeInsets.symmetric(horizontal: kWidth(0.05)),
                  itemBuilder: (context, index) => CarTowBox(booking: carTowController.carTowRequests[index]),
                  separatorBuilder: (context, index) => heightBox(.02),
                  itemCount: carTowController.carTowRequests.length,
                );
              }),
              heightBox(.1),
            ],
          ),
        ),
      ),
    );
  }
}

class CarTowBox extends StatelessWidget {
  const CarTowBox({super.key, this.onAccept, this.booking});

  final BookingModel? booking;
  final VoidCallback? onAccept;

  @override
  Widget build(BuildContext context) {
    Color statusColor = Colors.transparent;
    switch (booking?.status) {
      case 'Pending':
        statusColor = Colors.amber;
        break;
      case 'Accepted':
        statusColor = Colors.lightBlue;
        break;
      case 'Rejected':
        statusColor = Colors.red;
        break;
      case 'Completed':
        statusColor = Colors.green;
        break;
      default:
        statusColor = Colors.transparent;
        break;
    }
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: kWidth(0.9),
          height: 120,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8.0),
            boxShadow: [BoxShadow(color: Colors.black26.withOpacity(.2), blurRadius: 10.0, spreadRadius: -5, offset: const Offset(0, 4))],
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Row(
              children: [
                Expanded(
                  child: Stack(
                    alignment: Alignment.centerLeft,
                    children: [
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const SizedBox(width: 45, height: 45, child: Icon(Icons.circle, color: KColors.kBlack)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(text: 'Pick Up', textStyle: KTextStyles().small()),
                                    CustomText(text: booking?.source ?? 'Pick Up location', textStyle: KTextStyles().normal()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              const SizedBox(width: 45, height: 45, child: Icon(Icons.location_on, color: KColors.kBlack)),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(text: 'Drop Off', textStyle: KTextStyles().small()),
                                    CustomText(text: booking?.destination ?? 'Drop Off location', textStyle: KTextStyles().normal()),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Container(
                        width: 45,
                        height: 26,
                        alignment: Alignment.center,
                        child: const DottedLine(direction: Axis.vertical),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: 120,
                  color: statusColor,
                  padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                  alignment: Alignment.center,
                  child: CustomText(text: booking?.status ?? '-----', textStyle: KTextStyles().normal(textColor: KColors.kWhite)),
                ),
              ],
            ),
          ),
        ),
        // const SizedBox(height: 15),
        // PrimaryButton(text: 'Accept', width: 1, color: KColors.kGreen, function: () => onAccept),
      ],
    );
  }
}
