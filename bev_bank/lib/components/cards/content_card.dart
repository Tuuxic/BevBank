import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  final Widget? child;
  final void Function()? onTap;
  const ContentCard({super.key, this.child, this.onTap});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(4.0),
      ),
      elevation: 4,
      shadowColor: Theme.of(context).shadowColor,
      child: InkWell(
          onTap: onTap,
          borderRadius: const BorderRadius.all(Radius.circular(4.0)),
          child: child),
    );
  }
}
