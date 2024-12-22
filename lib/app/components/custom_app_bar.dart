import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color? titleColor;
  final List<Widget>? actions;
  final bool showBackButton;
  final bool forceMaterialTransparency;
  final VoidCallback? onBackPressed;
  final Widget? leading;

  const CustomAppBar({
    Key? key,
    required this.title,
    this.titleColor = const Color(0xFFFF4081),
    this.actions,
    this.showBackButton = true,
    this.forceMaterialTransparency = true,
    this.onBackPressed,
    this.leading,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: TextStyle(color: titleColor),
      ),
      leading: showBackButton 
          ? leading ?? IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackPressed ?? () => Get.back(),
            )
          : null,
      automaticallyImplyLeading: showBackButton,
      forceMaterialTransparency: forceMaterialTransparency,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
} 