import 'package:auto_services/common_models/brand.dart';
import 'package:auto_services/screens/car_tow/controller/car_tow_controller.dart';
import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class CarSelectionScreen extends StatelessWidget {
  const CarSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final CarTowController controller = Get.put(CarTowController());
    final TextEditingController searchController = TextEditingController();
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: "", actions: []),
        body: SizedBox(
          height: context.height,
          width: context.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                    text: "Car Tow",
                    textStyle: KTextStyles().normal(fontSize: 28, fontWeight: FontWeight.w600, textColor: KColors.kTertiary),
                  ),
                ),
                heightBox(.01),
                Container(
                    width: kWidth(.9),
                    alignment: Alignment.topLeft,
                    child: CustomText(text: "Which Car Do You Drive ?", textStyle: KTextStyles().normal(fontSize: 22, fontWeight: FontWeight.w600, textColor: KColors.kPrimary))),
                heightBox(0.02),
                SizedBox(
                  width: kWidth(.9),
                  child: CustomTextField2(
                    controller: searchController,
                    label: "Search Location",
                    hintText: "",
                    keyboardType: TextInputType.text,
                    suffixIcon: const Icon(null),
                    prefixIcon: const Icon(Icons.search, color: KColors.kTfield),
                    hasPrefix: true,
                  ),
                ),
                heightBox(.01),
                Obx(() {
                  if (controller.isLoading.value) {
                    return const Center(child: CircularProgressIndicator());
                  } else {
                    return Center(
                      child: SizedBox(
                        height: kHeight(.7),
                        width: kWidth(.9),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.brandList.length,
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 5, childAspectRatio: 1.2, crossAxisCount: 3),
                          itemBuilder: (context, index) {
                            return CarCard(
                              brand: controller.brandList[index],
                              onTap: () => controller.selectCar(controller.brandList[index]),
                            );
                          },
                        ),
                      ),
                    );
                  }
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  const CarCard({super.key, required this.brand, this.onTap});

  final BrandModel brand;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(kWidth(.02)),
      child: Center(
        child: Container(
          height: kHeight(.1),
          width: kWidth(.25),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffEAEBEC)),
            color: KColors.kWhite,
            borderRadius: BorderRadius.circular(kWidth(.02)),
          ),
          child: Center(
            child: Image.network(brand.image, height: kHeight(.07)),
          ),
        ),
      ),
    );
  }
}
