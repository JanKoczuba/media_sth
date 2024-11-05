import 'package:flutter/material.dart';

class ProcessingContainer extends StatelessWidget {
  const ProcessingContainer({
    required this.child,
    required this.isProcessing,
    super.key,
  });

  final Widget child;
  final bool isProcessing;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (!isProcessing) child,
        Positioned.fill(
          child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              switchInCurve: Curves.linearToEaseOut,
              switchOutCurve: Curves.linearToEaseOut,
              child: Builder(builder: (BuildContext context) {
                if (!isProcessing) {
                  return const SizedBox(
                    key: ValueKey("NotProcessingOverlay"),
                  );
                }

                return Container(
                  color: Colors.white60,
                  child: const Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              })),
        ),
      ],
    );
  }
}
