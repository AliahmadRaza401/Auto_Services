import 'package:auto_services/screens/car_tow/controller/home_controller.dart';
import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class CarTowHome extends StatelessWidget {
  CarTowHome({super.key});
  final homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Car Tow", actions: []),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              heightBox(.02),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return CarTowBox(homeController: homeController);
                  },
                  separatorBuilder: (context, index) => heightBox(.02),
                  itemCount: 4),
              heightBox(.1)
            ],
          ),
        ),
      ),
    );
  }
}

class CarTowBox extends StatelessWidget {
  const CarTowBox({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: kHeight(.27),
      child: Column(
        children: [
          Container(
            width: kWidth(.9),
            padding:
                const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(kWidth(.02)),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              children: <Widget>[
                Row(
                  children: [
                    Column(
                      children: [
                        Icon(Icons.circle,
                            color: KColors.kBlack, size: kHeight(0.035)),
                        Container(
                          height: kHeight(0.05),
                          width: 1.0,
                          color: Colors.grey,
                          margin: const EdgeInsets.symmetric(vertical: 2.0),
                        ),
                        Icon(Icons.location_on,
                            color: KColors.kBlack, size: kHeight(0.035)),
                      ],
                    ),
                    const SizedBox(width: 20.0),
                    Expanded(
                      child: Column(children: [
                        TextField(
                          style: const TextStyle(color: KColors.kBlack),
                          cursorColor: KColors.kBlack,
                          onChanged: (value) =>
                              homeController.startPoint.value = value,
                          decoration: const InputDecoration(
                            labelText: "Pick Up",
                            labelStyle: TextStyle(color: KColors.kBlack),
                            border: InputBorder.none,
                          ),
                        ),
                        heightBox(0.01),
                        // Divider(color: Colors.grey, height: 1.0),
                        TextField(
                          cursorColor: KColors.kBlack,
                          style: const TextStyle(color: KColors.kBlack),
                          onChanged: (value) =>
                              homeController.destination.value = value,
                          decoration: const InputDecoration(
                            labelText: "Drop Off",
                            labelStyle: TextStyle(color: KColors.kBlack),
                            border: InputBorder.none,
                          ),
                        ),
                      ]),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        "assets/icons/swap.png",
                        height: kHeight(0.04),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          heightBox(.02),
          PrimaryButton(
            fontsize: 24,
            width: .9,
            text: "Accept Tow",
            function: () {
              Get.bottomSheet(
                  isScrollControlled: true,
                  Container(
                    height: kHeight(0.5),
                    width: kWidth(.9),
                    decoration: BoxDecoration(
                      color: KColors.kWhite,
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(
                        kWidth(.08),
                      )),
                    ),
                    child: Column(
                      children: [
                        heightBox(.008),
                        Center(
                          child: Divider(
                            thickness: 4,
                            color: KColors.kBorderColor,
                            indent: kHeight(.18),
                            endIndent: kHeight(.18),
                          ),
                        ),
                        const Divider(
                          thickness: 1,
                          color: KColors.kBorderColor,
                        ),
                        heightBox(.05),
                        Image.asset(
                          "assets/icons/accepttow.png",
                          height: kHeight(0.15),
                        ),
                        heightBox(.05),
                        CustomText(
                            text: "Car Tow is completed",
                            textStyle: KTextStyles().normal(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                            )),
                        heightBox(.05),
                        PrimaryButton(
                          width: .7,
                          text: "View Details",
                          function: () {},
                        )
                      ],
                    ),
                  ));
            },
          ),
        ],
      ),
    );
  }
}
