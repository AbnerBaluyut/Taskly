import 'package:flutter/material.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../../core/styles/dimension.dart';

class RegisterFooter extends StatefulWidget {

  const RegisterFooter({super.key, required this.onTapRegister, required this.onTapCheckBox});

  final VoidCallback onTapRegister;
  final Function(bool isChecked) onTapCheckBox;

  @override
  State<StatefulWidget> createState() => _RegisterFooterState();
}

class _RegisterFooterState extends State<RegisterFooter> {

  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: Dimension.spacingLarge
      ),
      child: Column(
        spacing: 20.0,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                _isChecked = !_isChecked;
              });
              widget.onTapCheckBox(_isChecked);
            },
            child: ListTile(
              titleAlignment: ListTileTitleAlignment.center,
              leading: AnimatedSwitcher(
                duration: 300.milliseconds(),
                child: Container(
                  key: UniqueKey(),
                  child: _isChecked ? Icon(Icons.check_box, color: Colors.blue) : Icon(Icons.check_box_outline_blank, color: Colors.grey),
                ),
              ),
              dense: true,
              contentPadding: EdgeInsets.zero,
              title: Text(
                "I agree to the Terms & Conditions",
                style: TextStyle(
                  fontSize: 14,
                ),
              ),
              minLeadingWidth: 0.0,
            ),
          ),
          SizedBox(
            width: context.screenWidth(),
            child: CommonElevatedButton(
              onButtonPressed: widget.onTapRegister,
              text: "Register",
              fontSize: 16.0,
              fontWeight: FontWeight.w600,
              fontColor: Colors.white,
              padding: EdgeInsets.symmetric(
                horizontal: Dimension.spacingLarge,
                vertical: Dimension.spacingMedium
              ),
            ),
          )
        ],
      ),
    );
  }
}