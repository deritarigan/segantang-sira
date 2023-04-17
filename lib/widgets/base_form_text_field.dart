part of base_widgets;

class BaseFormTextField extends StatelessWidget {
  final String label;
  final String hint;
  final EdgeInsets? padding;
  final double space;
  final bool isEnable;
  final TextStyle? labelStyle;
  final bool isCurrency;
  final bool isShowButtonFinish;
  final Widget? suffix;
  final String? Function(String?)? validator;
  final TextInputType? inputType;
  final int? maxLength;
  final String? maskString;
  final TextEditingController? controller;
  final TextInputAction? textInputAction;
  final String? errorText;
  final Function(String)? onChangeText;
  final InputDecoration? decoration;

  const BaseFormTextField({
    Key? key,
    required this.label,
    this.hint = '',
    this.padding,
    this.space = 4,
    this.labelStyle,
    this.inputType,
    this.validator,
    this.onChangeText,
    this.suffix,
    this.isShowButtonFinish = true,
    this.maxLength,
    this.maskString,
    this.isCurrency = false,
    this.isEnable = true,
    this.textInputAction,
    this.errorText,
    this.controller,
    this.decoration,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (label.isNotEmpty)
            Text(
              label,
              style: labelStyle ?? Theme.of(context).textTheme.labelMedium,
            ),
          if (label.isNotEmpty)
            SizedBox(
              height: space,
            ),
          BaseTextField(
            isEnable: isEnable,
            controller: controller,
            validator: validator,
            suffix: suffix,
            isShowButtonFinish: isShowButtonFinish,
            maskString: maskString,
            maxLength: maxLength,
            isUseCurrency: isCurrency,
            textInputAction: textInputAction,
            inputType: inputType,
            hint: hint,
            errorText: errorText,
            decoration: decoration,
          ),
        ],
      ),
    );
  }
}
