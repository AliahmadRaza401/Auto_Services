import 'package:auto_services/screens/account/view/user_profile_edit.dart';
import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';

import '../controller/user_profile_controller.dart';

class UserProfile extends StatelessWidget {
  const UserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfileController>(
        init: UserProfileController(),
        builder: (controller) {
          return Scaffold(
            appBar: const CustomAppBar(title: '', actions: []),
            body: Center(
              child: SizedBox(
                height: context.height,
                width: kWidth(.9),
                child: Obx(() {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: kHeight(.08),
                        backgroundColor: KColors.kPrimary,
                        child: ClipOval(
                          child: Image.network(userData.value?.profilePic ?? '',
                              height: 150, width: 150, fit: BoxFit.cover, errorBuilder: (_, obj, trace) => Icon(Icons.person, color: KColors.kWhite, size: kWidth(0.1))),
                        ),
                      ),
                      heightBox(.02),
                      CustomText(text: userData.value?.name ?? '-----', textStyle: KTextStyles().normal(textColor: KColors.kTertiary, fontSize: 24, fontWeight: FontWeight.w600)),
                      CustomText(
                        text: userData.value?.type ?? '----',
                        textStyle: KTextStyles().normal(textColor: KColors.kTcolor, fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                      heightBox(.02),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          PrimaryButton(
                            borderRadius: .02,
                            width: 0.4,
                            text: "Edit",
                            function: () => Get.to(() => const UserProfileEdit()),
                          ),
                          OutlineButton(
                            borderRadius: .02,
                            width: .4,
                            text: "Delete",
                            function: () {},
                          )
                        ],
                      ),
                      heightBox(.02),
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              Align(alignment: Alignment.centerLeft, child: CustomText(text: "About Me", textStyle: KTextStyles().normal(fontSize: 20, fontWeight: FontWeight.w500))),
                              heightBox(.02),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(text: 'Email', textStyle: KTextStyles().normal(textColor: KColors.kTertiary, fontSize: 14, fontWeight: FontWeight.w600)),
                                      heightBox(.005),
                                      CustomText(
                                        text: userData.value?.email ?? '',
                                        textStyle: KTextStyles().normal(textColor: KColors.kTcolor, fontSize: 12, fontWeight: FontWeight.w400),
                                      ),
                                      const Divider(thickness: 1, color: KColors.kBorderColor),
                                      heightBox(.01),
                                    ],
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.min,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      CustomText(text: 'Phone', textStyle: KTextStyles().normal(textColor: KColors.kTertiary, fontSize: 14, fontWeight: FontWeight.w600)),
                                      heightBox(.005),
                                      CustomText(
                                        text: userData.value?.phone ?? '',
                                        textStyle: KTextStyles().normal(textColor: KColors.kTcolor, fontSize: 12, fontWeight: FontWeight.w400),
                                      ),
                                      const Divider(thickness: 1, color: KColors.kBorderColor),
                                      heightBox(.01),
                                    ],
                                  ),
                                ],
                              ),
                              // heightBox(.02),
                              // PrimaryButton(
                              //   borderRadius: .02,
                              //   width: .9,
                              //   text: "Ban Service",
                              //   function: () {},
                              // ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                }),
              ),
            ),
          );
        });
  }
}
