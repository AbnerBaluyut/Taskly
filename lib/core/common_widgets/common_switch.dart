import 'package:flutter/material.dart';

import '../styles/custom_colors.dart';

class CommonSwitch extends StatefulWidget {

  const CommonSwitch({
    super.key,
    required this.value,
    this.size = 50,
    this.onChanged
  });

  final bool value;
  final double size;
  final void Function(bool)? onChanged;

  @override
  State<StatefulWidget> createState() => _CommonSwitchState();
}

class _CommonSwitchState extends State<CommonSwitch> {

  bool _isEnabled = false;

  @override
  void initState() {
    _setIsEnabled(widget.value);
    super.initState();
  }

  @override
  void didUpdateWidget(covariant CommonSwitch oldWidget) {
    _setIsEnabled(widget.value);
    super.didUpdateWidget(oldWidget);
  }

  void _setIsEnabled(bool value) {
    setState(() {
       _isEnabled = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return SizedBox(
      width: widget.size,
      child: FittedBox(
        fit: BoxFit.fitWidth,
        child: Switch(
          value: _isEnabled,
          activeColor: Colors.white,
          activeTrackColor: CustomColors.primaryColor,
          inactiveTrackColor: Colors.grey.shade300,
          inactiveThumbColor: Colors.grey,
          trackOutlineColor: WidgetStatePropertyAll(Colors.transparent),
          trackOutlineWidth: WidgetStatePropertyAll(-1.0),
          onChanged: widget.onChanged != null ? (value) {
            setState(() {
              _isEnabled = value;
            });
            widget.onChanged?.call(value);
          } : null
        ),
      ),
    );
  }
}