import 'package:auto_services/widgets/widgets_imports.dart';

class ConsumerProfileEdit extends StatelessWidget {
  const ConsumerProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: context.height,
          width: kWidth(.9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              heightBox(.08),
              CircleAvatar(
                radius: kHeight(.08),
                foregroundImage: const AssetImage(
                  "assets/images/carmechanic.jpeg",
                ),
              ),
              heightBox(.02),
              CustomText(
                  text: "Waleed Paracha",
                  textStyle: KTextStyles().normal(
                      textColor: KColors.kTertiary,
                      fontSize: 24,
                      fontWeight: FontWeight.w600)),
              CustomText(
                text: "Car Mechanic",
                textStyle: KTextStyles().normal(
                    textColor: KColors.kTcolor,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
              heightBox(.02),
              Align(
                  alignment: Alignment.centerLeft,
                  child: CustomText(
                      text: "About Me",
                      textStyle: KTextStyles()
                          .normal(fontSize: 20, fontWeight: FontWeight.w500))),
              heightBox(.04),
              Container(
                height: kHeight(.4),
                width: kWidth(.9),
                decoration: const BoxDecoration(color: KColors.kWhite),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const ConsumerProfileTile(
                        title: "Job Expertise",
                        subtitle: "Mechanic, engine , cars"),
                    const ConsumerProfileTile(
                        title: "Job Experience", subtitle: "8 Years"),
                    const ConsumerProfileTile(
                        title: "Languages", subtitle: "English, Urdu"),
                    const ConsumerProfileTile(
                        title: "Age", subtitle: "42 Years"),
                    CustomText(
                        text: "Rating",
                        textStyle: KTextStyles().normal(
                            textColor: KColors.kTertiary,
                            fontSize: 14,
                            fontWeight: FontWeight.w600)),
                    RatingBar.builder(
                      initialRating: 3,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                      },
                    ),
                  ],
                ),
              ),
              heightBox(.02),
              PrimaryButton(
                borderRadius: .02,
                width: .9,
                text: "Save Changes",
                function: () {},
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ConsumerProfileTile extends StatelessWidget {
  final String title, subtitle;
  const ConsumerProfileTile({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(
            text: title,
            textStyle: KTextStyles().normal(
                textColor: KColors.kTertiary,
                fontSize: 14,
                fontWeight: FontWeight.w600)),
        heightBox(.005),
        CustomText(
          text: subtitle,
          textStyle: KTextStyles().normal(
              textColor: KColors.kTcolor,
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
        const Divider(
          thickness: 1,
          color: KColors.kBorderColor,
        ),
        heightBox(.01),
      ],
    );
  }
}
