import 'package:auto_services/screens/technical_test/controller/technical_test_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../utils/custom_text_styles.dart';
import '../../../utils/dynamic_sizes.dart';
import '../../../widgets/custom_app_bar.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/notification_card.dart';

class TechnicalTestNotificationScreen extends StatelessWidget {
  const TechnicalTestNotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carRepairController = TechnicalTestController.instance;
    return Scaffold(
      appBar: const CustomAppBar(title: 'Technical Testing Notifications', actions: []),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Obx(() {
          if (carRepairController.techTestNotifications.isEmpty) {
            return Center(child: CustomText(text: 'Currently No Notification', textStyle: KTextStyles().subHeading()));
          } else {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: kWidth(0.05), vertical: kWidth(0.04)),
              itemBuilder: (context, index) => NotificationCard(notification: carRepairController.techTestNotifications[index]),
              separatorBuilder: (context, index) => heightBox(0.02),
              itemCount: carRepairController.techTestNotifications.length,
            );
          }
        }),
      ),
    );
  }
}
