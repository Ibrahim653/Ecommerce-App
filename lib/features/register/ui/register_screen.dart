import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../logic/cubit/register_cubit.dart';
import 'widgets/already_have_account_text.dart';
import 'widgets/register_bloc_listner.dart';
import 'widgets/register_form.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: Styles.font24BlueBold,
                ),
                verticalSpace(8),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: Styles.font14GreyRegular,
                ),
                verticalSpace(36),
                Column(
                  children: [
                    const RegisterForm(),
                    verticalSpace(40),
                    AppTextButton(
                      buttonText: "Create Account",
                      textStyle: Styles.font16WhiteSemiBold,
                      onPressed: () {
                        validateThenDoSignup(context);
                      },
                    ),
                    verticalSpace(16),
              
                    verticalSpace(30),
                    const AlreadyHaveAccountText(),
                    const RegisterBlocListner(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoSignup(BuildContext context) {
    if (context.read<RegisterCubit>().formKey.currentState!.validate()) {
      context.read<RegisterCubit>().emitRegisterSatate();
    }
  }
}
