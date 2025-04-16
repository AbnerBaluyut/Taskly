import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:taskly/core/extensions/context_ext.dart';

import '../../../../../../core/enums/status_enum.dart';
import '../../../../../../core/styles/custom_colors.dart';
import '../../../../../../core/styles/dimension.dart';

class StatusSection extends StatefulWidget {

  const StatusSection({super.key, this.onChanged});

  final void Function(StatusEnum)? onChanged;

  @override
  State<StatefulWidget> createState() => _StatusSectionState();
}

class _StatusSectionState extends State<StatusSection> {

  final List<StatusEnum> _statuses = [
    StatusEnum.todo,
    StatusEnum.inProgress,
    StatusEnum.completed,
  ];

  StatusEnum? _selectedStatus;

  bool _isDropdownOpen = false;

  @override
  Widget build(BuildContext context) {

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      spacing: Dimension.spacingSmall,
      children: [
        Text(
          "Status:",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: context.isDarkMode() ? Colors.white : CustomColors.gray2
          ),
        ),
        DropdownButtonHideUnderline(
          child: DropdownButton2<StatusEnum>(
            hint: Text(
              "Select",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
                color: CustomColors.gray3
              ),
            ),
            buttonStyleData: ButtonStyleData(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                border: Border.all(
                  color: CustomColors.gray4
                ),
                color: Colors.white
              )
            ),
            value: _selectedStatus,
            isExpanded: true,
            iconStyleData: IconStyleData(
              icon: Padding(
                padding: const EdgeInsets.only(
                  right: Dimension.paddingMedium
                ),
                child: Icon(
                  _isDropdownOpen ? FontAwesomeIcons.angleUp : FontAwesomeIcons.angleDown, 
                  size: 14.0,
                  color: _isDropdownOpen ? CustomColors.primaryColor : CustomColors.gray2,
                ),
              ),
            ),
            items: _statuses.map<DropdownMenuItem<StatusEnum>>((item) {
              return DropdownMenuItem(
                value: item,
                child: Text(
                  item.getTitle(),
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: CustomColors.gray2
                  ),
                ),
              );
            }).toList(),
            onChanged: (value) {
              setState(() {
                _selectedStatus = value ?? StatusEnum.todo;
              });
              widget.onChanged?.call(_selectedStatus ?? StatusEnum.todo);
            },
            dropdownStyleData: DropdownStyleData(
              maxHeight: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.0),
                color: Colors.white,
                border: Border.all(
                  color: CustomColors.gray4
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 4),
                    color: CustomColors.primaryColor,
                  )
                ]
              ),
              elevation: 0,
              offset: Offset(0, -10)
            ),
            onMenuStateChange: (value) {
              setState(() {
                _isDropdownOpen = value;
              });
            },
          ),
        ),
      ],
    );
  }
}