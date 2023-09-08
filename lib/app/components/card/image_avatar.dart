// ignore_for_file: unnecessary_cast

import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/app/extensions/widgets_scale_extension.dart';

class ImageAvatar extends StatelessWidget {
  final VoidCallback? onTap;
  final String? url;
  final String? avatarPath;
  final File? imageFile;
  final double? radius;
  final Color? bgColor;
  final bool showNoAvatar;
  const ImageAvatar({Key? key, this.onTap, this.radius, this.bgColor, this.url, this.imageFile, this.showNoAvatar=false, this.avatarPath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: CircleAvatar(
        radius: radius ?? 52.horizontalScale,
        backgroundColor: bgColor ?? Theme.of(context).colorScheme.primary.withOpacity(0.1),
        backgroundImage: showNoAvatar ? null : url!=null ? (NetworkImage(url!)) : (FileImage(File(imageFile!.path)) as ImageProvider),
        child: showNoAvatar ? (avatarPath!=null ? Image.asset(avatarPath!,fit: BoxFit.cover,) : Icon(Icons.person,color: Theme.of(context).colorScheme.primary,size: radius!=null ? (radius!/2) : 21.horizontalScale,)) : null,
      ),
    );
  }
}
