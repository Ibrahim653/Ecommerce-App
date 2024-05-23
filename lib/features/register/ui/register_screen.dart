import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/helpers/constants.dart';
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 26.w, vertical: 54.h),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  Constants.registerLogo,
                  width: 130.w,
                  height: 96.h,
                ),
                verticalSpace(32),
                Text(
                  'حساب جديد',
                  style: Styles.font19PinkBold,
                ),
                verticalSpace(13),
                Text(
                  'مرحبا بك ، قم بملأ البيانات للتسجيل',
                  style: Styles.font14GreyMedium,
                ),
                verticalSpace(44),
                const RegisterForm(),
                verticalSpace(33),
                AppTextButton(
                  buttonText: "التسجيل",
                  textStyle: Styles.font16WhiteBold,
                  onPressed: () {
                    validateThenDoSignup(context);
                  },
                ),
                verticalSpace(32),
                const AlreadyHaveAccountText(),
                const RegisterBlocListner(),
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
