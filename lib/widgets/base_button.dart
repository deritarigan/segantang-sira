part of base_widgets;

enum ButtonType {
  filled,
  outlined,
  flat,
}

enum ButtonSize {
  wrap,
  fullWidth,
}

class BaseButtonWidget extends StatelessWidget {
  final Widget? child;
  final Widget? icon;
  final String? text;
  final TextStyle? textStyle;
  final Color? fillColor;
  final Color? borderColor;
  final Color? textColor;
  final Color? disabledColor;
  final Color? disabledTextColor;
  final double? borderSize;
  final double? corner;
  final double? width;
  final double? height;
  final double? iconSpacing;
  final double? elevation;
  final double? textSize;
  final ButtonStyle? buttonStyle;
  final Alignment? alignment;
  final ButtonType buttonType;
  final ButtonSize? buttonSize;
  final MaterialTapTargetSize? materialTapTargetSize;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry? padding;

  const BaseButtonWidget({
    Key? key,
    required this.buttonType,
    this.child,
    this.icon,
    this.text,
    this.textStyle,
    this.fillColor,
    this.borderColor,
    this.borderSize,
    this.corner,
    this.width,
    this.height,
    this.iconSpacing,
    this.textColor,
    this.alignment,
    this.disabledTextColor,
    this.disabledColor,
    this.buttonStyle,
    this.buttonSize,
    this.elevation,
    this.materialTapTargetSize,
    this.onPressed,
    this.textSize,
    this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (buttonType) {
      case ButtonType.outlined:
        return buildOutlinedButton(context);
      case ButtonType.flat:
        return buildFlatButton(context);
      default:
        return buildButton(context);
    }
  }

  Widget buildButton(BuildContext context) => MaterialButton(
        key: key,
        height: defaultButtonSize?.height,
        minWidth: defaultButtonSize?.width ?? width,
        color: fillColor ?? Theme.of(context).buttonTheme.colorScheme?.primary,
        textColor: textColor,
        disabledColor: defaultDisabledColor,
        disabledTextColor: disabledTextColor,
        elevation: elevation,
        materialTapTargetSize:
            materialTapTargetSize ?? MaterialTapTargetSize.shrinkWrap,
        visualDensity: VisualDensity.comfortable,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(defaultCorner),
          side: buildBorderSide(context),
        ),
        onPressed: onPressed,
        padding: defaultPadding,
        child: buildChild(context, buildTextStyle(context)),
      );

  Widget buildOutlinedButton(BuildContext context) => OutlinedButton(
        style: buttonStyle ?? buildOutlinedButtonStyle(context),
        onPressed: onPressed,
        child: buildChild(context, buildTextStyleOnlined(context)),
      );

  Widget buildFlatButton(BuildContext context) => TextButton(
        style: buildFlatButtonStyle(context),
        onPressed: onPressed,
        child: buildChild(context, buildTextStyle(context)),
      );

  Widget buildChild(BuildContext context, TextStyle? textStyle) =>
      child ??
      Row(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if (icon != null) ...[icon!],
          SizedBox(width: defaultIconSpacing),
          Flexible(
            fit: FlexFit.loose,
            child: Align(
              alignment: alignment ?? Alignment.center,
              child: Text(
                text ?? '',
                textAlign: TextAlign.center,
                style: buildTextStyle(context),
              ),
            ),
          ),
        ],
      );

  ButtonStyle buildOutlinedButtonStyle(BuildContext context) => ButtonStyle(
        alignment: alignment,
        padding: MaterialStateProperty.all(defaultPadding),
        backgroundColor: MaterialStateProperty.all(fillColor),
        visualDensity: VisualDensity.comfortable,
        minimumSize: MaterialStateProperty.all(
          defaultButtonSize,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultCorner),
            side: buildBorderSide(context),
          ),
        ),
        side: MaterialStateProperty.all(buildBorderSide(context)),
        textStyle: MaterialStateProperty.all(buildTextStyleOnlined(context)),
      );

  ButtonStyle buildFlatButtonStyle(BuildContext context) => ButtonStyle(
        alignment: alignment,
        padding: MaterialStateProperty.all(defaultPadding),
        visualDensity: VisualDensity.comfortable,
        minimumSize: MaterialStateProperty.all(
          defaultButtonSize,
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(defaultCorner),
            side: buildBorderSide(context),
          ),
        ),
        backgroundColor:
            MaterialStateProperty.all(Theme.of(context).primaryColor),
        side: MaterialStateProperty.all(buildBorderSide(context)),
        textStyle: MaterialStateProperty.all(buildTextStyle(context)),
      );

  TextStyle? buildTextStyle(BuildContext context) =>
      textStyle ??
      const TextStyle(
        fontSize: 16,
        letterSpacing: 1.25,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      );

  TextStyle? buildTextStyleOnlined(BuildContext context) =>
      textStyle ??
      const TextStyle(
        fontSize: 16,
        letterSpacing: 1.25,
        fontWeight: FontWeight.w700,
        color: Colors.black,
      );

  Color buildTextColor() {
    if (onPressed != null) {
      switch (buttonType) {
        case ButtonType.outlined:
          return textColor ?? Colors.red;
        case ButtonType.flat:
          return textColor ?? Colors.blue;
        default:
          return textColor ?? Colors.green;
      }
    }
    return disabledTextColor ?? Colors.black;
  }

  BorderSide buildBorderSide(BuildContext context) =>
      buttonType == ButtonType.outlined
          ? BorderSide(
              width: borderSize ?? 1,
              color: defaultBorderColor(context),
            )
          : BorderSide.none;

  Size? get defaultButtonSize => Size(
        buttonSize == ButtonSize.fullWidth ? double.infinity : width ?? 0,
        height ?? 46,
      );

  double? get defaultWidth =>
      buttonSize == ButtonSize.fullWidth ? double.infinity : width;

  Color? get defaultDisabledColor => disabledColor ?? Colors.grey;
  Color? get defaultDisabledTextColor => disabledTextColor ?? Colors.blue;
  double get defaultCorner => corner ?? 8;
  double get defaultIconSpacing => icon != null ? iconSpacing ?? 4 : 0;
  Color defaultBorderColor(BuildContext context) => onPressed != null
      ? (borderColor ?? Theme.of(context).primaryColor)
      : Colors.grey;

  EdgeInsetsGeometry get defaultPadding =>
      padding ?? const EdgeInsets.symmetric(horizontal: 16, vertical: 12);
}
