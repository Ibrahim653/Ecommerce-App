import 'package:e_commerce_app/core/theming/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/app_text_form_field.dart';
import '../../logic/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isObsecure = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
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
                return 'برجاء إدخال اسم مستخدم صحيح';
              }
            },
            controller: context.read<LoginCubit>().userNameController,
          ),
          verticalSpace(16.h),
          Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Text(
              'كلمة السر',
              style: Styles.font14GreyMedium,
            ),
          ),
          CustomTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            obsecureText: isObsecure,
            suffexIcon: GestureDetector(
              onTap: () {
                setState(() {
                  isObsecure = !isObsecure;
                });
              },
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Icon(
                  isObsecure ? Icons.visibility_off : Icons.visibility,
                  color: Colors.black54,
                  size: 23.sp,
                ),
              ),
            ),
            title: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'كلمة السر غير صحيحة';
              }
            },
          ),
        ],
      ),
    );
  }
}
