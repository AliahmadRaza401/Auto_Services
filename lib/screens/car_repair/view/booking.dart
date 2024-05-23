import 'package:auto_services/screens/car_repair/controller/booking_controller.dart';
import 'package:auto_services/widgets/custom_app_bar.dart';
import 'package:auto_services/widgets/widgets_imports.dart';
import 'package:carousel_slider/carousel_slider.dart';

class Booking extends StatelessWidget {
  Booking({super.key});
  final BookingController controller = Get.put(BookingController());
  final TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: "", actions: []),
      body: SizedBox(
        height: context.height,
        width: context.width,
        child: Column(
          children: [
            heightBox(0.02),
            CustomTextField2(
              controller: searchController,
              label: "Search Location",
              hintText: "",
              keyboardType: TextInputType.text,
              suffixIcon: const Icon(null),
              prefixIcon: const Icon(
                Icons.search,
                color: KColors.kTfield,
              ),
              hasPrefix: true,
            ),
            Center(
              child: SizedBox(
                width: kWidth(0.95),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CarouselSlider.builder(
                      itemCount: 3,
                      itemBuilder: (context, index, realIndex) {
                        return Container(
                          width: context.width,
                          height: kHeight(.25),
                          decoration: BoxDecoration(
                            color: KColors.kWhite,
                            borderRadius: BorderRadius.circular(kWidth(.02)),
                          ),
                          margin: EdgeInsets.symmetric(
                            vertical: kHeight(.02),
                            horizontal: kWidth(.02),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(kWidth(.02)),
                            child: Image.asset(
                              "assets/images/sllder1.png",
                              fit: BoxFit.fill,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                "",
                              ),
                            ),
                          ),
                        );
                      },
                      options: CarouselOptions(
                        enlargeCenterPage: true,
                        autoPlay: true,
                        viewportFraction: 0.98,
                        enlargeStrategy: CenterPageEnlargeStrategy.height,
                        autoPlayCurve: Curves.easeInOut,
                      ),
                    ),
                    heightBox(.01),
                    CustomText(
                        text: "Select Service",
                        textStyle: KTextStyles()
                            .normal(fontSize: 16, fontWeight: FontWeight.w700)),
                    heightBox(0.04),
                    Center(
                      child: SizedBox(
                        height: kHeight(.3),
                        width: kWidth(.8),
                        child: GridView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.homecard.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  mainAxisSpacing: 10,
                                  crossAxisSpacing: 10,
                                  childAspectRatio: 0.95,
                                  crossAxisCount: 4),
                          itemBuilder: (context, index) {
                            return BookingCard(
                              img: controller.homecard[index]["img"],
                              title: controller.homecard[index]["title"],
                              func: controller.homecard[index]["func"],
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BookingCard extends StatelessWidget {
  final String img;
  final String title;
  final VoidCallback func;
  const BookingCard({
    super.key,
    required this.img,
    required this.title,
    required this.func,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: func,
      child: Container(
        height: kHeight(.17),
        width: kWidth(.15),
        decoration: BoxDecoration(
          border: Border.all(
            color: const Color(0xffEAEBEC),
          ),
          color: KColors.kWhite,
          borderRadius: BorderRadius.circular(
            kWidth(.02),
          ),
        ),
        child: Column(
          children: [
            heightBox(.01),
            Center(
              child: Image.asset(
                img,
                height: kHeight(0.04),
              ),
            ),
            SizedBox(
              width: kWidth(0.135),
              child: CustomText(
                  maxLines: 2,
                  text: title,
                  textStyle: KTextStyles().normal(
                      fontSize: 10,
                      fontWeight: FontWeight.w500,
                      textColor: KColors.kTextcolor)),
            )
          ],
        ),
      ),
    );
  }
}
