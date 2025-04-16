import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/context_ext.dart';
import 'package:taskly/core/extensions/double_ext.dart';

import '../../../../_di/injections.dart';
import '../../../../core/common_widgets/common_back_button.dart';
import '../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../core/common_widgets/common_image.dart';
import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/common_widgets/common_text_field.dart';
import '../../../../core/styles/custom_colors.dart';
import '../../../../core/styles/dimension.dart';
import '../../../../core/common_widgets/common_select_media_bottom_sheet.dart';
import 'bloc/edit_profile_bloc.dart';

class EditProfilePageWrapper extends StatelessWidget {
  const EditProfilePageWrapper({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => EditProfileBloc(getIt()),
      child: EditProfilePage(),
    );
  }
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final GlobalKey<CommonTextFieldState> _nameFieldKey = GlobalKey<CommonTextFieldState>();

  final TextEditingController _nameController = TextEditingController();

  String? _userImage;
  File? _filePath;

  @override
  void initState() {
    context.read<EditProfileBloc>().add(LoadDataEvent());
    super.initState();
  }

  void _onTapCamera() async {
    await showModalBottomSheet(
      context: context, 
      backgroundColor: Colors.transparent,
      barrierColor: Colors.black12,
      builder: (ctx) {
        return CommonSelectMediaBottomSheet(
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
    return BlocConsumer<EditProfileBloc, EditProfileState>(
      listener: (context, state) {
        if (state is SubmitProfileErrorState) {
          context.showAnimatedErrorDialog(
            title: state.errorMessage,
            onButtonPressed: () => context.popSafely()
          );
        } else if (state is SubmitProfileSuccessState) {
          context.showAnimatedSuccessDialog(
            title: "Profile Updated successfully.",
            onButtonPressed: () => context.popSafely<bool>(closeOverlay: true, result: true)
          );
        } else if (state is UpdateUserImageSuccessState) {
          _filePath = File(state.imagePath);
        } else if (state is UpdateUserImageErrorState) {
          context.showAnimatedErrorDialog(
            title: state.errorMessage,
            onButtonPressed: () => context.popSafely()
          );
        } else if (state is OpeningMediaState) {
          context.popSafely(); 
        }
      },
      builder: (context, state) {
    
        if (state is LoadDataState) {
          _nameController.text = state.user.name;
          _userImage = state.user.image;
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
                              CommonElevatedButton(
                                onButtonPressed: (state is SubmitProfileLoadingState) ? null : _onTapCamera,
                                padding: EdgeInsets.zero,
                                backgroundColor: Colors.grey.shade200,
                                borderRadius: BorderRadius.circular(80.0),
                                custom: Stack(
                                  alignment: Alignment.bottomRight,
                                  clipBehavior: Clip.none,
                                  children: [
                                    CommonImage(
                                      _filePath?.path ?? _userImage ?? "",
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
                                        backgroundColor: (state is SubmitProfileLoadingState) ? Colors.grey : CustomColors.primaryColor,
                                        radius: 20.0,
                                        child: Icon(Icons.camera_alt, color: Colors.white, size: 20),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: Dimension.paddingMedium,
                                  vertical: Dimension.paddingLarge
                                ),
                                child: CommonTextField (
                                  key: _nameFieldKey,
                                  enabled: (state is! SubmitProfileLoadingState),
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
                              isLoading: (state is SubmitProfileLoadingState),
                              onButtonPressed: () {
                                if (_formKey.currentState?.validate() ?? false) {
                                  context.read<EditProfileBloc>().add(UpdateProfileEvent(
                                    name: _nameController.text.trim(),
                                    file: _filePath
                                  ));
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
    );
  }
}