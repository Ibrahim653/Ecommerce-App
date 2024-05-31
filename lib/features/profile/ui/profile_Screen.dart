import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/di/dependency_injection.dart';
import '../../../core/helpers/constants.dart';
import '../../../core/helpers/shared_prefs_helper.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../../../core/widgets/custom_app_bar.dart';
import '../../login/logic/cubit/login_cubit.dart';
import '../../login/logic/cubit/login_state.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String? userName = CacheHelper.getString(Constants.username);

    return Scaffold(
      appBar: const CustomAppBar(
        title: 'الحساب',
      ),
      body: BlocProvider(
        create: (context) => getIt<LoginCubit>(),
        child: BlocBuilder<LoginCubit, LoginState>(
          builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      CircleAvatar(
                        radius: 65.r,
                        backgroundColor: Colors.grey[300],
                        child: CircleAvatar(
                          radius: 60.r,
                          backgroundImage:
                              const AssetImage('assets/images/profile.jpg'),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                  Text(
                    'اسم المستخدم: $userName',
                    style: Styles.font16GreyMedium,
                  ),
                  const Spacer(
                    flex: 4,
                  ),
                  AppTextButton(
                    buttonText: 'تسجيل الخروج',
                    textStyle: Styles.font16WhiteBold,
                    onPressed: () {
                      LoginCubit.get(context).signout(context);
                    },
                  ),
                  const Spacer(
                    flex: 2,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
