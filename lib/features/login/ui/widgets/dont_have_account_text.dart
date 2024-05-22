import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../core/helpers/extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/styles.dart';

class DontHaveAccountText extends StatelessWidget {
  const DontHaveAccountText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
        children: [
          TextSpan(
            text: 'ليس لديك حساب ؟',
            style: Styles.font13DarkBlueRegular,
          ),
          TextSpan(
            text: ' التسجيل',
            style: Styles.font13BlueSemiBold,
              recognizer: TapGestureRecognizer()
              ..onTap = () {
                context.pushReplacementNamed(Routes.registerScreen);
              },
          ),
        ],
      ),
    );
  }
}
