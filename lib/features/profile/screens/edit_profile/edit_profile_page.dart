import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import 'package:taskly/core/extensions/int_extension.dart';

import '../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/common_widgets/common_text_field.dart';
import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';
import '../../../authentication/screens/register/_components/select_media_bottom_sheet.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<CommonTextFieldState> _nameFieldKey = GlobalKey<CommonTextFieldState>();

  final TextEditingController _nameController = TextEditingController();

  void _onTapCamera() async {
    await showModalBottomSheet(
      context: context, 
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (ctx) {
        return SelectMediaBottomSheet(
        onTapCamera: () {
          context.pop();
        },
        onTapGallery: () {
          context.pop();
        },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.pop(false),
        ),
        title: Text(
          "Edit Profile",
          style: TextStyle(
            color: context.isDarkMode() ? Colors.white : CustomColors.gray2,
            fontSize: 16.0,
            fontWeight: FontWeight.w500
          ),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Dimension.spacingExtraLarge.height(),
              Stack(
                alignment: Alignment.bottomRight,
                clipBehavior: Clip.none,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(80)
                    ),
                    child: Icon(Icons.person, size: 50.0, color: Colors.grey.shade700)
                  ),
                  SizedBox(
                    height: 30,
                    width: 30,
                    child: CommonElevatedButton.circleIcon(
                      onPressed: _onTapCamera,
                      padding: EdgeInsets.zero,
                      icon: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: Dimension.paddingMedium,
                  vertical: Dimension.paddingLarge
                ),
                child: CommonTextField (
                  key: _nameFieldKey,
                  controller: _nameController,
                  helperText: "Name",
                  hintText: "Ex. Juan Dela Cruz",
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  validator: (value) {
                    var getValue = (value ?? "").trim();
                    if (getValue.isEmpty) {
                      _nameFieldKey.currentState?.shake();
                      return "Name is required.";
                    }
                    return null;
                  },
                ),
              ),
              70.height(),
              Container(
                padding: EdgeInsets.symmetric(horizontal: Dimension.paddingMedium),
                width: context.screenWidth(),
                child: CommonElevatedButton(
                  onButtonPressed: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      context.pop();
                    }
                  },
                  text: "Update",
                  fontColor: Colors.white,
                  fontSize: 16.0,
                  fontWeight: FontWeight.w600,
                  padding: EdgeInsets.symmetric(
                    horizontal: Dimension.spacingLarge,
                    vertical: Dimension.spacingMedium
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}