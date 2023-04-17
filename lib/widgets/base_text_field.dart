part of base_widgets;

class BaseTextField extends StatefulWidget {
  final TextInputType? inputType;
  final String hint;
  final String? Function(String?)? validator;
  final bool isEnable;
  final TextInputAction? textInputAction;
  final Widget? suffix;
  final Widget? prefix;
  final String? currencySymbol;
  final InputDecoration? decoration;
  final bool isUseCurrency;
  final int? maxLength;
  final String? maskString;
  final bool autofocus;
  final int maxLines;
  final Color? fillColor;
  final Function()? onKeyboardDismissed;
  final Function()? onHasFocus;
  final String? errorText;
  final TextStyle? style;
  final FocusNode? focusNode;
  final bool readOnly;
  final bool isShowButtonFinish;
  final bool autoFocus;
  final TextEditingController? controller;

  const BaseTextField({
    Key? key,
    required this.inputType,
    required this.hint,
    this.controller,
    this.suffix,
    this.prefix,
    this.textInputAction,
    this.maxLength,
    this.decoration,
    this.focusNode,
    this.isUseCurrency = false,
    this.maskString,
    this.onKeyboardDismissed,
    this.onHasFocus,
    this.isEnable = true,
    this.validator,
    this.fillColor,
    this.maxLines = 1,
    this.autofocus = false,
    this.isShowButtonFinish = true,
    this.errorText,
    this.style,
    this.currencySymbol,
    this.readOnly = false,
    this.autoFocus = false,
  }) : super(key: key);

  @override
  _BaseTextFieldState createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  bool _isVisible = false;
  late FocusNode _focusNode;

  @override
  void initState() {
    _focusNode = widget.focusNode ?? FocusNode();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autofocus: widget.autofocus,
      enabled: widget.isEnable,
      focusNode: _focusNode,
      keyboardType: widget.inputType ?? TextInputType.name,
      controller: widget.controller,
      style: widget.style,
      readOnly: widget.readOnly,
      inputFormatters: widget.maxLength != null ||
              widget.maskString != null ||
              widget.isUseCurrency
          ? createListFormatter()
          : createDefaultListFormatter(),
      obscureText:
          (widget.inputType == TextInputType.visiblePassword && !_isVisible),
      textInputAction: widget.textInputAction,
      decoration: widget.decoration ??
          InputDecoration(
            hintText: widget.hint,
            fillColor: widget.fillColor ?? Colors.white,
            filled: true,
            errorMaxLines: 2,
            prefix: widget.prefix,
            suffixIcon: Padding(
              padding: const EdgeInsets.all(10.0),
              child: widget.suffix ??
                  (widget.inputType == TextInputType.visiblePassword
                      ? Material(
                          shape: const CircleBorder(),
                          color: Colors.transparent,
                          clipBehavior: Clip.hardEdge,
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _isVisible = !_isVisible;
                              });
                            },
                            child: Icon(
                              _isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                              size: 16,
                            ),
                          ),
                        )
                      : null),
            ),
            contentPadding:
                const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                  style: BorderStyle.solid,
                  color: Color.fromRGBO(208, 213, 221, 1)),
            ),
            disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                  style: BorderStyle.solid,
                  color: Color.fromRGBO(208, 213, 221, 1)),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.0),
              borderSide: const BorderSide(
                  style: BorderStyle.solid,
                  color: Color.fromRGBO(208, 213, 221, 1)),
            ),
            errorText: widget.errorText,
          ),
      validator: widget.validator,
      maxLines: widget.maxLines,
    );
  }

  List<TextInputFormatter> createListFormatter() {
    List<TextInputFormatter> listFormat = List.empty(growable: true);
    if (widget.maxLength != null) {
      listFormat.add(LengthLimitingTextInputFormatter(widget.maxLength!));
    }
    if (widget.maskString != null) {
      listFormat.add(MaskTextInputFormatter(mask: widget.maskString!));
    }
    if (widget.inputType == TextInputType.number) {
      listFormat.add(FilteringTextInputFormatter.digitsOnly);
    }
    if (widget.isUseCurrency) {
      listFormat.add(CurrencyRupiahInputFormatter(
          prefix: widget.currencySymbol, maxDigits: 12));
    }

    return listFormat;
  }

  List<TextInputFormatter>? createDefaultListFormatter() {
    if (widget.inputType == TextInputType.number) {
      return [FilteringTextInputFormatter.digitsOnly];
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _focusNode.dispose();
    widget.controller?.dispose();
  }
}
