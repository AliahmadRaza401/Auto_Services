import '../../../widgets/widgets_imports.dart';

class CarAddtion extends StatelessWidget {
  CarAddtion({super.key});
  final searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          height: context.height,
          width: kWidth(.8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox(.1),
              Container(
                width: kWidth(0.8),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: const Color(0xffEAEBEC),
                )),
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: kWidth(.02)),
                          child: SizedBox(
                            height: kHeight(.12),
                            width: kWidth(.45),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                CustomText(
                                    text: "Balerno",
                                    textStyle: KTextStyles().normal(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        textColor: KColors.kTertiary)),
                                CustomText(
                                    text: "MH 04 CD 1234",
                                    textStyle: KTextStyles().normal(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        textColor: KColors.kTertiary)),
                                CustomText(
                                    text: "REG ID: 1241451433",
                                    textStyle: KTextStyles().normal(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                        textColor: KColors.kTertiary)),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: kHeight(0.12),
                          width: kWidth(0.32),
                          child: Image.asset(
                            "assets/images/carimage.png",
                            fit: BoxFit.fitWidth,
                          ),
                        )
                      ],
                    ),
                    const Row(
                      children: [
                        CardButton(
                          // width: .4,
                          text: 'BOOK A SERVICE',
                        ),
                        CardButton(
                            // width: .394,
                            text: 'DELETE',
                            textColor: KColors.kPrimary),
                      ],
                    )
                  ],
                ),
              ),
              heightBox(.02),
              CustomText(
                  text: "Add Another Car",
                  textStyle: KTextStyles().normal(
                      fontSize: 14,
                      textColor: KColors.kTertiary,
                      fontWeight: FontWeight.w700)),
              Container(
                height: kHeight(.08),
                width: kWidth(.8),
                decoration: BoxDecoration(
                    border: Border.all(
                  color: const Color(0xffEAEBEC),
                )),
                child: Row(
                  children: [
                    Container(
                      color: KColors.kWhite,
                      width: kWidth(.5),
                      child: CustomTextField2(
                        enableBorder: true,
                        borderColor: KColors.kWhite,
                        controller: searchController,
                        label: "Reigistration ID...",
                        hintText: "",
                        keyboardType: TextInputType.text,
                        suffixIcon: const Icon(null),
                        prefixIcon: const Icon(null),
                        hasPrefix: false,
                        hasSuffix: false,
                      ),
                    ),
                    OutlineButton(
                      height: 0.045,
                      borderRadius: .02,
                      fontsize: 14,
                      width: .25,
                      text: "ADD A CAR",
                      function: () {},
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class CardButton extends StatelessWidget {
  final Color textColor;
  final double textsize, width;
  final String text;
  const CardButton({
    super.key,
    this.textColor = KColors.kTertiary,
    this.textsize = 14,
    required this.text,
    this.width = .4,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Container(
        height: kHeight(.04),
        // width: kWidth(width),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffEAEBEC),
          ),
          color: KColors.kWhite,
        ),
        alignment: Alignment.center,
        child: CustomText(
            text: text,
            textStyle: KTextStyles().normal(
              textColor: textColor,
              fontSize: textsize,
              fontWeight: FontWeight.w700,
            )),
      ),
    );
  }
}
