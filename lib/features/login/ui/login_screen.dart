import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/constants.dart';
import '../../../core/helpers/spacing.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../logic/cubit/login_cubit.dart';
import 'widgets/dont_have_account_text.dart';
import 'widgets/email_and_password.dart';
import 'widgets/login_bloc_listner.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  void validateThenDoLogin(BuildContext context) {
    if (context.read<LoginCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubit>().emitLoginStates();
    }
  }

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
          Center(
            child: Image.asset(Constants.loginLogo,
                   width: 128.w,
                   height: 95.h,
            ),
          ),
              verticalSpace(36),
              Column(
                children: [
                  const EmailAndPassword(),
                  verticalSpace(24),
                  Align(
                    alignment: AlignmentDirectional.centerEnd,
                    child: Text(
                      'Forget Password',
                      style: Styles.font13BlueRegular,
                    ),
                  ),
                  verticalSpace(40),
                  AppTextButton(
                    buttonText: 'Login',
                    textStyle: Styles.font16WhiteMedium,
                    onPressed: () {
                      validateThenDoLogin(context);
                    },
                  ),
        
                  verticalSpace(55),
                  const DontHaveAccountText(),
                  const LoginBlocListener(),
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
