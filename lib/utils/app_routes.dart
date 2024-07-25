import 'package:auto_services/screens/technical_test.dart';
import '../screens/auth/view/login.dart';
import '../screens/auth/view/resetpassword.dart';
import '../screens/auth/view/signup.dart';
import '../screens/auth/view/verification.dart';
import '../screens/car_repair/view/car_repair_bottomnavbar.dart';
import '../screens/consumer_services/view/consumer_profile_edit.dart';
import '../widgets/widgets_imports.dart';

dynamic routes = [
  GetPage(name: '/', page: () => const OnBoardingScreen()),
  GetPage(name: '/login', page: () => const LoginScreen()),
  GetPage(name: '/signup', page: () => RegistrationScreen()),
  GetPage(name: '/forgetpassword', page: () => const ForgetPassword()),
  GetPage(name: '/resetpassword', page: () => const Resetpassword()),
  GetPage(name: '/verification', page: () => VerificationScreen()),
  GetPage(name: '/pages', page: () => Pages()),
  GetPage(name: '/cartow', page: () => CarSelectionScreen()),
  GetPage(name: '/carrepairhome', page: () => const CarRepairHome()),
  GetPage(name: '/booking', page: () => CarRepairServiceSelectionScreen()),
  GetPage(name: '/carservices', page: () => const CarServicePkgSelectionScreen()),
  GetPage(name: '/caraddition', page: () => CarAddtion()),
  GetPage(name: '/carmechanic', page: () => const CarMechanicSelection()),
  GetPage(name: '/map', page: () => const TowLocationSelectionScreen()),
  GetPage(name: '/booknow', page: () => const BookNow()),
  GetPage(name: '/serviceapproval', page: () => const ServiceApproval()),
  GetPage(name: '/consumerservice', page: () => const ConsumerService()),
  GetPage(name: '/consumerprofile', page: () => const ConsumerProfile()),
  GetPage(name: '/consumerprofileedit', page: () => const ConsumerProfileEdit()),
  GetPage(name: '/seebooking', page: () => const CarRepairBooking()),
  GetPage(name: '/technicaltest', page: () => const TechnicalTest()),
  GetPage(name: '/cartowbottomnav', page: () => CarTowBottomNavBar()),
  GetPage(name: '/carrepairbottomnav', page: () => CarRepairBottomNavBar()),
];
