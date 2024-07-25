import 'package:auto_services/screens/car_tow/controller/car_tow_controller.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';

import '../../../../widgets/widgets_imports.dart';

class TowLocationSelectionScreen extends StatelessWidget {
  const TowLocationSelectionScreen({super.key});

  static const CameraPosition _initialPosition = CameraPosition(target: LatLng(37.77483, -122.41942), zoom: 12.0);

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
              child: GoogleMap(
                initialCameraPosition: _initialPosition,
                onMapCreated: (GoogleMapController controller) {},
              ),
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
                                          onTap: () => carTowController.selectLocationDialog(controller: carTowController.source),
                                          child: AbsorbPointer(
                                            absorbing: true,
                                            child: TextField(
                                              controller: carTowController.source,
                                              style: const TextStyle(color: KColors.kBlack, fontSize: 14),
                                              cursorWidth: 1,
                                              cursorHeight: 16,
                                              cursorColor: KColors.kBlack,
                                              decoration: const InputDecoration(
                                                labelText: "Pick Up *",
                                                labelStyle: TextStyle(color: KColors.kBlack, fontSize: 12),
                                                border: InputBorder.none,
                                              ),
                                            ),
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
                                          onTap: () => carTowController.selectLocationDialog(controller: carTowController.destination),
                                          child: AbsorbPointer(
                                            absorbing: true,
                                            child: TextField(
                                              controller: carTowController.destination,
                                              cursorColor: KColors.kBlack,
                                              style: const TextStyle(color: KColors.kBlack, fontSize: 14),
                                              cursorWidth: 1,
                                              cursorHeight: 16,
                                              decoration: const InputDecoration(
                                                labelText: "Drop Off *",
                                                labelStyle: TextStyle(color: KColors.kBlack, fontSize: 12),
                                                border: InputBorder.none,
                                              ),
                                            ),
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
