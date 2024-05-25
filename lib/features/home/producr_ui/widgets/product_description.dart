import 'package:flutter/material.dart';

import '../../../../core/theming/styles.dart';

class ProductDescription extends StatelessWidget {
  final String? description;

  const ProductDescription({required this.description, super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      description ?? 'description',
      textDirection: TextDirection.ltr,
      style: Styles.font16GreyMedium,
    );
  }
}
