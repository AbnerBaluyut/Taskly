import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskly/core/extensions/context_extension.dart';

class CommonScaffold extends StatelessWidget {

  const CommonScaffold({
    super.key, 
    required this.body,
    this.appBar,
    this.android,
    this.ios
  });

  final Widget body;
  final AppBar? appBar;
  final Brightness? android;
  final Brightness? ios;
  
  @override
  Widget build(BuildContext context) {
    if (appBar != null) {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          appBar: AppBar(
            key: appBar?.key,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: context.isDarkMode() ? Brightness.light : (android ?? Brightness.dark),
              statusBarBrightness: context.isDarkMode() ? Brightness.dark : (ios ?? Brightness.light),
            ),
            leading: appBar?.leading,
            automaticallyImplyLeading: appBar?.automaticallyImplyLeading ?? true,
            title: appBar?.title,
            actions: appBar?.actions,
            flexibleSpace: appBar?.flexibleSpace,
            bottom: appBar?.bottom,
            elevation: appBar?.elevation,
            scrolledUnderElevation: appBar?.scrolledUnderElevation,
            notificationPredicate: appBar?.notificationPredicate ?? defaultScrollNotificationPredicate,
            shadowColor: appBar?.shadowColor,
            surfaceTintColor: appBar?.surfaceTintColor,
            shape: appBar?.shape,
            backgroundColor: appBar?.backgroundColor,
            foregroundColor: appBar?.foregroundColor,
            iconTheme: appBar?.iconTheme,
            actionsIconTheme: appBar?.actionsIconTheme,
            primary: appBar?.primary ?? true,
            centerTitle: appBar?.centerTitle,
            excludeHeaderSemantics: appBar?.excludeHeaderSemantics ?? false,
            titleSpacing: appBar?.titleSpacing,
            toolbarOpacity: appBar?.toolbarOpacity ?? 1.0,
            bottomOpacity: appBar?.bottomOpacity ?? 1.0,
            toolbarHeight: appBar?.toolbarHeight,
            leadingWidth: appBar?.leadingWidth,
            toolbarTextStyle: appBar?.toolbarTextStyle,
            titleTextStyle: appBar?.titleTextStyle,
            forceMaterialTransparency: appBar?.forceMaterialTransparency ?? false,
            clipBehavior: appBar?.clipBehavior
          ),
          body: body,
        ),
      );
    }


    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: context.isDarkMode() ? Brightness.light : (android ?? Brightness.dark),
          statusBarBrightness: context.isDarkMode() ? Brightness.dark : (ios ?? Brightness.light),
        ),
        child: Scaffold(
          body: body,
        ),
      ),
    );
  }
}