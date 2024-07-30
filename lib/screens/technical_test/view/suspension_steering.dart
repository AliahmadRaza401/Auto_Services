import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

class SuspensionSteering extends StatelessWidget {
  const SuspensionSteering({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "Technical Test", actions: []),
      body: Center(
        child: SizedBox(
          height: context.height,
          width: kWidth(.9),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox(.02),
              CustomText(
                  text: "Suspension and Steering",
                  textStyle: KTextStyles().normal(
                      fontSize: 16,
                      textColor: KColors.kPrimary,
                      fontWeight: FontWeight.bold)),
              heightBox(.04),
              const TechnicalTestTileDrop(
                  title: "Shock Absorbers Leaks Check", lable: "Yes"),
              const TechnicalTestTileDrop(
                  title: "Steering Components Check", lable: "Yes"),
              const TechnicalTestTileDrop(
                  title: "Wheel Alignment Check", lable: "Yes"),
              const Spacer(),
              Center(
                child: CustomText(
                    text: "Step 05 of 05",
                    textStyle: KTextStyles().normal(
                      fontSize: 16,
                      textColor: KColors.kPrimary,
                    )),
              ),
              heightBox(.01),
              PrimaryButton(
                height: .07,
                width: .9,
                text: "Finalize",
                function: () {},
              ),
              heightBox(.02),
            ],
          ),
        ),
      ),
    );
  }
}

class TechnicalTestTileDrop extends StatelessWidget {
  final String title, lable;

  const TechnicalTestTileDrop({
    super.key,
    required this.title,
    required this.lable,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, textStyle: KTextStyles().normal()),
        heightBox(.005),
        AbsorbPointer(
          absorbing: true,
          child: CustomTextField2(
            suffixIconColor: KColors.kBlack,
            themeColor: KColors.kBlack,
            hasPrefix: false,
            hasSuffix: true,
            controller: TextEditingController(),
            label: lable,
            hintText: "",
            keyboardType: TextInputType.text,
            suffixIcon: const Icon(
              CupertinoIcons.chevron_down,
              color: KColors.kBlack,
            ),
            prefixIcon: const Icon(null),
          ),
        ),
        heightBox(.02),
      ],
    );
  }
}

class TechnicalTestTile extends StatelessWidget {
  final String title, lable;
  final TextEditingController controller;

  const TechnicalTestTile({
    super.key,
    required this.title,
    required this.lable,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CustomText(text: title, textStyle: KTextStyles().normal()),
        heightBox(.005),
        CustomTextField2(
          suffixIconColor: KColors.kBlack,
          themeColor: KColors.kBlack,
          hasPrefix: false,
          hasSuffix: false,
          controller: controller,
          label: lable,
          hintText: "",
          keyboardType: TextInputType.text,
          suffixIcon: const Icon(null),
          prefixIcon: const Icon(null),
        ),
        heightBox(.02),
      ],
    );
  }
}
