import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  final Widget title;
  final List<Widget>? actions;
  final Color? backgroundColor;
  final IconData? leadingIcon;
  final Color? leadingIconColor;
  final VoidCallback? onLeadingPressed;

  CustomAppBar({
    Key? key,
    required this.title,
    this.actions,
    this.backgroundColor,
    this.leadingIcon,
    this.leadingIconColor,
    this.onLeadingPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: title,
      backgroundColor: backgroundColor ?? Colors.white,
      automaticallyImplyLeading: leadingIcon != null,
      leading: leadingIcon != null
          ? IconButton(
              icon: Icon(
                leadingIcon,
                color: leadingIconColor,
              ),
              onPressed: onLeadingPressed,
            )
          : null,
      actions: actions != null
          ? [
              ...actions!,
              IconButton(
                icon: Icon(Icons.help_outline_outlined),
                onPressed: () {
                  // Handle help action
                },
              ),
            ]
          : [
              IconButton(
                icon: Icon(Icons.help_outline_outlined),
                onPressed: () {
                  // Handle help action
                },
              ),
            ],
    );
  }
}
