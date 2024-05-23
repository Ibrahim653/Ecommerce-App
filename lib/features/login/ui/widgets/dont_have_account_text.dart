import 'package:flutter/material.dart';
import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'ليس لديك حساب ؟',
          style: Styles.font14GreyMedium.copyWith(
          ),
        ),
        GestureDetector(
          onTap: () {
            context.pushReplacementNamed(Routes.registerScreen);
          },
          child: Text(
            ' التسجيل',
            style: Styles.font18PinkBold.copyWith(
            ),
          ),
        ),
      ],
    );
  }
}
