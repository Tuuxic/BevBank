import 'package:bev_bank/util/screen_size_detection.dart';
import 'package:flutter/material.dart';

class AppBarButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final void Function()? onPressed;

  const AppBarButton({
    super.key,
    required this.icon,
    required this.label,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    bool isMobile = ScreenSizeDetection.isMobile(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: isMobile
          ? IconButton(
              icon: Icon(icon),
              onPressed: onPressed,
            )
          : TextButton.icon(
              onPressed: onPressed,
              label: Text(label),
              icon: Icon(icon),
            ),
    );
  }
}
