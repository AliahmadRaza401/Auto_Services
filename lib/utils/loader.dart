import '../widgets/widgets_imports.dart';

class KLoaders {
  static void showFullScreenLoader({String? text, String? lottie}) {
    showDialog(
      context: Get.overlayContext!,
      barrierDismissible: false,
      builder: (_) => PopScope(
        canPop: false,
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 5, sigmaY: 5),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (lottie?.isNotEmpty ?? false) LottieBuilder.asset(lottie!) else const CircularProgressIndicator(backgroundColor: KColors.kRed),
                const SizedBox(height: 20),
                Text(text ?? 'Loading...', style: Theme.of(Get.context!).textTheme.titleMedium!.copyWith(color: KColors.kRed)),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static void closeFullScreenLoader() => Navigator.of(Get.overlayContext!).pop();
}
