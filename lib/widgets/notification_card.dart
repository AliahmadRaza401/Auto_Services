import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../common_models/notification.dart';
import '../utils/colors.dart';
import '../utils/custom_text_styles.dart';
import '../utils/dynamic_sizes.dart';
import 'custom_text.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key, required this.notification});

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: context.width,
      padding: EdgeInsets.symmetric(horizontal: kWidth(0.05), vertical: kWidth(0.04)),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(kWidth(0.04)),
        boxShadow: [BoxShadow(color: KColors.kGrey.withOpacity(.5), spreadRadius: -5, offset: const Offset(0, 4), blurRadius: 10)],
        color: KColors.kWhite,
      ),
      child: Row(
        children: [
          const Icon(Icons.notifications_active_outlined, color: KColors.kPrimary),
          widthBox(0.03),
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomText(text: notification.title, textStyle: KTextStyles().subHeading(), alignText: TextAlign.start),
                heightBox(0.005),
                CustomText(text: notification.description, textStyle: KTextStyles().normal(), maxLines: 5, alignText: TextAlign.start),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
