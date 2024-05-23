import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class CarMechanic extends StatelessWidget {
  const CarMechanic({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "", actions: []),
      body: SizedBox(
          height: context.height,
          width: context.width,
          child: Column(
            children: [
              heightBox(0.05),
              ListView.separated(
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return const Center(child: CarMechanicTile());
                  },
                  separatorBuilder: (context, index) => heightBox(.02),
                  itemCount: 4),
            ],
          )),
    );
  }
}

class CarMechanicTile extends StatelessWidget {
  const CarMechanicTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: kHeight(.11),
      width: kWidth(.9),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(color: KColors.kTertiary.withOpacity(.1), blurRadius: 24),
            BoxShadow(color: KColors.kWhite.withOpacity(.5), blurRadius: 0)
          ],
          borderRadius: BorderRadius.circular(kWidth(.02)),
          border: Border.all(
            color: KColors.kBorderColor,
          )),
      padding: EdgeInsets.all(kWidth(0.02)),
      child: Row(
        children: [
          CircleAvatar(
            radius: kHeight(.04),
            foregroundImage: const AssetImage(
              "assets/images/carmechanic.jpeg",
            ),
          ),
          // Container(
          //   height: kHeight(0.08),
          //   width: kWidth(0.2),
          //   decoration: BoxDecoration(
          //       shape: BoxShape.circle, color: KColors.kGreen),
          //   child: ClipRRect(
          //       clipBehavior: Clip.antiAlias,
          //       child: Image.asset("assets/images/carmechanic.jpeg")),
          // ),
          widthBox(.04),
          SizedBox(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                      text: "Waleed Paracha",
                      textStyle: KTextStyles().normal(
                          textColor: KColors.kTertiary,
                          fontSize: 16,
                          fontWeight: FontWeight.w600)),
                  CustomText(
                    text: "Car Mechanic",
                    textStyle: KTextStyles().normal(
                        textColor: KColors.kTcolor,
                        fontSize: 14,
                        fontWeight: FontWeight.w400),
                  )
                ]),
          ),
        ],
      ),
    );
  }
}
