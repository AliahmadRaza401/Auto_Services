import 'package:auto_services/common_models/user.dart';
import 'package:auto_services/screens/car_repair/controller/car_repair_controller.dart';
import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class CarMechanicSelection extends StatelessWidget {
  const CarMechanicSelection({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CarRepairController.instance;
    return Scaffold(
      appBar: const CustomAppBar(title: "Select Mechanic", actions: []),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: kWidth(0.05)),
              itemBuilder: (context, index) => Obx(() {
                return CarMechanicTile(
                  mechanic: controller.carMechanics[index],
                  isSelected: controller.selectedMechanic.value == controller.carMechanics[index],
                  onTap: () {
                    controller.selectedMechanic.value = controller.carMechanics[index];
                    Future.delayed(const Duration(milliseconds: 300), () {
                      Get.to(() => const CarServicePkgSelectionScreen());
                      controller.fetchCarServicePkgs();
                    });
                  },
                );
              }),
              separatorBuilder: (context, index) => heightBox(.02),
              itemCount: controller.carMechanics.length,
            );
          }
        }),
      ),
    );
  }
}

class CarMechanicTile extends StatelessWidget {
  const CarMechanicTile({super.key, required this.mechanic, this.isSelected = false, this.onTap});

  final UserModel mechanic;
  final bool isSelected;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: kHeight(.11),
        width: kWidth(.9),
        decoration: BoxDecoration(
          color: isSelected ? KColors.kPrimary : KColors.kWhite,
          boxShadow: [BoxShadow(color: KColors.kTertiary.withOpacity(.1), blurRadius: 10, spreadRadius: -5), BoxShadow(color: KColors.kWhite.withOpacity(.5), blurRadius: 0)],
          borderRadius: BorderRadius.circular(kWidth(.02)),
          border: Border.all(color: KColors.kBorderColor),
        ),
        padding: EdgeInsets.all(kWidth(0.02)),
        child: Row(
          children: [
            CircleAvatar(
              radius: kHeight(.04),
              child: ClipOval(
                child: Image.asset(
                  mechanic.profilePic ?? '',
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  errorBuilder: (context, obj, trace) => Image.asset("assets/images/carmechanic.jpeg", fit: BoxFit.cover, width: 80, height: 80),
                ),
              ),
            ),
            widthBox(.04),
            SizedBox(
              child: Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
                CustomText(text: mechanic.name, textStyle: KTextStyles().normal(textColor: isSelected ? KColors.kWhite : KColors.kTertiary, fontSize: 16, fontWeight: FontWeight.w600)),
                CustomText(
                  text: mechanic.type,
                  textStyle: KTextStyles().normal(textColor: isSelected ? KColors.kWhite.withOpacity(.8) : KColors.kTcolor, fontSize: 14, fontWeight: FontWeight.w400),
                )
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
