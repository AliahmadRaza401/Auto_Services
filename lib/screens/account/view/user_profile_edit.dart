import 'package:auto_services/screens/account/controller/user_profile_controller.dart';
import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

import '../../../utils/validation.dart';

class UserProfileEdit extends StatelessWidget {
  const UserProfileEdit({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = UserProfileController.instance;
    return Scaffold(
      appBar: const CustomAppBar(actions: [], title: ''),
      body: Center(
        child: SizedBox(
          height: context.height,
          width: kWidth(.9),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: kHeight(.08),
                    child: ClipOval(
                      child: Obx(() {
                        return controller.profileImg.value != null
                            ? Image.file(controller.profileImg.value!, height: 150, width: 150, fit: BoxFit.cover)
                            : Image.network(userData.value?.profilePic ?? '',
                                height: 150, width: 150, fit: BoxFit.cover, errorBuilder: (_, obj, trace) => Image.asset("", height: 150, width: 150, fit: BoxFit.cover));
                      }),
                    ),
                  ),
                  IconButton(onPressed: () => controller.pickProfileImg(context), icon: const CircleAvatar(backgroundColor: KColors.kGreen, child: Icon(Icons.edit_rounded)), color: KColors.kWhite),
                ],
              ),
              heightBox(.02),
              Expanded(
                child: Form(
                  key: controller.editProfileFormKey,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        Align(alignment: Alignment.centerLeft, child: CustomText(text: "About Me", textStyle: KTextStyles().normal(fontSize: 20, fontWeight: FontWeight.w500))),
                        heightBox(.02),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomTextField(
                              controller: controller.name,
                              label: "Name",
                              hintText: "",
                              keyboardType: TextInputType.name,
                              hasPrefix: false,
                              hasSuffix: false,
                              suffixIcon: const Icon(null),
                              prefixIcon: const Icon(null),
                              function: (val) => KValidator.validateEmptyField('Name', val),
                            ),
                            heightBox(0.01),
                            CustomTextField(
                              controller: controller.email,
                              label: "Email",
                              hintText: "",
                              keyboardType: TextInputType.emailAddress,
                              hasPrefix: false,
                              hasSuffix: false,
                              suffixIcon: const Icon(null),
                              prefixIcon: const Icon(null),
                              function: (val) => KValidator.validateEmail(val),
                            ),
                            heightBox(.01),
                            CustomTextField(
                              controller: controller.phone,
                              label: "Phone No.",
                              hintText: "",
                              keyboardType: TextInputType.phone,
                              hasPrefix: false,
                              hasSuffix: false,
                              suffixIcon: const Icon(null),
                              prefixIcon: const Icon(null),
                              function: (val) => KValidator.validateEmptyField('Phone No.', val),
                            ),
                          ],
                        ),
                        heightBox(.02),
                        PrimaryButton(
                          borderRadius: .02,
                          width: .9,
                          text: "Save",
                          function: () => controller.updateProfileFunc(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
