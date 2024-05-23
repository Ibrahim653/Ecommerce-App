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
        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 54.h),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Constants.loginLogo,
                  width: 128.w,
                  height: 95.h,
                ),
                verticalSpace(39),
                Text(
                  'تسجيل الدخول',
                  style: Styles.font19PinkBold,
                ),
                verticalSpace(13),
                Text(
                  'من فضلك قم بالدخول لإتمام الشراء',
                  style: Styles.font14GreyMedium,
                ),
                verticalSpace(48),
                const EmailAndPassword(),
                verticalSpace(29),
                AppTextButton(
                  buttonText: 'الدخول',
                  textStyle: Styles.font16WhiteBold,
                  onPressed: () {
                    validateThenDoLogin(context);
                  },
                ),
                verticalSpace(32),
                const DontHaveAccountText(),
                const LoginBlocListener()
              ],
            ),
          ),
        ),
      ),
    ));
  }
}
