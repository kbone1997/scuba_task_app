import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final VoidCallback? onBackPressed;
  final VoidCallback? onNotificationPressed;
  final bool showBackButton;

  const CustomAppBar({
    super.key,
    this.title = 'SCM',
    this.onBackPressed,
    this.onNotificationPressed,
    this.showBackButton = true,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      backgroundColor: Colors.white,
      foregroundColor: Colors.black,
      automaticallyImplyLeading: false,
      leading: showBackButton
          ? IconButton(
              padding: const EdgeInsets.only(left: 12),
              icon: const Icon(Icons.arrow_back),
              onPressed: onBackPressed ??
                  () {
                    Navigator.pop(context);
                  },
            )
          : null,
      actions: [
        IconButton(
          padding: const EdgeInsets.only(right: 12),
          icon: SvgPicture.asset(
            'assets/images/bell.svg',
            width: 20,
            height: 20,
          ),
          onPressed: onNotificationPressed ??
              () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Notifications feature coming soon!'),
                  ),
                );
              },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}