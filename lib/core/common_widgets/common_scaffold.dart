import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskly/core/extensions/context_extension.dart';

class CommonScaffold extends StatelessWidget {

  const CommonScaffold({
    super.key, 
    required this.body,
    this.appBar,
    this.android,
    this.ios,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.floatingActionButtonAnimator,
    this.persistentFooterButtons,
    this.persistentFooterAlignment = AlignmentDirectional.centerEnd,
    this.drawer,
    this.onDrawerChanged,
    this.endDrawer,
    this.onEndDrawerChanged,
    this.bottomNavigationBar,
    this.bottomSheet,
    this.backgroundColor,
    this.resizeToAvoidBottomInset,
    this.primary = true,
    this.drawerDragStartBehavior = DragStartBehavior.start,
    this.extendBody = false,
    this.extendBodyBehindAppBar = false,
    this.drawerScrimColor,
    this.drawerEdgeDragWidth,
    this.drawerEnableOpenDragGesture = true,
    this.endDrawerEnableOpenDragGesture = true,
    this.restorationId,
  });

  final Widget body;
  final AppBar? appBar;
  final Brightness? android;
  final Brightness? ios;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final FloatingActionButtonAnimator? floatingActionButtonAnimator;
  final List<Widget>? persistentFooterButtons;
  final AlignmentDirectional persistentFooterAlignment;
  final Widget? drawer;
  final DrawerCallback? onDrawerChanged;
  final Widget? endDrawer;
  final DrawerCallback? onEndDrawerChanged;
  final Color? drawerScrimColor;
  final Color? backgroundColor;
  final Widget? bottomNavigationBar;
  final Widget? bottomSheet;
  final bool? resizeToAvoidBottomInset;
  final bool primary;
  final DragStartBehavior drawerDragStartBehavior;
  final double? drawerEdgeDragWidth;
  final bool drawerEnableOpenDragGesture;
  final bool endDrawerEnableOpenDragGesture;
  final String? restorationId;
  final bool extendBody;
  final bool extendBodyBehindAppBar;
  
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
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          persistentFooterButtons: persistentFooterButtons,
          persistentFooterAlignment: persistentFooterAlignment,
          drawer: drawer,
          onDrawerChanged: onDrawerChanged,
          endDrawer: endDrawer,
          onEndDrawerChanged: onEndDrawerChanged,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          primary: primary,
          drawerDragStartBehavior: drawerDragStartBehavior,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          drawerScrimColor: drawerScrimColor,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
          endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
          restorationId: restorationId,
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
          floatingActionButton: floatingActionButton,
          floatingActionButtonLocation: floatingActionButtonLocation,
          floatingActionButtonAnimator: floatingActionButtonAnimator,
          persistentFooterButtons: persistentFooterButtons,
          persistentFooterAlignment: persistentFooterAlignment,
          drawer: drawer,
          onDrawerChanged: onDrawerChanged,
          endDrawer: endDrawer,
          onEndDrawerChanged: onEndDrawerChanged,
          bottomNavigationBar: bottomNavigationBar,
          bottomSheet: bottomSheet,
          backgroundColor: backgroundColor,
          resizeToAvoidBottomInset: resizeToAvoidBottomInset,
          primary: primary,
          drawerDragStartBehavior: drawerDragStartBehavior,
          extendBody: extendBody,
          extendBodyBehindAppBar: extendBodyBehindAppBar,
          drawerScrimColor: drawerScrimColor,
          drawerEdgeDragWidth: drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: drawerEnableOpenDragGesture,
          endDrawerEnableOpenDragGesture: endDrawerEnableOpenDragGesture,
          restorationId: restorationId,
        ),
      ),
    );
  }
}