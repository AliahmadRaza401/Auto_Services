import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../widgets/widgets_imports.dart';

class MapScreen extends StatelessWidget {
  final MapController mapController = Get.put(MapController());
  final searchController = TextEditingController();

  static const CameraPosition _initialPosition = CameraPosition(
    target: LatLng(37.77483, -122.41942), // San Francisco
    zoom: 12.0,
  );

  MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          GoogleMap(
            initialCameraPosition: _initialPosition,
            onMapCreated: (GoogleMapController controller) {},
          ),
          Positioned(
            top: 50.0,
            left: 15.0,
            right: 15.0,
            child: Container(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8.0),
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 10.0,
                    offset: Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: <Widget>[
                  Row(
                    children: [
                      Column(
                        children: [
                          Icon(Icons.circle,
                              color: KColors.kBlack, size: kHeight(0.03)),
                          Container(
                            height: kHeight(0.065),
                            width: 1.0,
                            color: Colors.grey,
                            margin: const EdgeInsets.symmetric(vertical: 2.0),
                          ),
                          Icon(Icons.location_on,
                              color: KColors.kBlack, size: kHeight(0.03)),
                        ],
                      ),
                      const SizedBox(width: 20.0),
                      Expanded(
                        child: Column(children: [
                          TextField(
                            style: const TextStyle(color: KColors.kBlack),
                            cursorColor: KColors.kBlack,
                            onChanged: (value) =>
                                mapController.startPoint.value = value,
                            decoration: const InputDecoration(
                              labelText: "Pick Up",
                              labelStyle: TextStyle(color: KColors.kBlack),
                              border: InputBorder.none,
                            ),
                          ),
                          heightBox(0.02),
                          // Divider(color: Colors.grey, height: 1.0),
                          TextField(
                            cursorColor: KColors.kBlack,
                            style: const TextStyle(color: KColors.kBlack),
                            onChanged: (value) =>
                                mapController.destination.value = value,
                            decoration: const InputDecoration(
                              labelText: "Drop Off",
                              labelStyle: TextStyle(color: KColors.kBlack),
                              border: InputBorder.none,
                            ),
                          ),
                        ]),
                      ),
                      GestureDetector(
                        onTap: () {
                          Get.bottomSheet(
                            isScrollControlled: true,
                            Container(
                              height: kHeight(0.65),
                              width: kWidth(.9),
                              decoration: BoxDecoration(
                                  color: KColors.kWhite,
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(kWidth(.08)))),
                              child: Column(
                                children: [
                                  heightBox(0.02),
                                  const Divider(
                                    thickness: 1,
                                    color: KColors.kBorderColor,
                                  ),
                                  heightBox(.002),
                                  Container(
                                    height: kHeight(0.08),
                                    width: kWidth(0.7),
                                    decoration: BoxDecoration(
                                        color: KColors.kBorderColor,
                                        borderRadius:
                                            BorderRadius.circular(kWidth(.1))),
                                    child: Row(
                                      children: [
                                        SizedBox(
                                          width: kWidth(.45),
                                          child: TextField(
                                            style: const TextStyle(
                                                color: KColors.kBlack),
                                            cursorColor: KColors.kBlack,
                                            onChanged: (value) => mapController
                                                .startPoint.value = value,
                                            decoration: const InputDecoration(
                                              prefixIcon: Icon(Icons.search),
                                              prefixIconColor: KColors.kBlack,
                                              hintText: "Where to ?",
                                              hintStyle: TextStyle(
                                                  color: KColors.kBlack),
                                              border: InputBorder.none,
                                            ),
                                          ),
                                        ),
                                        widthBox(.02),
                                        IconTextButton(
                                          width: 0.2,
                                          fontsize: 12,
                                          color: KColors.kWhite,
                                          textcolor: KColors.kPrimary,
                                          text: "Now",
                                          icon: CupertinoIcons.chevron_down,
                                          function: () {},
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: kHeight(0.1),
                                    width: kWidth(.7),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.access_time_outlined,
                                          size: kHeight(.03),
                                        ),
                                        widthBox(.04),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: kWidth(.58),
                                              child: CustomText(
                                                  alignText: TextAlign.left,
                                                  text: "Select Citywalk Mall",
                                                  textStyle: KTextStyles()
                                                      .normal(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                            ),
                                            heightBox(.005),
                                            SizedBox(
                                              width: kWidth(.58),
                                              child: CustomText(
                                                  alignText: TextAlign.left,
                                                  maxLines: 2,
                                                  text:
                                                      "Saket disctrict center, district center, sector 6, pushp vihar, New delhi, delhi 110017",
                                                  textStyle: KTextStyles()
                                                      .normal(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  heightBox(.005),
                                  Divider(
                                    thickness: 1,
                                    color: KColors.kBorderColor,
                                    indent: kWidth(.2),
                                    endIndent: kWidth(.1),
                                  ),
                                  heightBox(.005),
                                  SizedBox(
                                    height: kHeight(0.1),
                                    width: kWidth(.7),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.access_time_outlined,
                                          size: kHeight(.03),
                                        ),
                                        widthBox(.04),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: kWidth(.58),
                                              child: CustomText(
                                                  alignText: TextAlign.left,
                                                  text: "Select Citywalk Mall",
                                                  textStyle: KTextStyles()
                                                      .normal(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.w700)),
                                            ),
                                            heightBox(.005),
                                            SizedBox(
                                              width: kWidth(.58),
                                              child: CustomText(
                                                  alignText: TextAlign.left,
                                                  maxLines: 2,
                                                  text:
                                                      "Saket disctrict center, district center, sector 6, pushp vihar, New delhi, delhi 110017",
                                                  textStyle: KTextStyles()
                                                      .normal(
                                                          fontSize: 12,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  heightBox(0.04),
                                  Container(
                                    height: kHeight(.12),
                                    width: kWidth(.7),
                                    decoration: BoxDecoration(
                                        color: KColors.kPrimary,
                                        borderRadius:
                                            BorderRadius.circular(kWidth(.02))),
                                    padding: EdgeInsets.only(left: kWidth(.02)),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Expanded(
                                          flex: 7,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              CustomText(
                                                  text: "Finalize payment:",
                                                  textStyle: KTextStyles()
                                                      .normal(
                                                          textColor:
                                                              KColors.kWhite,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                              heightBox(0.002),
                                              CustomText(
                                                  text: "Pkr 170.71",
                                                  textStyle: KTextStyles()
                                                      .normal(
                                                          textColor:
                                                              KColors.kWhite,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                              CustomText(
                                                  text: "Pay",
                                                  textStyle: KTextStyles()
                                                      .normal(
                                                          textColor:
                                                              KColors.kWhite,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w400)),
                                            ],
                                          ),
                                        ),
                                        Expanded(
                                          flex: 3,
                                          child: Stack(
                                            children: [
                                              SizedBox(
                                                height: kHeight(.12),
                                                child: Image.asset(
                                                  "assets/images/container.png",
                                                  fit: BoxFit.fill,
                                                ),
                                              ),
                                              Align(
                                                alignment:
                                                    Alignment.centerRight,
                                                child: Image.asset(
                                                  "assets/images/notification.png",
                                                  height: kHeight(.08),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    right: kWidth(.02)),
                                                child: Align(
                                                  alignment:
                                                      Alignment.centerRight,
                                                  child: Image.asset(
                                                    "assets/icons/notification.png",
                                                    height: kHeight(.05),
                                                  ),
                                                ),
                                              )
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  heightBox(.005),
                                  const Divider(
                                    thickness: 1,
                                    color: KColors.kBorderColor,
                                  ),
                                  heightBox(.04),
                                  PrimaryButton(
                                    color: const Color(0xff393B40),
                                    width: .7,
                                    text: "Pay Now",
                                    function: () {
                                      Get.toNamed("/cartowhome");
                                    },
                                  )
                                ],
                              ),
                            ),
                          );
                          // mapController.swapLocations();
                        },
                        child: Image.asset(
                          "assets/icons/swap.png",
                          height: kHeight(0.04),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MapController extends GetxController {
  var startPoint = ''.obs;
  var destination = ''.obs;
  void swapLocations() {
    var temp = startPoint.value;
    startPoint.value = destination.value;
    destination.value = temp;
  }
}
