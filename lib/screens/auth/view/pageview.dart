import '../../../widgets/widgets_imports.dart';
import 'resetpassword.dart';
import 'verification.dart';

class Pages extends StatelessWidget {
  Pages({super.key});
  final controller = PageController(initialPage: 0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        child: PageView(
          controller: controller,
          children: [
            const ForgetPassword(),
            VerificationScreen(),
            const Resetpassword(),
          ],
        ),
      ),
    );
  }
}
