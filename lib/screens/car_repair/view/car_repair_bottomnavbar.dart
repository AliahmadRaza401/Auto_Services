import 'package:auto_services/screens/account/view/user_profile.dart';
import 'package:auto_services/screens/car_repair/controller/car_repair_controller.dart';

import '../../../widgets/widgets_imports.dart';

class CarRepairBottomNavBar extends StatelessWidget {
  const CarRepairBottomNavBar({super.key});
  @override
  Widget build(BuildContext context) {
    final carRepairController = Get.put(CarRepairController());
    return Scaffold(
      body: Obx(() {
        return switch (carRepairController.selectedPageIndex.value) {
          0 => const CarRepairServiceSelectionScreen(),
          1 => const CarRepairBooking(),
          2 => const CarServicePkgSelectionScreen(),
          3 => const UserProfile(),
          _ => const BookNow(),
        };
      }),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: carRepairController.selectedPageIndex.value == 0 ? const CircleAvatar(backgroundColor: Colors.red, child: Icon(Icons.home, color: Colors.white)) : const Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: carRepairController.selectedPageIndex.value == 1 ? const CircleAvatar(backgroundColor: Colors.red, child: Icon(Icons.history, color: Colors.white)) : const Icon(Icons.history),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: carRepairController.selectedPageIndex.value == 2
                  ? const CircleAvatar(backgroundColor: Colors.red, child: Icon(Icons.notifications, color: Colors.white))
                  : const Icon(Icons.notifications),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: carRepairController.selectedPageIndex.value == 3
                  ? const CircleAvatar(backgroundColor: Colors.red, child: Icon(Icons.person, color: Colors.white))
                  : Container(
                      height: kHeight(0.04),
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: KColors.kBorderColor)),
                      padding: EdgeInsets.all(kWidth(.01)),
                      child: const Icon(Icons.person),
                    ),
              label: '',
            ),
          ],
          currentIndex: carRepairController.selectedPageIndex.value,
          onTap: (index) => carRepairController.updatePageIndex(index),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
        ),
      ),
    );
  }
}
