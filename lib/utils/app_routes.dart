import 'package:auto_services/screens/technical_test.dart';

import '../screens/car_repair/view/car_repair_bottomnavbar.dart';
import '../screens/consumer_services/view/consumer_profile_edit.dart';
import '../widgets/widgets_imports.dart';

dynamic routes = [
  GetPage(name: '/', page: () => const OnBoarding()),
  GetPage(name: '/login', page: () => Login()),
  GetPage(name: '/signup', page: () => SignUp()),
  GetPage(name: '/forgetpassword', page: () => const ForgetPassword()),
  GetPage(name: '/resetpassword', page: () => const Resetpassword()),
  GetPage(name: '/verification', page: () => VerificationScreen()),
  GetPage(name: '/pages', page: () => Pages()),
  GetPage(name: '/homescreen', page: () => HomeScreen()),
  GetPage(name: '/cartow', page: () => CarTow()),
  GetPage(name: '/carrepairhome', page: () => const CarRepairHome()),
  GetPage(name: '/booking', page: () => Booking()),
  GetPage(name: '/carservices', page: () => const CarServices()),
  GetPage(name: '/caraddition', page: () => CarAddtion()),
  GetPage(name: '/carmechanic', page: () => const CarMechanic()),
  GetPage(name: '/map', page: () => MapScreen()),
  GetPage(name: '/cartowhome', page: () => CarTowHome()),
  GetPage(name: '/booknow', page: () => const BookNow()),
  GetPage(name: '/serviceapproval', page: () => const ServiceApproval()),
  GetPage(name: '/consumerservice', page: () => const ConsumerService()),
  GetPage(name: '/consumerprofile', page: () => const ConsumerProfile()),
  GetPage(
      name: '/consumerprofileedit', page: () => const ConsumerProfileEdit()),
  GetPage(name: '/seebooking', page: () => const SeeBooking()),
  GetPage(name: '/technicaltest', page: () => const TechnicalTest()),
  GetPage(name: '/cartowbottomnav', page: () => CarTowBottomNavBar()),
  GetPage(name: '/carrepairbottomnav', page: () => CarRepairBottomNavBar()),
];
