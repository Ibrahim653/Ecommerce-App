import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class CustomTextFormField extends StatelessWidget {
  final String? title;
  final Icon? icon;
  final int? maxLength;
  final TextInputType? inputType;
  final Function(String?) validator;
  final Widget? suffexIcon;
  final ValueSetter? onSaved;
  final ValueSetter? onChanged;
  final bool? obsecureText;
  final bool enablePaste;
  final VoidCallback? onTap;
  final FocusNode? focusNode;
  final EdgeInsetsGeometry? contentPadding;
  final Color? backgroundColor;
  final TextEditingController? controller;
  const CustomTextFormField({
    super.key,
    @required this.title,
    this.icon,
    this.focusNode,
    this.inputType,
    this.suffexIcon,
    this.onSaved,
    required this.validator,
    this.onChanged,
    this.onTap,
    this.obsecureText,
    this.enablePaste = true,
    this.maxLength,
    this.contentPadding,
    this.backgroundColor,
    this.controller,
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      focusNode: focusNode,
      onTap: onTap,
      maxLines: maxLength ?? 1,
      enableInteractiveSelection: enablePaste,
      keyboardType: inputType,
      onChanged: onChanged,
      validator: (value) {
        return validator(value);
      },
      onSaved: onSaved,
      obscureText: obsecureText ?? false,
      style: Styles.font14DarkBlueMedium,
      decoration: InputDecoration(
          isDense: true,
          contentPadding: contentPadding ??
              EdgeInsets.symmetric(vertical: 18.w, horizontal: 20.h),
          filled: true,
          fillColor: backgroundColor ?? ColorsManager.moreLightGrey,
          suffixIcon: suffexIcon,
          hintText: title,
          hintStyle: Styles.font14LightGreyRegular,
          prefixIcon: icon,
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(16),
              borderSide: const BorderSide(
                color: Color(0xFFD6D6D6),
              )),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: Color(0xFFD6D6D6),
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: ColorsManager.mainBlue,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(
              color: ColorsManager.lighterGrey,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: const BorderSide(
              color: Colors.red,
              width: 1.3,
            ),
            borderRadius: BorderRadius.circular(16.0),
          )),
    );
  }
}
