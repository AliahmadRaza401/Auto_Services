import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class BookNow extends StatelessWidget {
  const BookNow({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "", actions: []),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          children: [
            heightBox(.02),
            const CarServiceCard2(),
          ],
        ),
      ),
    );
  }
}

class CarServiceCard2 extends StatelessWidget {
  const CarServiceCard2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: kHeight(.18),
          width: kWidth(.8),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xffEAEBEC),
            ),
            borderRadius: BorderRadius.circular(kWidth(.02)),
          ),
          padding: EdgeInsets.symmetric(
            vertical: kHeight(0.02),
            horizontal: kWidth(.02),
          ),
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SizedBox(
                    height: kHeight(0.18),
                    width: kWidth(.45),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                            text: "Basic Service",
                            textStyle: KTextStyles().normal(
                                textColor: KColors.kTertiary,
                                fontSize: 16,
                                fontWeight: FontWeight.w700)),
                        heightBox(.002),
                        Padding(
                          padding: EdgeInsets.only(left: kWidth(.02)),
                          child: CustomText(
                              maxLines: 5,
                              alignText: TextAlign.left,
                              text:
                                  "• Every 5000 Kms/3 Months\n• Takes 4 Hours\n• 1 Month Warranty\n• Includes 9 Services",
                              textStyle: KTextStyles().normal(
                                  textColor: KColors.kTertiary,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400)),
                        ),
                        heightBox(.002),
                        CustomText(
                            text: "Rs 1,540",
                            textStyle: KTextStyles().normal(
                                textColor: KColors.kTertiary,
                                fontSize: 14,
                                fontWeight: FontWeight.w700)),
                      ],
                    ),
                  ),
                  Container(
                    height: kHeight(0.12),
                    width: kWidth(.25),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(kWidth(.02)),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(kWidth(.02)),
                      child: Image.asset(
                        "assets/images/service1.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: kHeight(.1), left: kHeight(.215)),
                child: Center(
                  child: OutlineButton(
                    height: .04,
                    fontsize: 12,
                    borderRadius: .02,
                    width: .2,
                    text: "ADD",
                    function: () {},
                  ),
                ),
              )
            ],
          ),
        ),
        heightBox(0.01),
        PrimaryButton(
          fontsize: 24,
          borderRadius: .04,
          width: .8,
          text: "Contact Customer",
          function: () {},
        )
      ],
    );
  }
}
