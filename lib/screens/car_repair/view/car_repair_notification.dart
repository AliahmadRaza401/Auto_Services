import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/custom_text_styles.dart';
import '../../../utils/dynamic_sizes.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text.dart';
import '../controller/car_repair_controller.dart';

class CarRepairNotificationScreen extends StatelessWidget {
  const CarRepairNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carRepairController = CarRepairController.instance;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Car Repairing Notifications', actions: []),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Obx(() {
          if (carRepairController.carRepairNotifications.isEmpty) {
            return Center(child: CustomText(text: 'Currently No Notification', textStyle: KTextStyles().subHeading()));
          } else {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: kWidth(0.05)),
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => Container(),
              separatorBuilder: (context, index) => heightBox(0.02),
              itemCount: carRepairController.carRepairNotifications.length,
            );
          }
        }),
      ),
    );
  }
}
