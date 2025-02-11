import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/double_extension.dart';
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

  @override
  Widget build(BuildContext context) {

    return CommonScaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => context.pop(false),
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
                              context.pop();
                            },
                            onTapGallery: () {
                              context.pop();
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
                        log("Proceed to Home after successful registration");
                      }, 
                      onTapCheckBox: (isChecked) {
                        log("Checkbox is checked: $isChecked");
                      },
                    ),
                     Dimension.spacingLarge.height()
                  ],
                ),
              ),
            ),
          );
        }
      ),
    );
  }
}