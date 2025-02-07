import 'package:flutter/material.dart';

import '../../../core/styles/assets.dart';

class Logo extends StatelessWidget {

  const Logo({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Image.asset(
        Assets.logo1, 
        height: 140, 
        width: 140
      ),
    );
  }
}