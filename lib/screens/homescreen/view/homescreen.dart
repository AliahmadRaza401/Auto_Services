import 'package:auto_services/screens/homescreen/controller/homescreen_controller.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final HomeScreenController controller = Get.put(HomeScreenController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              heightBox(.08),
              CustomText(
                  maxLines: 3,
                  text: "Service Providing",
                  textStyle: KTextStyles().normal(
                      fontSize: 34,
                      fontWeight: FontWeight.w600,
                      textColor: KColors.kTertiary)),
              CustomText(
                  maxLines: 3,
                  text: "Please choose your service\nthat you are providing",
                  textStyle: KTextStyles().normal(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      textColor: KColors.kTertiary)),
              heightBox(0.04),
              ListView.separated(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Center(
                      child: HomeCard(
                        title: controller.homecard[index]["title"],
                        func: controller.homecard[index]["func"],
                        index: index,
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => heightBox(.02),
                  itemCount: controller.homecard.length),
              heightBox(.1),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeCard extends StatelessWidget {
  final String title;
  final VoidCallback func;
  final int index;
  const HomeCard({
    super.key,
    required this.title,
    required this.func,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        height: kHeight(.09),
        width: kWidth(.9),
        decoration: BoxDecoration(
          color: index == 1 ? KColors.kPrimary : KColors.kWhite,
          borderRadius: BorderRadius.circular(
            kWidth(.02),
          ),
          boxShadow: [
            BoxShadow(color: KColors.kGrey.withOpacity(.2), blurRadius: 5),
          ],
        ),
        padding: EdgeInsets.only(left: kWidth(.04)),
        child: Align(
          alignment: Alignment.centerLeft,
          child: CustomText(
              text: title,
              textStyle: KTextStyles().normal(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  textColor: index == 1 ? KColors.kWhite : KColors.kTextcolor)),
        ),
      ),
    );
  }
}
