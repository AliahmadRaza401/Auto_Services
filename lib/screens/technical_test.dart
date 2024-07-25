import 'package:auto_services/widgets/widgets_imports.dart';

class TechnicalTest extends StatelessWidget {
  const TechnicalTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: KColors.kPrimary,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(Icons.arrow_back_rounded, color: KColors.kWhite),
        ),
      ),
      backgroundColor: KColors.kPrimary,
      body: Center(
        child: CustomText(
          maxLines: 2,
          text: "Coming\nSoon",
          textStyle: KTextStyles().normal(textColor: KColors.kWhite, fontSize: 40, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
