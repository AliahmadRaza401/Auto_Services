import 'package:firebase_core/firebase_core.dart';
import 'package:get_storage/get_storage.dart';
import 'data/repository/authentication_repository.dart';
import 'firebase_options.dart';
import 'widgets/widgets_imports.dart';

void main() async {
  /// ----- Widgets Binding -----
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  /// ----- Initialize Get Local Storage -----
  await GetStorage.init();

  /// ----- Initialize Firebase -----
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
    (FirebaseApp app) => Get.put(AuthenticationRepository()),
  );

  /// ----- Initialization and Handling Firebase Messaging -----
  // await FirebaseMessagingService.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: '',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: routes,
      theme: ThemeData(
        colorScheme: const ColorScheme(
          brightness: Brightness.light,
          primary: KColors.primaryColor,
          onPrimary: KColors.kWhite,
          secondary: KColors.kWhite,
          onSecondary: KColors.kRed,
          error: KColors.kRed,
          onError: KColors.kWhite,
          // background: KColors.kWhite,
          // onBackground: KColors.primaryColor,
          surface: KColors.kWhite,
          onSurface: KColors.kRed,
        ),
        scaffoldBackgroundColor: KColors.kWhite,
        // textTheme: GoogleFonts.anekTeluguTextTheme(
        //   Theme.of(context).textTheme,
        // ),
      ),
    );
  }
}
