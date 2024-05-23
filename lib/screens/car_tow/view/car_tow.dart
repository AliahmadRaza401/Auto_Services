import 'package:auto_services/screens/car_tow/controller/car_tow_controller.dart';
import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class CarTow extends StatelessWidget {
  CarTow({super.key});

  final CarTowController controller = Get.put(CarTowController());
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: const CustomAppBar(title: "", actions: []),
        body: SizedBox(
          height: context.height,
          width: context.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: CustomText(
                      text: "Car Tow",
                      textStyle: KTextStyles().normal(
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                          textColor: KColors.kTertiary)),
                ),
                heightBox(.01),
                Padding(
                  padding: EdgeInsets.only(left: kWidth(.08)),
                  child: CustomText(
                      text: "Which Car Do You Drive ?",
                      textStyle: KTextStyles().normal(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          textColor: KColors.kPrimary)),
                ),
                heightBox(0.02),
                CustomTextField2(
                  controller: searchController,
                  label: "Search Location",
                  hintText: "",
                  keyboardType: TextInputType.text,
                  suffixIcon: const Icon(null),
                  prefixIcon: const Icon(
                    Icons.search,
                    color: KColors.kTfield,
                  ),
                  hasPrefix: true,
                ),
                heightBox(.01),
                // TextField(
                //   cursorHeight: kHeight(.02),
                //   cursorColor: Color(0xffCDCDCD),
                //   style: TextStyle(
                //       fontSize: kHeight(0.02), color: Color(0xffCDCDCD)),
                //   controller: searchController,
                //   decoration: InputDecoration(
                //       focusedBorder: InputBorder.none,
                //       enabledBorder: OutlineInputBorder(
                //           borderSide: BorderSide(
                //             color: Color(0xffCDCDCD),
                //           ),
                //           borderRadius: BorderRadius.circular(kWidth(.02))),
                //       floatingLabelBehavior: FloatingLabelBehavior.never,
                //       border: OutlineInputBorder(
                //           borderSide: BorderSide(
                //         color: Color(0xffCDCDCD),
                //       )),
                //       label: CustomText(
                //           text: "Search Location",
                //           textStyle: KTextStyles().normal(
                //             fontWeight: FontWeight.w400,
                //             textColor: Color(0xffCDCDCD),
                //           )),
                //       prefixIcon: Icon(
                //         Icons.search,
                //         color: Color(0xffCDCDCD),
                //       )),
                // ),
                Center(
                  child: SizedBox(
                    height: kHeight(.7),
                    width: kWidth(.9),
                    child: GridView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: controller.carLogo.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisSpacing: 5,
                              childAspectRatio: 1.2,
                              crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return Center(
                          child:
                              CarCard(img: controller.carLogo[index]["logo"]),
                        );
                      },
                    ),
                  ),
                ),
                // PrimaryButton(
                //   width: .9,
                //   text: "Next",
                //   function: () {},
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class CarCard extends StatelessWidget {
  final String img;
  const CarCard({
    super.key,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
          height: kHeight(.1),
          width: kWidth(.25),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffEAEBEC),
            ),
            color: KColors.kWhite,
            borderRadius: BorderRadius.circular(
              kWidth(.02),
            ),
          ),
          child: Center(
            child: Image.asset(
              img,
              height: kHeight(.07),
            ),
          )),
    );
  }
}
