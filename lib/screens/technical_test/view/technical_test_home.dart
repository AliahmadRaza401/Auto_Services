import 'package:auto_services/common_models/booking.dart';
import 'package:auto_services/screens/technical_test/controller/technical_test_controller.dart';
import 'package:auto_services/screens/technical_test/view/book_technical_test.dart';
import 'package:auto_services/screens/technical_test/view/technical_test_all_bookings.dart';
import 'package:auto_services/screens/technical_test/view/technical_test_notification.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class TechnicalTestHome extends StatelessWidget {
  const TechnicalTestHome({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(TechnicalTestController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.kPrimary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.vertical(bottom: Radius.circular(kWidth(.04)))),
        title: Container(
          height: kHeight(.11),
          width: kWidth(.9),
          padding: EdgeInsets.all(kWidth(0.02)),
          child: Row(
            children: [
              CircleAvatar(
                radius: kHeight(.04),
                backgroundColor: KColors.kWhite,
                child: ClipOval(
                  child: Image.network(userData.value?.profilePic ?? '',
                      height: 150, width: 150, fit: BoxFit.cover, errorBuilder: (_, obj, trace) => Icon(Icons.person, color: KColors.kPrimary, size: kWidth(0.09))),
                ),
              ),
              widthBox(.04),
              SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: userData.value?.name ?? '---', textStyle: KTextStyles().normal(textColor: KColors.kWhite, fontSize: 20, fontWeight: FontWeight.w600)),
                    CustomText(
                      text: userData.value?.type ?? "---",
                      textStyle: KTextStyles().normal(textColor: KColors.kWhite, fontSize: 14, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back, color: KColors.kWhite),
        ),
        actions: [],
        toolbarHeight: 100,
      ),
      body: Container(
        height: context.height,
        width: context.width,
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            OutlineIconTextButton2(
              height: .1,
              borderRadius: .02,
              width: .9,
              text: "Book Technical Test",
              img: "assets/icons/consumer5.png",
              function: () {
                Get.to(() => const BookTechnicalTest());
                controller.fetchBrands();
              },
            ),
            heightBox(0.04),
            OutlineIconTextButton2(
              height: .1,
              borderRadius: .02,
              width: .9,
              text: "Notifications",
              img: "assets/icons/consumer5.png",
              function: () {
                Get.to(() => const TechnicalTestNotificationScreen());
                controller.fetchBrands();
              },
            ),
            heightBox(0.04),
            OutlineIconTextButton2(
              height: .1,
              borderRadius: .02,
              width: .9,
              text: "See All Bookings",
              img: "assets/icons/consumer4.png",
              function: () {
                Get.to(() => const TechnicalTestAllBookings());
                controller.fetchTechTest();
              },
            ),
          ],
        ),
      ),
    );
  }
}
