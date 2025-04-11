import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/context_extension.dart';
import 'package:taskly/core/extensions/double_extension.dart';
import '../../../../core/common_widgets/common_back_button.dart';
import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/styles/dimension.dart';
import '_components/register_content.dart';
import '_components/register_footer.dart';
import '_components/register_header.dart';
import '_components/select_media_bottom_sheet.dart';

class RegisterPage extends StatefulWidget {

  const RegisterPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {

    return CommonScaffold(
      appBar: AppBar(
        leading: CommonBackButton(
          onBackPressed: () => context.pop(false),
        ),
        surfaceTintColor: Colors.transparent,
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: constraints.maxHeight,
                minWidth: constraints.maxWidth
              ),
              child: IntrinsicHeight(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      RegisterHeader(
                        onTapCamera: () async {
                          await showModalBottomSheet(
                            context: context, 
                            backgroundColor: Colors.transparent,
                            barrierColor: Colors.transparent,
                            builder: (ctx) {
                             return SelectMediaBottomSheet(
                              onTapCamera: () {
                                context.popSafely();
                              },
                              onTapGallery: () {
                                context.popSafely();
                              },
                             );
                            },
                          );
                        },
                      ),
                      Dimension.spacingExtraLarge.height(),
                      RegisterContent(),
                      Dimension.spacingMedium.height(),
                      RegisterFooter(
                        onTapRegister: () {
                          if (_formKey.currentState?.validate() ?? false) {

                            if (_isChecked) {
                              log("Proceed to Home after successful registration");
                            } else {
                              context.showAnimatedAlertDialog(
                                title: "Please agree to the terms and conditions",
                                onButtonPressed: () => context.popSafely()
                              );
                            }
                          }
                        }, 
                        onTapCheckBox: (isChecked) {
                          _isChecked = isChecked;
                        },
                      ),
                       Dimension.spacingLarge.height()
                    ],
                  ),
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}