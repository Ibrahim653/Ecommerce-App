import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/theming/colors.dart';
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
        children: [
          CustomTextFormField(
            title: 'Email',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpace(18.h),
          CustomTextFormField(
            controller: context.read<LoginCubit>().passwordController,
            obsecureText: isObsecure,
            suffexIcon: IconButton(
              color: ColorsManager.mainBlue,
              onPressed: () {
                setState(() {
                  isObsecure = !isObsecure;
                });
              },
              icon: isObsecure
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
            title: 'Password',
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'please enter a valid password';
              }
            },
          ),
        ],
      ),
    );
  }
}
