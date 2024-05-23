import 'widgets/widgets_imports.dart';

void main() {
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
