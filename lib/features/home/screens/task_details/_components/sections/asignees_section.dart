import 'package:assorted_layout_widgets/assorted_layout_widgets.dart';
import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_ext.dart';
import '../../../../../../core/styles/custom_colors.dart';

class AsigneesSection extends StatefulWidget {

  const AsigneesSection({super.key});

  @override
  State<StatefulWidget> createState() => _AsigneesSectionState();
}

class _AsigneesSectionState extends State<AsigneesSection> {

  @override
  Widget build(BuildContext context) {

    int memberItemsLength = 5;
    int itemSize = 30; 
    int minimumMembers = (context.screenWidth() / itemSize).floor();
    int membersLeft = (memberItemsLength - minimumMembers);
    
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "Asignees: ",
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 16,
            color: context.isDarkMode() ? Colors.white : CustomColors.gray2
          ),
        ),
        RowSuper(
          innerDistance: -14,
          children: [
            ...List.generate((memberItemsLength > minimumMembers) ? (minimumMembers + 1) : memberItemsLength, (index) {
              if (index >= minimumMembers) {
                return CircleAvatar(
                backgroundColor: Colors.grey.shade400,
                radius: 15,
                child: CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 14,
                  child: Text(
                    (membersLeft > 100) ? "+99" : "+$membersLeft",
                    style: TextStyle(
                      fontSize: 13.0,
                      color: CustomColors.primaryColor,
                      fontWeight: FontWeight.w600
                    ),
                  ),
                ),
              );
              } else {
                return CircleAvatar(
                  backgroundColor: Colors.grey.shade400,
                  radius: 15,
                  child: CircleAvatar(
                    backgroundColor: CustomColors.primaryColor,
                    radius: 14,
                    child: Icon(Icons.person, color: Colors.white, size: 20.0)
                  ),
                );
              }
            }),
          ],
        ),
      ],
    );
  }
}