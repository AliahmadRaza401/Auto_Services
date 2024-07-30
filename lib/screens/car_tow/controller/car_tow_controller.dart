import 'dart:async';
import 'dart:math';

import 'package:auto_services/common_models/booking.dart';
import 'package:auto_services/common_models/brand.dart';
import 'package:auto_services/data/service/firebase_message_service.dart';
import 'package:auto_services/utils/loader.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:widget_to_marker/widget_to_marker.dart';

import '../../../common_models/notification.dart';
import '../../../utils/colors.dart';
import '../../../utils/constants.dart';
import '../../../utils/custom_text_styles.dart';
import '../../../utils/dynamic_sizes.dart';
import '../../../widgets/custom_button.dart';
import '../../../widgets/custom_text.dart';
import '../../../widgets/snackbars.dart';
import '../view/car_tow_bottomnavbar.dart';
import '../view/requesting/tow_location_selection_screen.dart';

class CarTowController extends GetxController {
  static CarTowController get instance => Get.find();

  /// Variables
  final isLoading = false.obs;
  final brandList = RxList<BrandModel>();
  final _fireStore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final selectedBrand = Rxn<BrandModel>();
  final searchController = TextEditingController();
  final source = Rxn<Prediction>();
  final destination = Rxn<Prediction>();
  final preferredDate = TextEditingController();
  final selectedPageIndex = 0.obs;
  final carTowRequests = RxList<BookingModel>();
  final marker = RxList<Marker>();
  final polyLine = RxList<Polyline>();
  final mapController = Rxn<GoogleMapController>();
  final mapStyleString = ''.obs;
  final carTowNotifications = RxList<NotificationModel>();

  /// Functions

  // Update Page on Bottom Icon Click
  changeIndex(int index) => selectedPageIndex.value = index;

  // Get All Car Brands
  fetchBrands() async {
    try {
      isLoading.value = true;

      final response = await _fireStore.collection('Resources').get();
      final data = response.docs.first.data();
      brandList.value = List<BrandModel>.from(data['Brands'].map((item) => BrandModel.fromJson(item)));

      isLoading.value = false;
    } on FirebaseException catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    } on Exception catch (e) {
      isLoading.value = false;
      KSnackBar().errorSnackBar(e.toString());
    }
  }

  // Select Car and Go to Location Selection Screen
  selectCar(BrandModel brand) {
    selectedBrand.value = brand;
    Get.to(() => const TowLocationSelectionScreen());
  }

  // Swap Location Markers
  void swapLocations() {
    final temp = source.value;
    source.value = destination.value;
    destination.value = temp;
    updateMapMarkers();
    drawPolyline();
  }

  // Select Location Dialog
  selectLocationDialog({required String side}) {
    final insideController = TextEditingController();
    Get.bottomSheet(
      isScrollControlled: true,
      Container(
        height: kHeight(0.5),
        width: kWidth(.95),
        padding: EdgeInsets.symmetric(horizontal: kWidth(0.05), vertical: kWidth(0.06)),
        decoration: BoxDecoration(color: KColors.kWhite, borderRadius: BorderRadius.vertical(top: Radius.circular(kWidth(.08)))),
        child: Column(
          children: [
            Container(
              decoration: BoxDecoration(color: KColors.kBorderColor, borderRadius: BorderRadius.circular(kWidth(.1))),
              padding: const EdgeInsets.only(right: 10, left: 0, top: 5, bottom: 5),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: GooglePlaceAutoCompleteTextField(
                      textEditingController: insideController,
                      googleAPIKey: "AIzaSyCCLY3hc85cQG-V_FUl-hlkeeN8hBX7npM",
                      inputDecoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: KColors.kBlack,
                        hintText: "Where to ?",
                        hintStyle: TextStyle(color: KColors.kBlack),
                        border: InputBorder.none,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      containerVerticalPadding: 0,
                      textStyle: KTextStyles().normal(textColor: KColors.kTertiary),
                      boxDecoration: BoxDecoration(border: Border.all(color: KColors.noColor, width: 0)),
                      debounceTime: 800, // default 600 ms,
                      countries: ["pk"], // optional by default null is set
                      isLatLngRequired: true, // if you required coordinates from place detail
                      getPlaceDetailWithLatLng: (Prediction prediction) async {
                        if (kDebugMode) {
                          print("placeDetails${prediction.lng}");
                        }
                      }, // this callback is called when isLatLngRequired is true
                      itemClick: (Prediction prediction) {
                        if (side == 'source') {
                          source.value = prediction;
                        } else if (side == 'destination') {
                          destination.value = prediction;
                        }
                        updateMapMarkers();
                        drawPolyline();
                        showFullRoute();
                        Get.back();
                      },
                      // if we want to make custom list item builder
                      itemBuilder: (context, index, Prediction prediction) {
                        return Container(
                          padding: const EdgeInsets.all(10),
                          child: Row(
                            children: [
                              const Icon(Icons.location_on),
                              const SizedBox(width: 7),
                              Expanded(child: Text(prediction.description ?? "", style: KTextStyles().normal(textColor: KColors.kTertiary))),
                            ],
                          ),
                        );
                      },
                      seperatedBuilder: Divider(height: 5, color: KColors.kGrey.withOpacity(.5)),
                      isCrossBtnShown: true,
                      containerHorizontalPadding: kWidth(0.05),
                      placeType: PlaceType.address,
                    ),
                  ),
                  // widthBox(.02),
                  // IconTextButton(
                  //   width: 0.2,
                  //   fontsize: 12,
                  //   color: KColors.kWhite,
                  //   textcolor: KColors.kPrimary,
                  //   text: "Now",
                  //   icon: CupertinoIcons.chevron_down,
                  //   function: () {},
                  // ),
                ],
              ),
            ),
            // heightBox(.02),
            // Column(
            //   mainAxisSize: MainAxisSize.min,
            //   children: [
            //     Row(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Icon(Icons.access_time_filled_rounded, size: kHeight(.03)),
            //         widthBox(.04),
            //         Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             SizedBox(
            //               width: kWidth(.58),
            //               child: CustomText(alignText: TextAlign.left, text: "Select Citywalk Mall", textStyle: KTextStyles().normal(fontSize: 16, fontWeight: FontWeight.w700)),
            //             ),
            //             heightBox(.005),
            //             SizedBox(
            //               width: kWidth(.58),
            //               child: CustomText(
            //                   alignText: TextAlign.left,
            //                   maxLines: 2,
            //                   text: "Saket disctrict center, district center, sector 6, pushp vihar, New delhi, delhi 110017",
            //                   textStyle: KTextStyles().normal(fontSize: 12, fontWeight: FontWeight.w400)),
            //             )
            //           ],
            //         ),
            //       ],
            //     ),
            //     const Divider(thickness: 1, color: KColors.kBorderColor),
            //     Row(
            //       crossAxisAlignment: CrossAxisAlignment.center,
            //       children: [
            //         Icon(Icons.access_time_filled_rounded, size: kHeight(.03)),
            //         widthBox(.04),
            //         Column(
            //           mainAxisAlignment: MainAxisAlignment.center,
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             SizedBox(
            //               width: kWidth(.58),
            //               child: CustomText(alignText: TextAlign.left, text: "Select Citywalk Mall", textStyle: KTextStyles().normal(fontSize: 16, fontWeight: FontWeight.w700)),
            //             ),
            //             heightBox(.005),
            //             SizedBox(
            //               width: kWidth(.58),
            //               child: CustomText(
            //                   alignText: TextAlign.left,
            //                   maxLines: 2,
            //                   text: "Saket disctrict center, district center, sector 6, pushp vihar, New delhi, delhi 110017",
            //                   textStyle: KTextStyles().normal(fontSize: 12, fontWeight: FontWeight.w400)),
            //             )
            //           ],
            //         ),
            //       ],
            //     ),
            //   ],
            // ),
            // heightBox(.03),
          ],
        ),
      ),
    );
  }

  // Update Markers
  updateMapMarkers() async {
    marker.clear();
    if (source.value != null) {
      final sourceIcon = await const Icon(Icons.circle, color: KColors.kBlack).toBitmapDescriptor();
      marker.add(
        Marker(
          markerId: const MarkerId('Source Location'),
          position: LatLng(
            double.tryParse(source.value?.lat ?? '0.0') ?? 0.0,
            double.tryParse(source.value?.lng ?? '0.0') ?? 0.0,
          ),
          icon: sourceIcon,
          visible: true,
          draggable: false,
        ),
      );
    }
    if (destination.value != null) {
      final destIcon = await const Icon(Icons.location_on, color: KColors.kPrimary).toBitmapDescriptor();
      marker.add(
        Marker(
          markerId: const MarkerId('Destination Location'),
          position: LatLng(
            double.tryParse(destination.value?.lat ?? '0.0') ?? 0.0,
            double.tryParse(destination.value?.lng ?? '0.0') ?? 0.0,
          ),
          icon: destIcon,
          visible: true,
          draggable: false,
        ),
      );
    }
  }

  // Draw Polyline
  drawPolyline() {
    if (source.value != null && destination.value != null) {
      polyLine.clear();
      polyLine.add(
        Polyline(
          polylineId: const PolylineId('Way'),
          visible: true,
          points: [
            LatLng(double.tryParse(source.value?.lat ?? '0.0') ?? 0.0, double.tryParse(source.value?.lng ?? '0.0') ?? 0.0),
            LatLng(double.tryParse(destination.value?.lat ?? '0.0') ?? 0.0, double.tryParse(destination.value?.lng ?? '0.0') ?? 0.0)
          ],
          color: KColors.kPrimary,
        ),
      );
    }
  }

  // Show Full Route
  showFullRoute() {
    if (source.value != null && destination.value != null) {
      mapController.value!.animateCamera(CameraUpdate.newLatLngBounds(
          LatLngBounds(
              southwest: LatLng(min(double.tryParse(source.value?.lat ?? '0.0') ?? 0.0, double.tryParse(destination.value?.lat ?? '0.0') ?? 0.0),
                  min(double.tryParse(source.value?.lng ?? '0.0') ?? 0.0, double.tryParse(destination.value?.lng ?? '0.0') ?? 0.0)),
              northeast: LatLng(max(double.tryParse(source.value?.lat ?? '0.0') ?? 0.0, double.tryParse(destination.value?.lat ?? '0.0') ?? 0.0),
                  max(double.tryParse(source.value?.lng ?? '0.0') ?? 0.0, double.tryParse(destination.value?.lng ?? '0.0') ?? 0.0))),
          100));
    }
  }

  // Booking Dialog
  bookingDialog() {
    if (selectedService.value != null && source.value != null && destination.value != null && preferredDate.text.trim().isNotEmpty) {
      Get.bottomSheet(
        isScrollControlled: true,
        Container(
          height: kHeight(0.3),
          width: kWidth(.95),
          padding: EdgeInsets.symmetric(horizontal: kWidth(0.05), vertical: kWidth(0.06)),
          decoration: BoxDecoration(color: KColors.kWhite, borderRadius: BorderRadius.vertical(top: Radius.circular(kWidth(.08)))),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(color: KColors.kPrimary, borderRadius: BorderRadius.circular(kWidth(.02))),
                padding: EdgeInsets.only(left: kWidth(.02)),
                height: 120,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(kWidth(.02)),
                  child: Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Image.asset("assets/images/container.png", fit: BoxFit.fill),
                      Image.asset("assets/images/notification.png", height: kHeight(.1)),
                      Positioned(right: 10, child: Image.asset("assets/icons/notification.png", height: kHeight(.05))),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(text: "Finalize payment:", textStyle: KTextStyles().normal(textColor: KColors.kWhite, fontSize: 22, fontWeight: FontWeight.w400)),
                            CustomText(text: "Pkr 170.71", textStyle: KTextStyles().normal(textColor: KColors.kWhite, fontSize: 22, fontWeight: FontWeight.w400)),
                            CustomText(text: "Pay", textStyle: KTextStyles().normal(textColor: KColors.kWhite, fontSize: 18, fontWeight: FontWeight.w400)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const Spacer(),
              PrimaryButton(
                color: const Color(0xff393B40),
                width: .7,
                text: "Pay now and Book",
                function: () => bookingCarTow(),
              ),
            ],
          ),
        ),
      );
    } else {
      KSnackBar().infoSnackBar('Fill Required Fields Data');
    }
  }

  // Book Car Tow
  bookingCarTow() async {
    try {
      if (selectedService.value != null && source.value != null && destination.value != null && preferredDate.text.trim().isNotEmpty) {
        // Show full Screen Loader
        KLoaders.showFullScreenLoader(text: 'Booking for Towing Car');

        final booking = BookingModel(
          carId: '',
          brand: selectedBrand.value?.name ?? '',
          source: source.value?.description ?? '',
          sourceLatLng: GeoPoint(double.tryParse(source.value?.lat ?? '0.0') ?? 0.0, double.tryParse(source.value?.lng ?? '0.0') ?? 0.0),
          destination: destination.value?.description ?? '',
          destinationLatLng: GeoPoint(double.tryParse(destination.value?.lat ?? '0.0') ?? 0.0, double.tryParse(destination.value?.lng ?? '0.0') ?? 0.0),
          mainService: selectedService.value ?? '',
          preferredDate: preferredDate.text.trim(),
          id: '',
          status: 'Pending',
          mechanicId: '',
          mechanicName: '',
          mechanicContactNo: '',
          mechanicProfilePic: '',
          customerId: _auth.currentUser?.uid ?? '',
          customerName: userData.value?.name ?? '',
          customerContactNo: userData.value?.phone ?? '',
          customerProfilePic: userData.value?.profilePic ?? '',
          paymentStatus: 'Pending',
          subService: '',
          subServiceDetail: null,
        );
        await _fireStore.collection('Booking').add(booking.toJson());
        KLoaders.closeFullScreenLoader();

        source.value = null;
        destination.value = null;
        preferredDate.clear();
        Get.off(() => const CarTowBottomNavBar());
        KSnackBar().successSnackBar('Car Tow Booking Successfully');
      } else {
        KSnackBar().infoSnackBar('Fill Required Fields Data');
      }
    } on FirebaseException catch (e) {
      KLoaders.closeFullScreenLoader();
      KSnackBar().errorSnackBar(e.toString());
    } on Exception catch (e) {
      KLoaders.closeFullScreenLoader();
      KSnackBar().errorSnackBar(e.toString());
    }
  }

  // Stream of Bookings
  Stream<List<BookingModel>> getUserBookings() {
    List<BookingModel> records = [];
    Stream<QuerySnapshot> snapshots = _fireStore.collection('Booking').where('CustomerId', isEqualTo: _auth.currentUser?.uid).snapshots();
    snapshots.listen((QuerySnapshot query) {
      if (query.docChanges.isNotEmpty) {
        records.clear();
      }
    });
    return snapshots.map((snapshot) {
      for (var item in snapshot.docs) {
        records.add(BookingModel.fromSnapshot(item as DocumentSnapshot<Map<String, dynamic>>));
      }
      return records.toList();
    });
  }

  // Stream of Notifications
  Stream<List<NotificationModel>> getNotifications() {
    List<NotificationModel> records = [];
    Stream<QuerySnapshot> snapshots = _fireStore.collection('Notifications').where('ServiceType', isEqualTo: 'Car-Tow').where('To', isEqualTo: userData.value?.id).snapshots();
    snapshots.listen((QuerySnapshot query) {
      if (query.docChanges.isNotEmpty) {
        records.clear();
      }
    });
    return snapshots.map((snapshot) {
      for (var item in snapshot.docs) {
        records.add(NotificationModel.fromSnapshot(item as DocumentSnapshot<Map<String, dynamic>>));
      }
      return records.toList();
    });
  }

  @override
  void onInit() {
    rootBundle.loadString('assets/other/map_style.json').then((string) {
      mapStyleString.value = string;
    });
    super.onInit();
    fetchBrands();
    carTowRequests.bindStream(getUserBookings());
    carTowNotifications.bindStream(getNotifications());
  }
}
