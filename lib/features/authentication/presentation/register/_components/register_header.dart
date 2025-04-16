import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly/core/extensions/context_ext.dart';
import 'package:taskly/core/extensions/double_ext.dart';

import '../../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../../core/common_widgets/common_image.dart';
import '../../../../../core/styles/custom_colors.dart';
import '../../../../../core/styles/dimension.dart';
import '../bloc/register_bloc.dart';

class RegisterHeader extends StatefulWidget {

  const RegisterHeader({super.key, required this.onTapCamera});

  final VoidCallback onTapCamera;

  @override
  State<RegisterHeader> createState() => RegisterHeaderState();
}

class RegisterHeaderState extends State<RegisterHeader> with AutomaticKeepAliveClientMixin {

  File? _filePath;
  File? get filePath => _filePath;

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return BlocConsumer<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is OpeningMediaState) {
          context.popSafely();
        } else if (state is UploadImageSuccessState) {
          _filePath = File(state.imagePath);
        }
      },
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            Text(
              "Create Account",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),
            Dimension.spacingSmall.height(),
            Text(
              "Fill your information below",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: CustomColors.gray3
              ),
            ),
            Dimension.spacingExtraLarge.height(),
            CommonElevatedButton(
              onButtonPressed: (state is RegisterLoadingState) ? null : widget.onTapCamera,
              padding: EdgeInsets.zero,
              backgroundColor: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(80.0),
              custom: Stack(
                alignment: Alignment.bottomRight,
                clipBehavior: Clip.none,
                children: [
                  CommonImage(
                    _filePath?.path ?? "",
                    height: 100,
                    width:100,
                    radius: 80.0,
                    fit: BoxFit.cover,
                    backgroundColor: Colors.grey.shade200,
                    errorWidget: Icon(Icons.person, size: 50.0, color: Colors.grey.shade700),
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: CircleAvatar(
                      backgroundColor: (state is RegisterLoadingState) ? Colors.grey : CustomColors.primaryColor,
                      radius: 20.0,
                      child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  bool get wantKeepAlive => true;
}