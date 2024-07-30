import 'package:auto_services/screens/technical_test/view/book_technical_test.dart';
import 'package:auto_services/screens/technical_test/view/brake_system.dart';
import 'package:auto_services/screens/technical_test/view/engine_health.dart';
import 'package:auto_services/screens/technical_test/view/general_inspection.dart';
import 'package:auto_services/screens/technical_test/view/report_of_test.dart';
import 'package:auto_services/screens/technical_test/view/suspension_steering.dart';
import 'package:auto_services/screens/technical_test/view/technical_test.dart';
import 'package:auto_services/screens/technical_test/view/technical_test_home.dart';
import 'package:auto_services/screens/technical_test/view/testreport.dart';
import 'package:auto_services/screens/technical_test/view/vehicle_info.dart';
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
  GetPage(name: '/signup', page: () => const RegistrationScreen()),
  GetPage(name: '/forgetpassword', page: () => const ForgetPassword()),
  GetPage(name: '/resetpassword', page: () => const Resetpassword()),
  GetPage(name: '/verification', page: () => VerificationScreen()),
  GetPage(name: '/pages', page: () => Pages()),
  GetPage(name: '/cartow', page: () => const CarSelectionScreen()),
  GetPage(name: '/carrepairhome', page: () => const CarRepairHome()),
  GetPage(
      name: '/booking', page: () => const CarRepairServiceSelectionScreen()),
  GetPage(
      name: '/carservices', page: () => const CarServicePkgSelectionScreen()),
  GetPage(name: '/caraddition', page: () => CarAddtion()),
  GetPage(name: '/carmechanic', page: () => const CarMechanicSelection()),
  GetPage(name: '/map', page: () => const TowLocationSelectionScreen()),
  GetPage(name: '/booknow', page: () => const BookNow()),
  GetPage(name: '/serviceapproval', page: () => const ServiceApproval()),
  GetPage(name: '/consumerservice', page: () => const ConsumerService()),
  GetPage(name: '/consumerprofile', page: () => const ConsumerProfile()),
  GetPage(
      name: '/consumerprofileedit', page: () => const ConsumerProfileEdit()),
  GetPage(name: '/seebooking', page: () => const CarRepairBooking()),
  GetPage(name: '/technicaltest', page: () => const TechnicalTest()),
  GetPage(name: '/cartowbottomnav', page: () => const CarTowBottomNavBar()),
  GetPage(
      name: '/carrepairbottomnav', page: () => const CarRepairBottomNavBar()),
  // TECHNICAL TEST//
  GetPage(name: '/technicaltesthome', page: () => const TechnicalTestHome()),
  GetPage(name: '/vehicleinfo', page: () => VehicleInfo()),
  GetPage(name: '/generalinspection', page: () => const GeneralInspection()),
  GetPage(name: '/enginehealth', page: () => const EngineHealth()),
  GetPage(name: '/brakesystem', page: () => const BrakeSystem()),
  GetPage(name: '/suspensionsteering', page: () => const SuspensionSteering()),
  GetPage(name: '/reportoftest', page: () => const ReportOfTest()),
  GetPage(name: '/booktechnicaltest', page: () => BookTechnicalTest()),
  GetPage(name: '/testreport', page: () => const Testreport()),
];
