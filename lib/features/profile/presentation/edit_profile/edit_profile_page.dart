import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';

import '../../../../core/common_widgets/common_back_button.dart';
import '../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/common_widgets/common_text_field.dart';
import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';
import '../../../authentication/presentation/register/_components/select_media_bottom_sheet.dart';
import 'bloc/edit_profile_bloc.dart';
import 'bloc/edit_profile_event.dart';
import 'bloc/edit_profile_state.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<CommonTextFieldState> _nameFieldKey = GlobalKey<CommonTextFieldState>();

  final TextEditingController _nameController = TextEditingController();

  void _onTapCamera(BuildContext context) async {
    await showModalBottomSheet(
      context: context, 
      backgroundColor: Colors.transparent,
      barrierColor: Colors.transparent,
      builder: (ctx) {
        return SelectMediaBottomSheet(
          onTapCamera: () {
            context.read<EditProfileBloc>().add(OpenCameraEvent());
          },
          onTapGallery: () {
            context.read<EditProfileBloc>().add(OpenGalleryEvent());
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => EditProfileBloc()..add(LoadUserDataEvent()),
      child: BlocConsumer<EditProfileBloc, EditProfileState>(
        listener: (context, state) {
          if (state is ErrorState) {
            context.showAnimatedErrorDialog(
              title: state.errorMessage
            );
          } else if (state is SuccessState) {
            context.showAnimatedSuccessDialog(
              title: "Profile Updated successfully.",
              onButtonPressed: () => context.pop()
            );
          } else if (state is OpenGalleryState) {
            context.pop();
            context.showAnimatedAlertDialog(
              title: "Open Gallery",
              onButtonPressed: () => context.pop()
            );
          } else if (state is OpenCameraState) {
            context.pop();
            context.showAnimatedAlertDialog(
              title: "Open Camera",
              onButtonPressed: () => context.pop()
            );
          }
        },
        builder: (context, state) {
      
          if (state is UserDataState) {
            _nameController.text = state.user.name;
          }
          
          return CommonScaffold(
            appBar: AppBar(
              leading: CommonBackButton(
                onBackPressed: () => context.pop(false),
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
            body: LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: constraints.maxHeight
                      ),
                      child: IntrinsicHeight(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Dimension.spacingExtraLarge.height(),
                            Column(
                              children: [
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
                                        onPressed: (state is LoadingState) ? null : () => _onTapCamera(context),
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
                                    enabled: (state is! LoadingState),
                                    controller: _nameController,
                                    helperText: "Name",
                                    hintText: "Ex. Juan Dela Cruz",
                                    keyboardType: TextInputType.text,
                                    textInputAction: TextInputAction.done,
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
                              ],
                            ),
                            Spacer(),
                            Container(
                              padding: EdgeInsets.only(
                                left: Dimension.paddingMedium,
                                right: Dimension.paddingMedium,
                                bottom: Dimension.paddingMedium
                              ),
                              width: context.screenWidth(),
                              child: CommonElevatedButton(
                                isLoading: (state is LoadingState),
                                onButtonPressed: () {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    context.read<EditProfileBloc>().add(UpdateProfileEvent());
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
                    )
                  ),
                );
              }
            ),
          );
        },
      ),
    );
  }
}