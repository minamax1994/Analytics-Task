import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FadeInCard extends StatelessWidget {
  final Widget child;
  final isVisible = false.obs;

  FadeInCard({Key? key, required this.child}) : super(key: key) {
    WidgetsBinding.instance!.addPostFrameCallback((_) => isVisible.value = true);
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AnimatedOpacity(
        duration: const Duration(milliseconds: 500),
        opacity: isVisible.value ? 1 : 0,
        child: Card(
          margin: const EdgeInsets.all(10),
          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: child,
          ),
        ),
      ),
    );
  }
}
