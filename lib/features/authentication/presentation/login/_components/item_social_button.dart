import 'package:flutter/material.dart';

import '../../../data/models/social_model.dart';

class ItemSocialButton extends StatelessWidget {

  const ItemSocialButton({
    super.key,
    required this.item,
    required this.onTapSocial,
  });

  final SocialModel item;
  final VoidCallback onTapSocial;

  @override
  Widget build(BuildContext context) {
    
    return IconButton(
      style: IconButton.styleFrom(
        backgroundColor: item.backgroundColor,
        overlayColor: Colors.black54
      ),
      icon: SizedBox(
        height: 40,
        width: 40,
        child: Icon(
          item.icon,
          size: 30,
          color: item.iconColor,
        ),
      ),
      onPressed: onTapSocial,
    );
  }
}