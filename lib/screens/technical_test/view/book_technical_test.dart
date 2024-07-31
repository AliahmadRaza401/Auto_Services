import 'package:auto_services/screens/technical_test/controller/technical_test_controller.dart';
import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';

class BookTechnicalTest extends StatelessWidget {
  const BookTechnicalTest({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = TechnicalTestController.instance;
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
              CustomText(text: "Enter your Booking Details", textStyle: KTextStyles().normal(fontSize: 16, textColor: KColors.kPrimary)),
              heightBox(.025),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(text: 'Vehicle Manufacturer', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                  heightBox(.005),
                  Obx(() {
                    return DropdownButtonFormField(
                      value: controller.selectedBrand.value,
                      decoration: InputDecoration(
                        suffix: controller.isLoading.value && controller.brandList.isEmpty && controller.selectedBrand.value == null ? const Center(child: CircularProgressIndicator()) : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kWidth(.04)),
                          borderSide: BorderSide(width: 2, color: KColors.kBlack.withOpacity(.2)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kWidth(.04)),
                          borderSide: BorderSide(width: 2, color: KColors.kBlack.withOpacity(.2)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kWidth(.04)),
                          borderSide: const BorderSide(width: 2, color: KColors.kPrimary),
                        ),
                      ),
                      items: controller.brandList.map((item) => DropdownMenuItem(value: item, child: Text(item.name))).toList(),
                      onChanged: (value) {
                        controller.selectedBrand.value = value;
                        controller.fetchBrandCars();
                      },
                    );
                  }),
                ],
              ),
              heightBox(.025),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  CustomText(text: 'Specific Model', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                  heightBox(.005),
                  Obx(() {
                    return DropdownButtonFormField(
                      value: controller.selectedCarModel.value,
                      decoration: InputDecoration(
                        suffix: controller.isLoading.value && controller.carList.isEmpty && controller.selectedBrand.value != null ? const Center(child: CircularProgressIndicator()) : null,
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kWidth(.04)),
                          borderSide: BorderSide(width: 2, color: KColors.kBlack.withOpacity(.2)),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kWidth(.04)),
                          borderSide: BorderSide(width: 2, color: KColors.kBlack.withOpacity(.2)),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(kWidth(.04)),
                          borderSide: const BorderSide(width: 2, color: KColors.kPrimary),
                        ),
                      ),
                      items: controller.carList.map((item) => DropdownMenuItem(value: item, child: Text(item.name))).toList(),
                      onChanged: (value) {
                        controller.selectedCarModel.value = value;
                      },
                    );
                  }),
                ],
              ),
              heightBox(.025),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Manufacturing Year (Model)', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                  heightBox(.005),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return Obx(() {
                            return AlertDialog(
                              title: const Text("Select Car Model Year"),
                              content: SizedBox(
                                width: 300,
                                height: 300,
                                child: YearPicker(
                                  firstDate: DateTime(1900),
                                  lastDate: DateTime(2050),
                                  selectedDate: controller.manufacturingYear.value != null ? DateTime(int.parse(controller.manufacturingYear.value!)) : null,
                                  onChanged: (DateTime dateTime) {
                                    controller.manufacturingYear.value = dateTime.year.toString();
                                    Get.back();
                                  },
                                ),
                              ),
                            );
                          });
                        },
                      );
                    },
                    child: Container(
                      height: 55,
                      width: context.width,
                      padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kWidth(.04)),
                        border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Obx(() {
                        return Text(controller.manufacturingYear.value ?? 'Select Year',
                            style: KTextStyles().subHeading(fontSize: 16, textColor: controller.manufacturingYear.value != null ? KColors.kPrimary : KColors.kBlack.withOpacity(.5)));
                      }),
                    ),
                  ),
                ],
              ),
              heightBox(.025),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Preferred Date', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                  heightBox(.005),
                  InkWell(
                    onTap: () async {
                      final date = await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(const Duration(days: 356)));
                      if (date != null) {
                        controller.preferredDate.value = DateFormat('dd MMM, yyyy').format(date);
                      }
                    },
                    child: Container(
                      height: 55,
                      width: context.width,
                      padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kWidth(.04)),
                        border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Obx(() {
                        return Text(controller.preferredDate.value ?? 'Select Date',
                            style: KTextStyles().subHeading(fontSize: 16, textColor: controller.preferredDate.value != null ? KColors.kPrimary : KColors.kBlack.withOpacity(.5)));
                      }),
                    ),
                  ),
                ],
              ),
              heightBox(.025),
              Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: 'Preferred Time', textStyle: KTextStyles().subHeading(fontWeight: FontWeight.w300)),
                  heightBox(.005),
                  InkWell(
                    onTap: () async {
                      final time = await showTimePicker(context: context, initialTime: TimeOfDay.fromDateTime(DateTime.now()));
                      if (time != null) {
                        final now = DateTime.now();
                        controller.preferredTime.value = DateFormat('hh:mm a').format(DateTime(now.year, now.month, now.day, time.hour, time.minute));
                      }
                    },
                    child: Container(
                      height: 55,
                      width: context.width,
                      padding: EdgeInsets.symmetric(horizontal: kWidth(0.03)),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(kWidth(.04)),
                        border: Border.all(width: 2, color: KColors.kBlack.withOpacity(.2)),
                      ),
                      alignment: Alignment.centerLeft,
                      child: Obx(() {
                        return Text(controller.preferredTime.value ?? 'Select Time',
                            style: KTextStyles().subHeading(fontSize: 16, textColor: controller.preferredTime.value != null ? KColors.kPrimary : KColors.kBlack.withOpacity(.5)));
                      }),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              PrimaryButton(
                height: .07,
                width: .9,
                text: "Continue",
                function: () => controller.bookTechnicalTest(),
              ),
              heightBox(.02),
            ],
          ),
        ),
      ),
    );
  }
}
// Get.bottomSheet(
// isScrollControlled: true,
// Container(
// height: kHeight(.4),
// width: kWidth(.9),
// decoration: BoxDecoration(
// color: KColors.kWhite,
// borderRadius: BorderRadius.vertical(top: Radius.circular(kWidth(.04))),
// ),
// child: Column(
// crossAxisAlignment: CrossAxisAlignment.center,
// mainAxisAlignment: MainAxisAlignment.center,
// children: [
// Divider(
// thickness: 3,
// color: KColors.kBorderColor,
// indent: kWidth(.35),
// endIndent: kWidth(.35),
// ),
// const Divider(
// thickness: 1,
// color: KColors.kBorderColor,
// ),
// Image.asset(
// "assets/icons/accepttow.png",
// height: kHeight(.15),
// ),
// heightBox(.01),
// CustomText(text: "Technical Test report is ready", textStyle: KTextStyles().normal(fontSize: 20)),
// heightBox(.01),
// PrimaryButton(
// width: .8,
// text: "View",
// function: () {
// Get.toNamed("/vehicleinfo");
// },
// ),
// heightBox(.01),
// OutlineButton(
// width: .8,
// borderRadius: .03,
// text: "Share as Pdf",
// function: () {},
// ),
// ],
// ),
// ));
