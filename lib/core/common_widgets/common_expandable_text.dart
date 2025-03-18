import 'package:flutter/material.dart';

import '../styles/custom_colors.dart';

class CommonExpandableText extends StatefulWidget {

  const CommonExpandableText({
    super.key, 
    required this.text
  });

  final String text;

  @override
  State<CommonExpandableText> createState() => _CommonExpandableTextState();
}

class _CommonExpandableTextState extends State<CommonExpandableText> {

  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.text,
          maxLines: isExpanded ? 100 : 2,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            color: CustomColors.gray3,
            fontSize: 14.0,
            fontWeight: FontWeight.w400
          ),
        ),
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Text(
            isExpanded ? 'Show less' : 'Read more',
            style: const TextStyle(
              color: CustomColors.primaryColor,
              fontSize: 14.0,
              fontWeight: FontWeight.w600
            ),
          ),
        )
      ],
    );
  }
}