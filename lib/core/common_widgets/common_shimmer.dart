import 'package:flutter/material.dart';


/// {@template card_loading}
/// The `CardLoading` widget is used to create an easy animation
/// between two colors.
/// Example usage:
///
/// ```dart
/// CardLoading(
///   height: 100,
///   animationDuration: Duration(milliseconds: 500),
///   cardLoadingTheme: CardLoadingTheme(
///     colorOne: Colors.blue,
///     colorTwo: Colors.lightBlue,
///   ),
/// )
/// ```
/// {@endtemplate}
class CommonShimmer extends StatefulWidget {
  /// {@macro card_loading}
  const CommonShimmer({
    super.key,
    required this.height,
    this.width,
    this.child,
    this.margin,
    this.borderRadius,
    this.animationDuration = const Duration(milliseconds: 750),
    this.animationDurationTwo = const Duration(milliseconds: 450),
    this.cardLoadingTheme = CardLoadingTheme.defaultTheme,
    this.curve = Curves.easeInOutSine,
    this.withChangeDuration = true,
  });

  /// `height` is the height of the `CardLoading` widget and is required.
  final double height;

  /// `width` is the width of the `CardLoading` widget and has a default value of `double.maxInfinite`.
  final double? width;

  /// `margin` is the padding around the widget and has a default value of `EdgeInsets.zero`.
  final EdgeInsets? margin;

  /// `child` is the widget below the `CardLoading` widget in the widget tree.
  final Widget? child;

  /// `borderRadius` is the radius for either circular
  /// or elliptical shapes and has a default value of `null`.
  final BorderRadius? borderRadius;

  /// `withChangeDuration` determines if there is a difference in
  /// the `animationDuration` between `colorOne` and `colorTwo`.
  final bool withChangeDuration;

  /// `animationDuration` is the duration of the animation from
  /// `Offset` (0, 0) to `Offset` (0, 1) and has a default value of `750 milliseconds`.
  final Duration animationDuration;

  /// `animationDurationTwo` is the duration of the second animation and has a default value of `450 milliseconds`.
  final Duration animationDurationTwo;

  /// `CardLoadingTheme` is used to set the custom color for the `CardLoading` widget.
  final CardLoadingTheme cardLoadingTheme;

  /// The curve to use in the forward direction.
  final Curve curve;

  @override
  State<CommonShimmer> createState() => _CommonShimmerState();
}

class _CommonShimmerState extends State<CommonShimmer>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;
  late Color _backgroudColor, _loadingColor;
  bool _isBackgroundOnTop = true;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: widget.animationDuration);
    initAnimation();
    listenAnimation();
    _backgroudColor = widget.cardLoadingTheme.colorOne;
    _loadingColor = widget.cardLoadingTheme.colorTwo;
    _animationController.forward();
  }

  @override
  void didUpdateWidget(covariant CommonShimmer oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.cardLoadingTheme != widget.cardLoadingTheme) {
      _loadingColor = widget.cardLoadingTheme.colorOne;
      _backgroudColor = widget.cardLoadingTheme.colorTwo;
    }
    if ((widget.animationDuration != oldWidget.animationDuration) ||
        (widget.curve != oldWidget.curve)) {
      initAnimation();
    }
  }

  void initAnimation({Curve? curve}) {
    _animation = CurvedAnimation(
        parent: _animationController, curve: curve ?? widget.curve);
  }

  void listenAnimation() {
    _animationController.addStatusListener((status) {
      if (!mounted) return;
      if (_animationController.isCompleted) {
        changeDuration();
        reverseColor();
        _animationController.reset();
        _animationController.forward();
      }
    });
  }

  /// this function will reverse the colors of colorOne and colorTwo
  /// to swap with each other, every time the animation is complete
  void reverseColor() {
    final theme = widget.cardLoadingTheme;
    if (_isBackgroundOnTop) {
      _backgroudColor = theme.colorTwo;
      _loadingColor = theme.colorOne;
    } else {
      _backgroudColor = theme.colorOne;
      _loadingColor = theme.colorTwo;
    }
    setState(() {
      _isBackgroundOnTop = !_isBackgroundOnTop;
    });
  }

  void changeDuration() {
    if (widget.withChangeDuration) {
      if (_isBackgroundOnTop) {
        _animationController.duration = widget.animationDurationTwo;
      } else {
        _animationController.duration = widget.animationDuration;
      }
    } else {
      int currentDurationMilliseconds =
          _animationController.duration?.inMilliseconds ?? 0;
      int expectDuration = widget.animationDuration.inMilliseconds;
      if (currentDurationMilliseconds != expectDuration) {
        _animationController.duration = widget.animationDuration;
      }
    }
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: widget.margin ?? EdgeInsets.zero,
      child: AnimatedBuilder(
        animation: _animationController,
        builder: (context, snapshot) {
          return CustomPaint(
            painter: CardLoadingPainter(
              colorOne: _loadingColor,
              colorTwo: _backgroudColor,
              progress: _animation.value,
              borderRadius: widget.borderRadius,
            ),
            size: Size(widget.width ?? double.maxFinite, widget.height),
            child: widget.child,
          );
        },
      ),
    );
  }
}

/// {@template card_loading_painter}
/// [CardLoadingPainter] is a [CustomPainter]
/// that will draw every time there is an
/// update of the animation on [CommonShimmer].
/// colorOne Color for background
/// colorTwo Color for progress Rectangle
/// {@endtemplate}
class CardLoadingPainter extends CustomPainter {
  final Color colorOne;
  final Color colorTwo;
  final double progress;
  final BorderRadius? borderRadius;

  /// {@macro card_loading_painter}
  const CardLoadingPainter({
    super.repaint,
    required this.colorOne,
    required this.colorTwo,
    required this.progress,
    this.borderRadius,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final height = size.height;
    final width = size.width;

    final paintBackground = Paint()..color = colorOne;
    final pathBackground = Path()
      ..lineTo(0, height)
      ..lineTo(width, height)
      ..lineTo(width, 0)
      ..close();

    final paint = Paint()..color = colorTwo;
    final path = Path()
      ..lineTo(0, height)
      ..lineTo(width * progress, height)
      ..lineTo(width * progress, 0)
      ..close();

    // When borderRadius is'nt null and greather than 0
    // canvas will clipped
    if (borderRadius != null) {
      final rect = Rect.fromLTRB(0, 0, width, height);

      canvas.clipRRect(borderRadius!.toRRect(rect));
    }
    canvas.drawPath(pathBackground, paintBackground);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CardLoadingPainter oldDelegate) =>
      progress != oldDelegate.progress ||
      borderRadius != oldDelegate.borderRadius ||
      colorOne != oldDelegate.colorOne ||
      colorTwo != oldDelegate.colorTwo;
}

/// {@template card_loading_theme}
///
/// The `CardLoadingTheme` class defines the visual appearance of a loading card.
///
/// This class takes in two `Color` parameters, `colorOne` and `colorTwo`,
/// which are used to set the background color of the card during its loading state.
///
/// Example usage:
///
/// ```dart
/// CardLoadingTheme(
///   colorOne: Colors.lightBlue,
///   colorTwo: Colors.blue,
/// )
/// ```
///
/// {@endtemplate}
class CardLoadingTheme {
  /// at the beginning this will be the [Color] for the background [CommonShimmer]
  /// default Color(0xFFE5E5E5)
  final Color colorOne;

  /// at the beginning this will be the [Color] for the Loading [CommonShimmer]
  /// default Color(0xFFF0F0F0)
  final Color colorTwo;

  /// {@macro card_loading_theme}
  const CardLoadingTheme({
    required this.colorOne,
    required this.colorTwo,
  });

  static const CardLoadingTheme defaultTheme = CardLoadingTheme(
    colorOne: Color(0xFFE5E5E5),
    colorTwo: Color(0xFFF0F0F0),
  );
}