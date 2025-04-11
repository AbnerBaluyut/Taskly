import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import 'package:taskly/core/extensions/string_extension.dart';

import '../../../../core/common_widgets/common_elevated_button.dart';
import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/common_widgets/common_text_field.dart';
import '../../../../core/styles/dimension.dart';
import '../bloc/profile_bloc.dart';
import '../bloc/profile_event.dart';
import '../bloc/profile_state.dart';
import '_components/change_password_appbar.dart';

class ChangePasswordPage extends StatefulWidget {

  const ChangePasswordPage({super.key});

  @override
  State<StatefulWidget> createState() => _ChangePasswordPageState();
}

class _ChangePasswordPageState extends State<ChangePasswordPage> {

  final _formKey = GlobalKey<FormState>();

  
  final _currentPasswordKey = GlobalKey<CommonTextFieldState>();
  final _newPasswordKey = GlobalKey<CommonTextFieldState>();
  final _confirmPasswordKey = GlobalKey<CommonTextFieldState>();
  
  final _currentPasswordField = TextEditingController();
  final _newPasswordField = TextEditingController();
  final _confirmPasswordField = TextEditingController();

  final _focusNode = FocusNode();
  final _focusNode2 = FocusNode();
  final _focusNode3 = FocusNode();

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<ProfileBloc, ProfileState>(
      listener: (context, state) {
        if (state is UpdatePasswordSuccessState) {
          context.showAnimatedSuccessDialog(
            title: "Your password has been updated",
          );
        } else if (state is UpdatePasswordErrorState) {
          context.showAnimatedErrorDialog(
            title: state.errorMessage,
            onButtonPressed: () => context.popSafely()
          );
        }
      },
      builder: (context, state) {
        return CommonScaffold(
          appBar: ChangePasswordAppBar(
            onBackPressed: () => context.popSafely(),
          ),
          body: LayoutBuilder(
            builder: (context, constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: constraints.maxHeight
                  ),
                  child: IntrinsicHeight(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: Dimension.paddingMedium
                      ),
                      child: Form(
                        key: _formKey,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Dimension.spacingSmall.height(),
                            CommonTextField(
                              key: _currentPasswordKey,
                              enabled: (state is! UpdatePasswordLoadingState),
                              controller: _currentPasswordField,
                              focusNode: _focusNode,
                              helperText: "Current Password",
                              hintText: "**********",
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.next,
                              obscureText: true,
                              validator: (value) {
                                var getValue = (value ?? "").trim();
                                if (getValue.isEmpty) {
                                  _currentPasswordKey.currentState?.shake();
                                  return "Current Password is required.";
                                }
                                return null;
                              },
                              onFieldSubmitted: (_) {
                                _focusNode2.requestFocus();
                              }, 
                            ),
                            Dimension.spacingMedium.height(),
                            CommonTextField(
                              key: _newPasswordKey,
                              enabled: (state is! UpdatePasswordLoadingState),
                              controller: _newPasswordField,
                              focusNode: _focusNode2,
                              helperText: "New Password",
                              hintText: "**********",
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.next,
                              obscureText: true,
                              errorMaxLines: 5,
                              validator: (value) {
                                var getValue = (value ?? "").trim();
                                if (getValue.isEmpty) {
                                  _newPasswordKey.currentState?.shake();
                                  return "New Password is required.";
                                } else if (getValue.validatePassword != null) {
                                  _newPasswordKey.currentState?.shake();
                                  return getValue.validatePassword;
                                }
                                return null;
                              },
                              onFieldSubmitted: (_) {
                                _focusNode3.requestFocus();
                              }, 
                            ),
                            Dimension.spacingMedium.height(),
                            CommonTextField(
                              key: _confirmPasswordKey,
                              enabled: (state is! UpdatePasswordLoadingState),
                              controller: _confirmPasswordField,
                              focusNode: _focusNode3,
                              helperText: "Confirm Password",
                              hintText: "**********",
                              keyboardType: TextInputType.visiblePassword,
                              textInputAction: TextInputAction.done,
                              obscureText: true,
                              errorMaxLines: 5,
                              validator: (value) {
                                var getValue = (value ?? "").trim();
                                var newPasswordValue = _newPasswordField.text.trim();
                                if (getValue.isEmpty) {
                                  _confirmPasswordKey.currentState?.shake();
                                  return "Confirm Password is required.";
                                } else if (getValue != newPasswordValue) {
                                  _confirmPasswordKey.currentState?.shake();
                                  return "Passwords do not match";
                                }
                                return null;
                              },
                            ),
                            Spacer(),
                            Dimension.spacingMedium.height(),
                            SizedBox(
                              width: context.screenWidth(),
                              child: CommonElevatedButton(
                                isLoading: (state is UpdatePasswordLoadingState),
                                text: "Update",
                                fontSize: 16.0,
                                fontWeight: FontWeight.w500,
                                fontColor: Colors.white,
                                padding: EdgeInsets.symmetric(
                                  vertical: Dimension.paddingMedium
                                ),
                                onButtonPressed: () {
                                  if (_formKey.currentState?.validate() ?? false) {
                                    context.read<ProfileBloc>().add(
                                      UpdatePasswordEvent(
                                        currentPassword: _currentPasswordField.text, 
                                        newPassword: _newPasswordField.text
                                      )
                                    );
                                  }
                                },
                              ),
                            ),
                            Dimension.spacingMedium.height()
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }
          )
        );
      },
    );
  }
}