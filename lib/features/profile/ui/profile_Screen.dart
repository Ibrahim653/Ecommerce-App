import 'package:e_commerce_app/core/di/dependency_injection.dart';
import 'package:e_commerce_app/core/theming/styles.dart';
import 'package:e_commerce_app/core/widgets/app_text_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/widgets/custom_app_bar.dart';
import '../../login/logic/cubit/login_cubit.dart';
import '../../login/logic/cubit/login_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'الحساب',
      ),
      body: BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Column(
              children: [
                AppTextButton(
                    buttonText: 'Log Out',
                    textStyle: Styles.font16WhiteBold,
                    onPressed: () {
                      LoginCubit.get(context).signout(context);
                    })
              ],
            );
          },
        ),
      ),
    );
  }
}
