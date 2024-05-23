import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/helpers/app_regex.dart';
import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/styles.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/cubit/register_cubit.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({super.key});

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  bool isPasswordObscureText = true;
  bool isPasswordConfirmationObscureText = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<RegisterCubit>().formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'اسم المستخدم',
              style: Styles.font14GreyMedium,
            ),
          ),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              }
            },
            controller: context.read<RegisterCubit>().usernameController,
          ),
          verticalSpace(12),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'البريد الالكتروني',
              style: Styles.font14GreyMedium,
            ),
          ),
          CustomTextFormField(
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  !AppRegex.isEmailValid(value)) {
                return 'هذا الحقل مطلوب';
              }
            },
            controller: context.read<RegisterCubit>().emailController,
          ),
          verticalSpace(12),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'الاسم الأول',
              style: Styles.font14GreyMedium,
            ),
          ),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              }
            },
            controller: context.read<RegisterCubit>().firstNameController,
          ),
          verticalSpace(12),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'الاسم الأخير',
              style: Styles.font14GreyMedium,
            ),
          ),
          CustomTextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              }
            },
            controller: context.read<RegisterCubit>().lastNameController,
          ),
          verticalSpace(18),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'كلمة السر',
              style: Styles.font14GreyMedium,
            ),
          ),
          CustomTextFormField(
            controller: context.read<RegisterCubit>().passwordController,
            obsecureText: isPasswordObscureText,
            suffexIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordObscureText = !isPasswordObscureText;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  isPasswordObscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.black54,
                  size: 23.sp,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              }
            },
          ),
          verticalSpace(18),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'تأكيد كلمة السر',
              style: Styles.font14GreyMedium,
            ),
          ),
          CustomTextFormField(
            obsecureText: isPasswordConfirmationObscureText,
            suffexIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isPasswordConfirmationObscureText =
                      !isPasswordConfirmationObscureText;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  isPasswordObscureText
                      ? Icons.visibility_off
                      : Icons.visibility,
                  color: Colors.black54,
                  size: 23.sp,
                ),
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'هذا الحقل مطلوب';
              } else if (value != context.read<RegisterCubit>().passwordController.text) {
                return 'كلمة السر غير متطابقة';
              }
              return null; 
            },
          ),
        ],
      ),
    );
  }
}
