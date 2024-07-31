import '../widgets/widgets_imports.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final double width;
  final double height;
  final double borderRadius;
  final Color color;
  final EdgeInsets padding;
  final double fontsize;

  const PrimaryButton({
    Key? key,
    required this.text,
    required this.function,
    this.color = KColors.kPrimary,
    this.width = .5,
    this.height = .054,
    this.borderRadius = .03,
    this.padding = EdgeInsets.zero,
    this.fontsize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(kWidth(borderRadius)),
          ),
        ),
        padding: padding,
        child: Center(
          child: CustomText(
            text: text,
            textStyle: KTextStyles().buttonStyle(
              fontSize: fontsize,
            ),
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final double width;
  final double height;
  final double borderRadius;
  final Color color;
  final EdgeInsets padding;

  const SecondaryButton({
    Key? key,
    required this.text,
    required this.function,
    this.color = KColors.kPrimary,
    this.width = .5,
    this.height = .054,
    this.borderRadius = .03,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(kWidth(borderRadius)),
          ),
        ),
        padding: padding,
        child: Center(
          child: CustomText(
            text: text,
            textStyle: KTextStyles().buttonStyle(),
          ),
        ),
      ),
    );
  }
}

class IconTextButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback function;
  final double width;
  final double height;
  final double borderRadius, fontsize, size;
  final Color color, textcolor;
  final double elevation;
  final EdgeInsets padding;

  const IconTextButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.function,
    this.color = KColors.kPrimary,
    this.width = .5,
    this.height = .054,
    this.borderRadius = .054,
    this.elevation = 0,
    this.padding = EdgeInsets.zero,
    this.textcolor = KColors.kWhite,
    this.fontsize = 16.0,
    this.size = 10,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(kWidth(borderRadius)),
          ),
        ),
        padding: padding,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomText(
                text: text,
                textStyle: KTextStyles().buttonStyle(fontSize: fontsize, textColor: textcolor),
              ),
              widthBox(.02),
              Icon(
                icon,
                size: size,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class IconTextButton2 extends StatelessWidget {
  final String text;
  final String img;
  final VoidCallback function;
  final double width;
  final double height;
  final double borderRadius;
  final Color color;
  final double elevation;
  final EdgeInsets padding;

  const IconTextButton2({
    Key? key,
    required this.text,
    required this.img,
    required this.function,
    this.color = KColors.kPrimary,
    this.width = .5,
    this.height = .054,
    this.borderRadius = .054,
    this.elevation = 0,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: color,
          // border: Border.all(color: const Color(0xffD9D9D9)),
          borderRadius: BorderRadius.all(
            Radius.circular(
              kWidth(borderRadius),
            ),
          ),
        ),
        padding: padding,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                img,
                height: kHeight(.03),
              ),
              widthBox(.03),
              CustomText(
                text: text,
                textStyle: KTextStyles().buttonStyle(fontWeight: FontWeight.w500, fontSize: 16, textColor: const Color(0xff61677D)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class KIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback function;
  final double width;
  final double height;
  final double borderRadius;
  final Color color;
  final double elevation;
  final EdgeInsets padding;

  const KIconButton({
    Key? key,
    required this.icon,
    required this.function,
    this.color = KColors.kPrimary,
    this.width = .5,
    this.height = .054,
    this.borderRadius = .054,
    this.elevation = 0,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.all(
            Radius.circular(kWidth(borderRadius)),
          ),
        ),
        padding: padding,
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}

class OutlineButton extends StatelessWidget {
  final String text;
  final VoidCallback function;
  final double width;
  final double height;
  final double borderRadius;
  final Color color, textColor;
  final double elevation, fontsize;
  final EdgeInsets padding;

  const OutlineButton({
    Key? key,
    required this.text,
    required this.function,
    this.color = KColors.kPrimary,
    this.width = .5,
    this.height = .054,
    this.borderRadius = .054,
    this.elevation = 0,
    this.padding = EdgeInsets.zero,
    this.textColor = KColors.kPrimary,
    this.fontsize = 16,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: KColors.kWhite,
          border: Border.all(
            width: 1.0,
            color: color,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(kWidth(borderRadius)),
          ),
        ),
        padding: padding,
        child: Center(
          child: CustomText(
            text: text,
            textStyle: KTextStyles().buttonStyle(
              textColor: textColor,
              fontSize: fontsize,
            ),
          ),
        ),
      ),
    );
  }
}

class OutlineIconTextButton extends StatelessWidget {
  final String text;
  final IconData icon;
  final VoidCallback function;
  final double width;
  final double height;
  final double borderRadius;
  final Color color;
  final double elevation;
  final EdgeInsets padding;

  const OutlineIconTextButton({
    Key? key,
    required this.text,
    required this.icon,
    required this.function,
    this.color = KColors.kPrimary,
    this.width = .5,
    this.height = .054,
    this.borderRadius = .054,
    this.elevation = 0,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: KColors.noColor,
          border: Border.all(
            width: 1.0,
            color: color,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(kWidth(borderRadius)),
          ),
        ),
        padding: padding,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(icon),
              widthBox(.02),
              CustomText(
                text: text,
                textStyle: KTextStyles().buttonStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class OutlineIconTextButton2 extends StatelessWidget {
  final String text;
  final String img;
  final VoidCallback function;
  final double width;
  final double height;
  final double borderRadius, fontSize;
  final Color color, textColor;
  final double elevation;
  final EdgeInsets padding;

  const OutlineIconTextButton2({
    Key? key,
    required this.text,
    required this.img,
    required this.function,
    this.color = KColors.kPrimary,
    this.width = .5,
    this.height = .054,
    this.borderRadius = .054,
    this.elevation = 0,
    this.padding = EdgeInsets.zero,
    this.textColor = KColors.kPrimary,
    this.fontSize = 18.0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: KColors.noColor,
          border: Border.all(width: 1.0, color: color),
          borderRadius: BorderRadius.all(Radius.circular(kWidth(borderRadius))),
        ),
        padding: padding,
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(img, height: kHeight(.04)),
              widthBox(.02),
              CustomText(text: text, textStyle: KTextStyles().buttonStyle(fontSize: fontSize, textColor: textColor)),
            ],
          ),
        ),
      ),
    );
  }
}

class OutlineIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback function;
  final double width;
  final double height;
  final double borderRadius;
  final Color color;
  final double elevation;
  final EdgeInsets padding;

  const OutlineIconButton({
    Key? key,
    required this.icon,
    required this.function,
    this.color = KColors.kPrimary,
    this.width = .5,
    this.height = .054,
    this.borderRadius = .054,
    this.elevation = 0,
    this.padding = EdgeInsets.zero,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(
        height: kHeight(height),
        width: kWidth(width),
        decoration: BoxDecoration(
          color: KColors.noColor,
          border: Border.all(
            width: 1.0,
            color: color,
          ),
          borderRadius: BorderRadius.all(
            Radius.circular(kWidth(borderRadius)),
          ),
        ),
        padding: padding,
        child: Center(
          child: Icon(icon),
        ),
      ),
    );
  }
}
