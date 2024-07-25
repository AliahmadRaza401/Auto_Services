import 'package:auto_services/screens/service_selection/controller/service_selection_controller.dart';
import 'package:auto_services/widgets/widgets_imports.dart';
import '../../../data/repository/authentication_repository.dart';
import '../../car_repair/view/car_repair_bottomnavbar.dart';
import '../../technical_test.dart';

class ServiceSelectionScreen extends StatelessWidget {
  ServiceSelectionScreen({super.key});
  final controller = Get.put(ServiceSelectionController());
  final authRepo = AuthenticationRepository.instance;
  @override
  Widget build(BuildContext context) {
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
                child: ClipOval(
                  child: Image.network(userData.value?.profilePic ?? '',
                      height: 150, width: 150, fit: BoxFit.cover, errorBuilder: (_, obj, trace) => Image.asset("", height: 150, width: 150, fit: BoxFit.cover)),
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
        actions: [
          Padding(
            padding: EdgeInsets.only(right: kWidth(0.05)),
            child: IconButton(onPressed: () => AuthenticationRepository.instance.logout(), icon: const Icon(Icons.logout, color: KColors.kWhite)),
          ),
        ],
        toolbarHeight: 100,
      ),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                heightBox(0.05),
                CustomText(
                  maxLines: 3,
                  text: "Services Available",
                  textStyle: KTextStyles().normal(fontSize: 34, fontWeight: FontWeight.w600, textColor: KColors.kTertiary),
                ),
                CustomText(
                  maxLines: 3,
                  text: "Please choose your service\nthat you are getting",
                  textStyle: KTextStyles().normal(fontSize: 14, fontWeight: FontWeight.w500, textColor: KColors.kTertiary),
                ),
                heightBox(0.05),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.separated(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.services.length,
                      padding: EdgeInsets.symmetric(horizontal: kWidth(0.05)),
                      itemBuilder: (context, index) {
                        return Obx(() {
                          return ServiceCard(
                            title: controller.services[index].title,
                            func: () {
                              if (controller.services[index].active) {
                                selectedService.value = controller.services[index].module;
                                Future.delayed(const Duration(milliseconds: 400), () {
                                  if (controller.services[index].module == 'Car-Tow') {
                                    Get.to(() => const CarTowBottomNavBar());
                                  } else if (controller.services[index].module == 'Car-Repair') {
                                    Get.to(() => const CarRepairBottomNavBar());
                                  } else if (controller.services[index].module == 'Tech-Test') {
                                    Get.to(() => const TechnicalTest());
                                  }
                                });
                              }
                            },
                            isSelected: selectedService.value == controller.services[index].module,
                          );
                        });
                      },
                      separatorBuilder: (context, index) => heightBox(.02),
                    );
                  }
                }),
                heightBox(.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ServiceCard extends StatelessWidget {
  final String title;
  final VoidCallback? func;
  final bool isSelected;
  const ServiceCard({super.key, required this.title, this.func, this.isSelected = false});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: kHeight(.09),
        width: kWidth(.9),
        decoration: BoxDecoration(
          color: isSelected ? KColors.kPrimary : KColors.kWhite,
          borderRadius: BorderRadius.circular(kWidth(.02)),
          boxShadow: [BoxShadow(color: KColors.kGrey.withOpacity(.2), blurRadius: 5)],
        ),
        padding: EdgeInsets.only(left: kWidth(.04)),
        child: Align(
          alignment: Alignment.centerLeft,
          child: CustomText(text: title, textStyle: KTextStyles().normal(fontSize: 18, fontWeight: FontWeight.w600, textColor: isSelected ? KColors.kWhite : KColors.kTextcolor)),
        ),
      ),
    );
  }
}
