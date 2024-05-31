import 'package:e_commerce_app/core/theming/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/styles.dart';
import '../../logic/cubit/login_cubit.dart';
import '../../logic/cubit/login_state.dart';

class TwoCheckBox extends StatelessWidget {
  const TwoCheckBox({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LoginCubit, LoginState>(
      builder: (BuildContext context, state) {
        return Row(
          children: [
            Checkbox(
              value: LoginCubit.get(context).autoLogin,
              onChanged: (value) => LoginCubit.get(context).autoLoginFun(),
              activeColor: MaterialStateColor.resolveWith((states) => ColorsManager.primaryCyan),
            ),
            Text(
              'دخول تلقائى للحساب',
              style: Styles.font14GreyMedium,
            ),
          ],
        );
      },
    );
  }
}
