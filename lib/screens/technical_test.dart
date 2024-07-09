import 'package:auto_services/widgets/widgets_imports.dart';

class TechnicalTest extends StatelessWidget {
  const TechnicalTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.kPrimary,
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomText(
                maxLines: 2,
                text: "Coming\nSoon",
                textStyle: KTextStyles().normal(
                    textColor: KColors.kWhite,
                    fontSize: 30,
                    fontWeight: FontWeight.w600))
          ],
        ),
      ),
    );
  }
}
