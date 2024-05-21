import 'package:diyar_express/shared/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CustomInputWidget extends StatefulWidget {
  const CustomInputWidget({
    super.key,
    required this.hintText,
    this.controller,
    this.isPasswordField,
    this.validator,
    this.inputType,
    this.title,
    this.onTap,
    this.onChanged,
    this.filledColor = Colors.white,
    this.titleColor = AppColors.black1,
    this.maxLines = 1,
    this.leading,
    this.isReadOnly = false,
    this.trailing,
    this.inputFormatters,
  });

  final String hintText;
  final Widget? trailing;
  final TextEditingController? controller;
  final bool? isPasswordField;
  final String? title;
  final FormFieldValidator<String>? validator;
  final TextInputType? inputType;
  final VoidCallback? onTap;
  final void Function(String)? onChanged;
  final Color? filledColor;
  final Color? titleColor;
  final int? maxLines;
  final Widget? leading;
  final bool? isReadOnly;
  final List<TextInputFormatter>? inputFormatters;

  @override
  State<CustomInputWidget> createState() => _CustomInputWidgetState();
}

final phoneFormatter = MaskTextInputFormatter(
  mask: "+996 (###) ##-##-##",
  filter: {"#": RegExp(r'[0-9]')},
  type: MaskAutoCompletionType.lazy,
);

class _CustomInputWidgetState extends State<CustomInputWidget> {
  bool _obsecureText = true;
  bool isReadOnly = false;

  @override
  void initState() {
    super.initState();
    isReadOnly = widget.onTap == null ? widget.isReadOnly! : true;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.title != null)
          ListTile(
            dense: true,
            contentPadding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
            visualDensity: const VisualDensity(horizontal: 0, vertical: -4),
            title: Text(
              widget.title!,
              style: theme.textTheme.bodyMedium!.copyWith(
                color: widget.titleColor,
              ),
            ),
            trailing: widget.trailing,
          ),
        TextFormField(
          controller: widget.controller,
          keyboardType: widget.inputType,
          obscureText: widget.isPasswordField == true ? _obsecureText : false,
          cursorColor: AppColors.black1,
          onTap: widget.onTap,
          style: theme.textTheme.bodyMedium,
          readOnly: isReadOnly,
          validator: widget.validator,
          inputFormatters: widget.inputFormatters,
          onChanged: widget.onChanged,
          maxLines: widget.maxLines,
          decoration: InputDecoration(
            enabled: true,
            prefixIcon: widget.leading,
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(.3)),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(color: AppColors.primary),
              borderRadius: BorderRadius.circular(10),
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            focusedErrorBorder: const OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red, width: 1),
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            filled: true,
            fillColor: widget.filledColor,
            hintText: widget.hintText,
            hintStyle: const TextStyle(
              fontWeight: FontWeight.w400,
              fontSize: 16,
            ),
            contentPadding: const EdgeInsets.fromLTRB(16, 14, 16, 14),
            suffixIcon: widget.onTap == null
                ? widget.isPasswordField == true
                    ? GestureDetector(
                        onTap: () {
                          _obsecureText = !_obsecureText;
                          setState(() {});
                        },
                        child: Icon(
                          _obsecureText ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                          color: AppColors.black1.withOpacity(.6),
                        ),
                      )
                    : null
                : const Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.black1,
                  ),
          ),
        ),
      ],
    );
  }
}
