import 'dart:io';

import 'package:flutter/material.dart';

class CommonImage extends StatelessWidget {
  
  const CommonImage({
    super.key, 
    this.path = "",
    this.height,
    this.width, 
    this.fit,
    this.radius = 0.0,
    this.backgroundColor,
    this.color,
    this.borderColor = Colors.black,
    this.border = 0.0,
    this.errorWidget,
    this.file
  });

  final File? file;
  final String path;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final double radius;
  final Color? color;
  final Color? backgroundColor;

  final double border;
  final Color borderColor;
  final Widget? errorWidget;

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment: Alignment.center,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        border: border == 0.0 ? null : Border.fromBorderSide(
          BorderSide(
            color: borderColor,
            width: border
          ),
        ),
        color: backgroundColor
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: Container(
          alignment: Alignment.center,
          height: height,
          width: width,
          child: file != null
          ? Image.file(
            file!,
            height: height, 
            width: width, 
            fit: fit,
            color: color,
            errorBuilder: (context, error, stackTrace) {
              return errorWidget ?? Container(
                height: height,
                width: width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: Colors.grey.shade200,
                ),
                child: const CommonImage(
                  path: "", //insert error image
                  height: 30.0,
                  width: 30.0,
                  color: Colors.grey,
                  fit: BoxFit.cover
                ),
              );
            },
          ) 
          : Image.asset(
            path, 
            height: height, 
            width: width, 
            fit: fit,
            color: color,
            errorBuilder: (context, error, stackTrace) {
              return errorWidget ?? Container(
                height: height,
                width: width,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(radius),
                  color: Colors.grey.shade200,
                ),
                child: const CommonImage(
                  path: "", //insert error image
                  height: 30.0,
                  width: 30.0,
                  color: Colors.grey,
                  fit: BoxFit.cover
                ),
              );
            },
          ),
        )
      ),
    );
  }
}

