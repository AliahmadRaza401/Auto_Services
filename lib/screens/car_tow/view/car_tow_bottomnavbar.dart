import 'package:auto_services/screens/car_tow/controller/car_tow_controller.dart';
import 'package:auto_services/screens/car_tow/view/car_tow_history.dart';
import '../../../widgets/widgets_imports.dart';
import '../../account/view/user_profile.dart';

class CarTowBottomNavBar extends StatelessWidget {
  const CarTowBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    final carTowController = Get.put(CarTowController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: carTowController.selectedPageIndex.value == 0 ? const CircleAvatar(backgroundColor: Colors.red, child: Icon(Icons.home, color: Colors.white)) : const Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: carTowController.selectedPageIndex.value == 1 ? const CircleAvatar(backgroundColor: Colors.red, child: Icon(Icons.history, color: Colors.white)) : const Icon(Icons.history),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: carTowController.selectedPageIndex.value == 2
                  ? const CircleAvatar(backgroundColor: Colors.red, child: Icon(Icons.notifications, color: Colors.white))
                  : const Icon(Icons.notifications),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: carTowController.selectedPageIndex.value == 3
                  ? const CircleAvatar(backgroundColor: Colors.red, child: Icon(Icons.person, color: Colors.white))
                  : Container(
                      height: kHeight(0.04),
                      decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: KColors.kBorderColor)),
                      padding: EdgeInsets.all(kWidth(.01)),
                      child: const Icon(Icons.person)),
              label: '',
            ),
          ],
          currentIndex: carTowController.selectedPageIndex.value,
          onTap: (index) => carTowController.changeIndex(index),
          showSelectedLabels: false,
          showUnselectedLabels: false,
          type: BottomNavigationBarType.fixed,
        ),
      ),
      body: Obx(() {
        return switch (carTowController.selectedPageIndex.value) {
          0 => const CarSelectionScreen(),
          1 => const CarTowHistoryScreen(),
          2 => const CarTowHistoryScreen(),
          3 => const UserProfile(),
          _ => const CarSelectionScreen(),
        };
      }),
    );
  }
}
