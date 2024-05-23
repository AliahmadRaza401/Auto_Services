import 'package:flutter/gestures.dart';

import '../widgets/widgets_imports.dart';

class CustomText extends StatelessWidget {
  final String text;
  final TextStyle textStyle;
  final TextAlign alignText;
  final int maxLines;
  final double? minFontSize;
  final bool ellipsisText;

  const CustomText({
    Key? key,
    required this.text,
    required this.textStyle,
    this.alignText = TextAlign.center,
    this.maxLines = 1,
    this.ellipsisText = true,
    this.minFontSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AutoSizeText(
      text,
      textAlign: alignText,
      maxLines: maxLines,
      minFontSize: minFontSize ?? 8,
      overflow: ellipsisText ? TextOverflow.ellipsis : null,
      style: textStyle,
    );
  }
}

enum FocusPosition { start, end }

class CustomRichText extends StatelessWidget {
  const CustomRichText({
    Key? key,
    required this.normalText,
    required this.focusedText,
    this.focusedFontSize = 16,
    this.normalFontSize = 14,
    this.normalColor = KColors.kBlack,
    this.focusedColor = KColors.kBlack,
    this.focusPosition = FocusPosition.end,
    this.maxLines = 1,
    required this.nextpage,
  }) : super(key: key);
  final String normalText, focusedText;
  final double focusedFontSize, normalFontSize;
  final Color normalColor, focusedColor;
  final FocusPosition focusPosition;
  final int maxLines;
  final VoidCallback nextpage;

  @override
  Widget build(BuildContext context) {
    return AutoSizeText.rich(
      TextSpan(
        children: [
          if (focusPosition == FocusPosition.start)
            TextSpan(
              text: focusedText,
              style: TextStyle(
                color: focusedColor,
                fontSize: focusedFontSize,
                fontWeight: FontWeight.bold,
              ),
            ),
          TextSpan(
            text: normalText,
            style: TextStyle(
              color: normalColor,
              fontSize: normalFontSize,
            ),
          ),
          if (focusPosition == FocusPosition.end)
            TextSpan(
              text: focusedText,
              style: TextStyle(
                color: focusedColor,
                fontSize: focusedFontSize,
                fontWeight: FontWeight.bold,
              ),
              recognizer: TapGestureRecognizer()..onTap = nextpage,
            ),
        ],
      ),
      style: TextStyle(
        color: normalColor,
        fontSize: normalFontSize,
      ),
      maxLines: maxLines,
    );
  }
}
