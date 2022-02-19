import 'package:analytics_app/theme/app_styles.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  final String? title;
  final Widget? leading;
  final Widget? trailing;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    Key? key,
    this.title,
    this.leading,
    this.trailing,
    this.backgroundColor = Colors.transparent,
    this.bottom,
  }) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(120.0);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      elevation: 0.0,
      backgroundColor: backgroundColor,
      title: Text(title ?? "", style: AppStyles.titleStyle),
      leading: leading,
      actions: trailing != null ? [trailing!] : [],
      bottom: bottom,
    );
  }
}
