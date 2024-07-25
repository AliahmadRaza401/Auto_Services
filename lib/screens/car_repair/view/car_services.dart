import 'package:auto_services/screens/car_repair/controller/car_repair_controller.dart';
import 'package:auto_services/screens/car_repair/model/car_service_pkgs.dart';
import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';
import 'package:super_bullet_list/bullet_list.dart';
import 'package:super_bullet_list/bullet_style.dart';

class CarServicePkgSelectionScreen extends StatelessWidget {
  const CarServicePkgSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CarRepairController.instance;
    return Scaffold(
      appBar: const CustomAppBar(title: "", actions: []),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Obx(() {
          if (controller.isLoading.value) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              itemBuilder: (context, index) => CarServiceCard(
                servicePkg: controller.carServicePkgs[index],
                onBook: () => controller.bookCarService(serviceData: controller.carServicePkgs[index]),
              ),
              separatorBuilder: (context, index) => heightBox(.02),
              itemCount: controller.carServicePkgs.length,
            );
          }
        }),
      ),
    );
  }
}

class CarServiceCard extends StatelessWidget {
  const CarServiceCard({super.key, required this.servicePkg, this.onBook});

  final CarServicePkgsModel servicePkg;
  final VoidCallback? onBook;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: kHeight(.19),
          width: kWidth(.9),
          decoration: BoxDecoration(
            border: Border.all(color: const Color(0xffEAEBEC)),
            borderRadius: BorderRadius.circular(kWidth(.02)),
          ),
          padding: EdgeInsets.symmetric(vertical: kHeight(0.02), horizontal: kWidth(.02)),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: kHeight(0.18),
                    width: kWidth(.45),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(text: servicePkg.title, textStyle: KTextStyles().normal(textColor: KColors.kTertiary, fontSize: 16, fontWeight: FontWeight.w700)),
                        heightBox(.004),
                        SuperBulletList(
                          isOrdered: false,
                          style: BulletStyle.discFill,
                          gap: 4,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          crossAxisMargin: 0,
                          separator: const SizedBox(height: 2),
                          items: [
                            CustomText(text: 'Every ${servicePkg.applicable}', textStyle: KTextStyles().normal(textColor: KColors.kTertiary, fontSize: 12)),
                            CustomText(text: 'Takes ${servicePkg.duration} Hours', textStyle: KTextStyles().normal(textColor: KColors.kTertiary, fontSize: 12)),
                            CustomText(text: '${servicePkg.warrantyValid} Month Warranty', textStyle: KTextStyles().normal(textColor: KColors.kTertiary, fontSize: 12)),
                            CustomText(text: 'Includes ${servicePkg.serviceCount} Services', textStyle: KTextStyles().normal(textColor: KColors.kTertiary, fontSize: 12)),
                          ],
                        ),
                        heightBox(.004),
                        CustomText(text: "Rs ${servicePkg.price}", textStyle: KTextStyles().normal(textColor: KColors.kTertiary, fontSize: 14, fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  Container(
                    height: kHeight(0.12),
                    width: kWidth(.25),
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(kWidth(.02))),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kWidth(.02)),
                      child: Image.network(
                        servicePkg.image,
                        fit: BoxFit.fill,
                        errorBuilder: (context, obj, trace) => Image.asset("assets/images/service1.png", fit: BoxFit.fill),
                      ),
                    ),
                  ),
                ],
              ),
              // Padding(
              //   padding: EdgeInsets.only(top: kHeight(.1), left: kHeight(.215)),
              //   child: Center(
              //     child: OutlineButton(
              //       height: .04,
              //       fontsize: 12,
              //       borderRadius: .02,
              //       width: .2,
              //       text: "ADD",
              //       function: () {},
              //     ),
              //   ),
              // )
            ],
          ),
        ),
        heightBox(0.01),
        PrimaryButton(
          fontsize: 24,
          borderRadius: .04,
          width: .9,
          text: "Book Now",
          function: onBook ?? () {},
        )
      ],
    );
  }
}
