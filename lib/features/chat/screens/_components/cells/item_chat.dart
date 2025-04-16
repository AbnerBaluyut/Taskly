import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_ext.dart';

import '../../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../../core/common_widgets/common_image.dart';
import '../../../../../core/styles/assets.dart';
import '../../../../../core/styles/dimension.dart';

class ItemChat extends StatelessWidget {
  const ItemChat({super.key});


  @override
  Widget build(BuildContext context) {
    
    return CommonElevatedButton(
      onButtonPressed: () {},
      padding: EdgeInsets.all(Dimension.paddingSmall),
      backgroundColor: Colors.transparent,
      custom: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: Dimension.spacingMedium,
        children: [
          CommonImage(
            Assets.face,
            height: 50.0,
            width: 50.0,
            fit: BoxFit.contain,
            backgroundColor: Colors.grey.shade200,
            radius: 50.0
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: Dimension.spacingSmall,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: Dimension.spacingSmall,
                  children: [
                    Expanded(
                      child: Text(
                        'John Doe',
                        style: TextStyle(
                          fontSize: 16, 
                          fontWeight: FontWeight.w400,
                          color: context.isDarkMode() ? Colors.white : Colors.black
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Text(
                      '11:00 AM',
                      style: TextStyle(
                        fontSize: 14, 
                        fontWeight: FontWeight.w400,
                        color: context.isDarkMode() ? Colors.white60 : Colors.black54
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'You: How are you? What are you doing here in the world and what are you doing in the world and what are you doing in the world and what are you doing in the world and what are you doing in the world and what are you doing in the world and what are you doing in the world and what are you doing in the world and what are you doing in the world and what are you doing in the world and',
                        style: TextStyle(
                          fontSize: 15, 
                          fontWeight: FontWeight.w400,
                          color: context.isDarkMode() ? Colors.white60 : Colors.black54
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    Badge(
                      smallSize: 6.0,
                      backgroundColor: Colors.red,
                      label: Text(
                        '5',
                        style: TextStyle(
                          fontSize: 13, 
                          fontWeight: FontWeight.w500,
                          color: Colors.white,
                        ),
                      ),
                      isLabelVisible: true,
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}