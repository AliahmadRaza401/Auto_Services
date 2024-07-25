import 'package:auto_services/common_models/booking.dart';
import 'package:auto_services/common_models/brand.dart';
import 'package:auto_services/utils/loader.dart';
import 'package:auto_services/widgets/widgets_imports.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_cloud_firestore/firebase_cloud_firestore.dart';

class CarTowController extends GetxController {
  static CarTowController get instance => Get.find();

  /// Variables
  final isLoading = false.obs;
  final brandList = RxList<BrandModel>();
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  final selectedBrand = Rxn<BrandModel>();
  final searchController = TextEditingController();
  final source = TextEditingController();
  final destination = TextEditingController();
  final preferredDate = TextEditingController();
  final selectedPageIndex = 0.obs;
  final carTowRequests = RxList<BookingModel>();

  /// Functions

  // Update Page on Bottom Icon Click
  changeIndex(int index) => selectedPageIndex.value = index;

  // Get All Car Brands
  fetchBrands() async {
    try {
      isLoading.value = true;

      final response = await _firestore.collection('Resources').get();
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
    if (source.text.trim().isNotEmpty && destination.text.trim().isNotEmpty) {
      final temp = source.text;
      source.text = destination.text;
      destination.text = temp;
    }
  }

  // Select Location Dialog
  selectLocationDialog({required TextEditingController controller}) {
    Get.bottomSheet(
      isScrollControlled: true,
      Container(
        height: kHeight(0.65),
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
                    child: TextField(
                      controller: searchController,
                      style: const TextStyle(color: KColors.kBlack),
                      cursorColor: KColors.kBlack,
                      onChanged: (value) => controller.text = value,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: const InputDecoration(
                        prefixIcon: Icon(Icons.search),
                        prefixIconColor: KColors.kBlack,
                        hintText: "Where to ?",
                        hintStyle: TextStyle(color: KColors.kBlack),
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
            heightBox(.02),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time_filled_rounded, size: kHeight(.03)),
                    widthBox(.04),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: kWidth(.58),
                          child: CustomText(alignText: TextAlign.left, text: "Select Citywalk Mall", textStyle: KTextStyles().normal(fontSize: 16, fontWeight: FontWeight.w700)),
                        ),
                        heightBox(.005),
                        SizedBox(
                          width: kWidth(.58),
                          child: CustomText(
                              alignText: TextAlign.left,
                              maxLines: 2,
                              text: "Saket disctrict center, district center, sector 6, pushp vihar, New delhi, delhi 110017",
                              textStyle: KTextStyles().normal(fontSize: 12, fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                  ],
                ),
                const Divider(thickness: 1, color: KColors.kBorderColor),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time_filled_rounded, size: kHeight(.03)),
                    widthBox(.04),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: kWidth(.58),
                          child: CustomText(alignText: TextAlign.left, text: "Select Citywalk Mall", textStyle: KTextStyles().normal(fontSize: 16, fontWeight: FontWeight.w700)),
                        ),
                        heightBox(.005),
                        SizedBox(
                          width: kWidth(.58),
                          child: CustomText(
                              alignText: TextAlign.left,
                              maxLines: 2,
                              text: "Saket disctrict center, district center, sector 6, pushp vihar, New delhi, delhi 110017",
                              textStyle: KTextStyles().normal(fontSize: 12, fontWeight: FontWeight.w400)),
                        )
                      ],
                    ),
                  ],
                ),
              ],
            ),
            heightBox(.03),
          ],
        ),
      ),
    );
  }

  // Booking Dialog
  bookingDialog() {
    if (selectedService.value != null && source.text.trim().isNotEmpty && destination.text.trim().isNotEmpty && preferredDate.text.trim().isNotEmpty) {
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
      if (selectedService.value != null && source.text.trim().isNotEmpty && destination.text.trim().isNotEmpty && preferredDate.text.trim().isNotEmpty) {
        // Show full Screen Loader
        KLoaders.showFullScreenLoader(text: 'Booking for Towing Car');

        final booking = BookingModel(
          carId: '',
          brand: selectedBrand.value?.name ?? '',
          source: source.text.trim(),
          mainService: selectedService.value ?? '',
          preferredDate: preferredDate.text.trim(),
          destination: destination.text.trim(),
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
        final response = await _firestore.collection('Booking').add(booking.toJson());

        KLoaders.closeFullScreenLoader();

        source.clear();
        destination.clear();
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

  Stream<List<BookingModel>> getUserBookings() {
    List<BookingModel> records = [];
    Stream<QuerySnapshot> snapshots = _firestore.collection('Booking').where('CustomerId', isEqualTo: _auth.currentUser?.uid).snapshots();
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

  @override
  void onInit() {
    super.onInit();
    fetchBrands();
    carTowRequests.bindStream(getUserBookings());
  }
}
