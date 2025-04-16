import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:taskly/core/extensions/context_ext.dart';

class CommonScaffold extends StatefulWidget {

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
  State<StatefulWidget> createState() => CommonScaffoldState();

  
}

class CommonScaffoldState extends State<CommonScaffold> {

  final _scaffoldKey = GlobalKey<ScaffoldState>();

  void openDrawer() => _scaffoldKey.currentState?.openDrawer();
  void closeDrawer() => _scaffoldKey.currentState?.closeDrawer();

  @override
  Widget build(BuildContext context) {
    if (widget.appBar != null) {
      return GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          key: _scaffoldKey,
          appBar: AppBar(
            key: widget.appBar?.key,
            systemOverlayStyle: SystemUiOverlayStyle(
              statusBarColor: Colors.transparent,
              statusBarIconBrightness: context.isDarkMode() ? Brightness.light : (widget.android ?? Brightness.dark),
              statusBarBrightness: context.isDarkMode() ? Brightness.dark : (widget.ios ?? Brightness.light),
            ),
            leading: widget.appBar?.leading,
            automaticallyImplyLeading: widget.appBar?.automaticallyImplyLeading ?? true,
            title: widget.appBar?.title,
            actions: widget.appBar?.actions,
            flexibleSpace: widget.appBar?.flexibleSpace,
            bottom: widget.appBar?.bottom,
            elevation: widget.appBar?.elevation,
            scrolledUnderElevation: widget.appBar?.scrolledUnderElevation,
            notificationPredicate: widget.appBar?.notificationPredicate ?? defaultScrollNotificationPredicate,
            shadowColor: widget.appBar?.shadowColor,
            surfaceTintColor: widget.appBar?.surfaceTintColor,
            shape: widget.appBar?.shape,
            backgroundColor: widget.appBar?.backgroundColor,
            foregroundColor: widget.appBar?.foregroundColor,
            iconTheme: widget.appBar?.iconTheme,
            actionsIconTheme: widget.appBar?.actionsIconTheme,
            primary: widget.appBar?.primary ?? true,
            centerTitle: widget.appBar?.centerTitle,
            excludeHeaderSemantics: widget.appBar?.excludeHeaderSemantics ?? false,
            titleSpacing: widget.appBar?.titleSpacing,
            toolbarOpacity: widget.appBar?.toolbarOpacity ?? 1.0,
            bottomOpacity: widget.appBar?.bottomOpacity ?? 1.0,
            toolbarHeight: widget.appBar?.toolbarHeight,
            leadingWidth: widget.appBar?.leadingWidth,
            toolbarTextStyle: widget.appBar?.toolbarTextStyle,
            titleTextStyle: widget.appBar?.titleTextStyle,
            forceMaterialTransparency: widget.appBar?.forceMaterialTransparency ?? false,
            clipBehavior: widget.appBar?.clipBehavior
          ),
          body: widget.body,
          floatingActionButton: widget.floatingActionButton,
          floatingActionButtonLocation: widget.floatingActionButtonLocation,
          floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
          persistentFooterButtons: widget.persistentFooterButtons,
          persistentFooterAlignment: widget.persistentFooterAlignment,
          drawer: widget.drawer,
          onDrawerChanged: widget.onDrawerChanged,
          endDrawer: widget.endDrawer,
          onEndDrawerChanged: widget.onEndDrawerChanged,
          bottomNavigationBar: widget.bottomNavigationBar,
          bottomSheet: widget.bottomSheet,
          backgroundColor: widget.backgroundColor,
          resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
          primary: widget.primary,
          drawerDragStartBehavior: widget.drawerDragStartBehavior,
          extendBody: widget.extendBody,
          extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
          drawerScrimColor: widget.drawerScrimColor,
          drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
          endDrawerEnableOpenDragGesture: widget.endDrawerEnableOpenDragGesture,
          restorationId: widget.restorationId,
        ),
      );
    }


    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          statusBarIconBrightness: context.isDarkMode() ? Brightness.light : (widget.android ?? Brightness.dark),
          statusBarBrightness: context.isDarkMode() ? Brightness.dark : (widget.ios ?? Brightness.light),
        ),
        child: Scaffold(
          key: _scaffoldKey,
          body: widget.body,
          floatingActionButton: widget.floatingActionButton,
          floatingActionButtonLocation: widget.floatingActionButtonLocation,
          floatingActionButtonAnimator: widget.floatingActionButtonAnimator,
          persistentFooterButtons: widget.persistentFooterButtons,
          persistentFooterAlignment: widget.persistentFooterAlignment,
          drawer: widget.drawer,
          onDrawerChanged: widget.onDrawerChanged,
          endDrawer: widget.endDrawer,
          onEndDrawerChanged: widget.onEndDrawerChanged,
          bottomNavigationBar: widget.bottomNavigationBar,
          bottomSheet: widget.bottomSheet,
          backgroundColor: widget.backgroundColor,
          resizeToAvoidBottomInset: widget.resizeToAvoidBottomInset,
          primary: widget.primary,
          drawerDragStartBehavior: widget.drawerDragStartBehavior,
          extendBody: widget.extendBody,
          extendBodyBehindAppBar: widget.extendBodyBehindAppBar,
          drawerScrimColor: widget.drawerScrimColor,
          drawerEdgeDragWidth: widget.drawerEdgeDragWidth,
          drawerEnableOpenDragGesture: widget.drawerEnableOpenDragGesture,
          endDrawerEnableOpenDragGesture:widget.endDrawerEnableOpenDragGesture,
          restorationId: widget.restorationId,
        ),
      ),
    );
  }
}