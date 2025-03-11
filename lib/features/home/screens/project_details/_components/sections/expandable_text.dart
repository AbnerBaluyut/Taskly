import 'package:flutter/material.dart';

import '../../../../../../core/styles/custom_colors.dart';

class ExpandableText extends StatefulWidget {

  const ExpandableText({
    super.key, 
    required this.text
  });

  final String text;

  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {

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