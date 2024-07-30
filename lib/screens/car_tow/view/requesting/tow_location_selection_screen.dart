import 'package:auto_services/screens/car_tow/controller/car_tow_controller.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/widgets_imports.dart';

class TowLocationSelectionScreen extends StatelessWidget {
  const TowLocationSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carTowController = CarTowController.instance;
    return Scaffold(
      body: SizedBox(
        width: context.width,
        height: context.height,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned.fill(
              child: Obx(() {
                return GoogleMap(
                  initialCameraPosition: const CameraPosition(target: LatLng(31.582045, 74.329376), zoom: 16),
                  zoomControlsEnabled: false,
                  trafficEnabled: false,
                  myLocationEnabled: true,
                  buildingsEnabled: false,
                  compassEnabled: true,
                  indoorViewEnabled: false,
                  liteModeEnabled: false,
                  myLocationButtonEnabled: true,
                  style: carTowController.mapStyleString.value,
                  markers: carTowController.marker.toSet(),
                  onMapCreated: (controller) => carTowController.mapController.value = controller,
                );
              }),
            ),
            SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: kWidth(0.9),
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: const [BoxShadow(color: Colors.black26, blurRadius: 10.0, offset: Offset(0, 2))],
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Stack(
                            alignment: Alignment.centerLeft,
                            children: [
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      const SizedBox(width: 45, height: 45, child: Icon(Icons.circle, color: KColors.kBlack)),
                                      Expanded(
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () => carTowController.selectLocationDialog(side: 'source'),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.symmetric(horizontal: kWidth(0.02)),
                                            child: Obx(() => CustomText(
                                                text: carTowController.source.value?.description ?? 'Pick Up', textStyle: KTextStyles().normal(textColor: KColors.kTertiary), minFontSize: 14)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(height: 5),
                                  Row(
                                    children: [
                                      const SizedBox(width: 45, height: 45, child: Icon(Icons.location_on, color: KColors.kBlack)),
                                      Expanded(
                                        child: GestureDetector(
                                          behavior: HitTestBehavior.opaque,
                                          onTap: () => carTowController.selectLocationDialog(side: 'destination'),
                                          child: Container(
                                            alignment: Alignment.centerLeft,
                                            padding: EdgeInsets.symmetric(horizontal: kWidth(0.02)),
                                            child: Obx(() => CustomText(
                                                text: carTowController.destination.value?.description ?? 'Drop Off', textStyle: KTextStyles().normal(textColor: KColors.kTertiary), minFontSize: 14)),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                width: 45,
                                height: 26,
                                alignment: Alignment.center,
                                child: const DottedLine(direction: Axis.vertical),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () => carTowController.swapLocations(),
                          child: const SizedBox(width: 45, height: 45, child: Icon(Icons.swap_vert)),
                        ),
                      ],
                    ),
                  ),
                  heightBox(0.02),
                  SizedBox(
                    width: kWidth(0.9),
                    child: GestureDetector(
                      onTap: () async {
                        var date = await showDatePicker(context: context, firstDate: DateTime(2000), lastDate: DateTime(2030));
                        if (date != null) {
                          carTowController.preferredDate.text = DateFormat('dd MMM yyyy').format(date);
                        } else {
                          carTowController.preferredDate.clear();
                          carTowController.update();
                        }
                      },
                      child: AbsorbPointer(
                        absorbing: true,
                        child: TextField(
                          controller: carTowController.preferredDate,
                          style: const TextStyle(color: KColors.kBlack, fontSize: 14),
                          cursorWidth: 1,
                          cursorHeight: 16,
                          cursorColor: KColors.kBlack,
                          decoration: InputDecoration(
                            labelText: "Preferred Date *",
                            filled: true,
                            fillColor: KColors.kWhite,
                            enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
                            labelStyle: const TextStyle(color: KColors.kBlack, fontSize: 12),
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: 20,
              child: PrimaryButton(
                color: const Color(0xff393B40),
                width: .9,
                text: "Continue",
                function: () => carTowController.bookingDialog(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
