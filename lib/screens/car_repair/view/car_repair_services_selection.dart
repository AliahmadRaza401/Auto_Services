import 'package:auto_services/screens/car_repair/model/car_repair_service.dart';
import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../controller/car_repair_controller.dart';

class CarRepairServiceSelectionScreen extends StatelessWidget {
  const CarRepairServiceSelectionScreen({super.key});
  @override
  Widget build(BuildContext context) {
    final carRepairController = CarRepairController.instance;
    return Scaffold(
      appBar: const CustomAppBar(title: "", actions: []),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: kWidth(0.05)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightBox(0.02),
            CustomTextField2(
              controller: carRepairController.searchController,
              label: "Search Location",
              hintText: "",
              keyboardType: TextInputType.text,
              suffixIcon: const Icon(null),
              prefixIcon: const Icon(Icons.search, color: KColors.kTfield),
              hasPrefix: true,
            ),
            CarouselSlider.builder(
              itemCount: 3,
              itemBuilder: (context, index, realIndex) {
                return Container(
                  width: context.width,
                  height: kHeight(.25),
                  decoration: BoxDecoration(
                    color: KColors.kWhite,
                    borderRadius: BorderRadius.circular(kWidth(.02)),
                  ),
                  margin: EdgeInsets.symmetric(vertical: kHeight(.02), horizontal: kWidth(.02)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(kWidth(.02)),
                    child: Image.asset(
                      "assets/images/sllder1.png",
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) => Image.asset(
                        "",
                      ),
                    ),
                  ),
                );
              },
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                viewportFraction: 0.98,
                enlargeStrategy: CenterPageEnlargeStrategy.height,
                autoPlayCurve: Curves.easeInOut,
              ),
            ),
            heightBox(.01),
            CustomText(text: "Select Service", textStyle: KTextStyles().normal(fontSize: 16, fontWeight: FontWeight.w700)),
            heightBox(0.03),
            Center(
              child: Obx(() {
                if (carRepairController.isLoading.value) {
                  return const CircularProgressIndicator();
                } else {
                  return SizedBox(
                    height: kHeight(.3),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: carRepairController.carServices.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisSpacing: 10, crossAxisSpacing: 10, crossAxisCount: 4),
                      itemBuilder: (context, index) {
                        return Obx(() {
                          return BookingCard(
                            carService: carRepairController.carServices[index],
                            isSelected: carRepairController.selectedRepairService.value == carRepairController.carServices[index],
                            func: () {
                              if (carRepairController.carServices[index].active) {
                                carRepairController.selectedRepairService.value = carRepairController.carServices[index];
                                if (carRepairController.carServices[index].module == 'Car-Service') {
                                  carRepairController.fetchMechanics();
                                  Get.to(() => const CarMechanicSelection());
                                }
                              }
                            },
                          );
                        });
                      },
                    ),
                  );
                }
              }),
            ),
          ],
        ),
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  const BookingCard({super.key, required this.func, required this.carService, this.isSelected = false});
  final VoidCallback? func;
  final CarRepairServiceModel carService;
  final bool isSelected;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      borderRadius: BorderRadius.circular(kWidth(.02)),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xffEAEBEC)),
          color: isSelected ? KColors.kPrimary : KColors.kWhite,
          borderRadius: BorderRadius.circular(kWidth(.02)),
        ),
        alignment: Alignment.center,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Center(
                child: Image.network(
              carService.image,
              height: kHeight(0.04),
              color: isSelected ? KColors.kWhite : KColors.kPrimary,
            )),
            heightBox(.01),
            SizedBox(
              width: kWidth(0.135),
              child: CustomText(
                  maxLines: 2, text: carService.title, textStyle: KTextStyles().normal(fontSize: 10, fontWeight: FontWeight.w500, textColor: isSelected ? KColors.kWhite : KColors.kTextcolor)),
            )
          ],
        ),
      ),
    );
  }
}
