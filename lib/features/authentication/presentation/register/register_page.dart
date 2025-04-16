import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:taskly/core/extensions/context_ext.dart';
import 'package:taskly/core/extensions/double_ext.dart';
import '../../../../core/common_widgets/common_back_button.dart';
import '../../../../core/common_widgets/common_scaffold.dart';
import '../../../../core/router/app_routes.dart';
import '../../../../core/styles/dimension.dart';
import '_components/register_content.dart';
import '_components/register_footer.dart';
import '_components/register_header.dart';
import '../../../../core/common_widgets/common_select_media_bottom_sheet.dart';
import 'bloc/register_bloc.dart';

class RegisterPageWrapper extends StatelessWidget {

  const RegisterPageWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(),
      child: RegisterPage(),
    );
  }
}

class RegisterPage extends StatefulWidget {

  const RegisterPage({super.key});
  
  @override
  State<StatefulWidget> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _formKey = GlobalKey<FormState>();
  final _registerContentKey = GlobalKey<RegisterContentState>();
  final _registerHeaderKey = GlobalKey<RegisterHeaderState>();
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {

    return BlocListener<RegisterBloc, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccessState) {
          context.showAnimatedSuccessDialog(
            title: "Your account has been registered.",
            onButtonPressed: () => context.go(AppRoutes.dashboard)
          );
        } else if (state is RegisterFailureState) {
          context.showAnimatedErrorDialog(
            title: state.errorMessage,
            onButtonPressed: () => context.popSafely()
          );
        }
      },
      child: CommonScaffold(
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
                          key: _registerHeaderKey,
                          onTapCamera: () async {
                            await showModalBottomSheet(
                              context: context, 
                              backgroundColor: Colors.transparent,
                              barrierColor: Colors.black12,
                              builder: (ctx) {
                                return CommonSelectMediaBottomSheet(
                                onTapCamera: () {
                                  context.read<RegisterBloc>().add(OpenCameraEvent());
                                },
                                onTapGallery: () {
                                  context.read<RegisterBloc>().add(OpenGalleryEvent());
                                },
                                );
                              },
                            );
                          },
                        ),
                        Dimension.spacingExtraLarge.height(),
                        RegisterContent(
                          key: _registerContentKey,
                        ),
                        Dimension.spacingMedium.height(),
                        RegisterFooter(
                          onTapRegister: () {
                            if (_formKey.currentState?.validate() ?? false) {
      
                              if (_isChecked) {

                                context.read<RegisterBloc>().add(DoRegisterEvent(
                                  name: _registerContentKey.currentState?.name ?? "",
                                  email: _registerContentKey.currentState?.email ?? "",
                                  password: _registerContentKey.currentState?.password ?? "",
                                  imageFile: _registerHeaderKey.currentState?.filePath
                                ));
      
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
      )
    );
  }
}