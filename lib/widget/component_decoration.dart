import 'package:flutter/material.dart';

class ComponentDecoration extends StatefulWidget {
  const ComponentDecoration({
    super.key,
    this.label,
    required this.child,
    this.tooltipMessage = '',
  });

  final String? label;
  final Widget child;
  final String? tooltipMessage;

  @override
  State<ComponentDecoration> createState() => _ComponentDecorationState();
}

class _ComponentDecorationState extends State<ComponentDecoration> {
  final rowDivider = const SizedBox(width: 20);
  final colDivider = const SizedBox(height: 10);
  double widthConstraint = 450;
  double smallSpacing = 10.0;
  final focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: smallSpacing),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(widget.label ?? '',
                    style: Theme.of(context).textTheme.titleSmall),
                Tooltip(
                  message: widget.tooltipMessage,
                  child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 5.0),
                      child: Icon(Icons.info_outline, size: 16)),
                ),
              ],
            ),
            ConstrainedBox(
              constraints: BoxConstraints.tightFor(width: widthConstraint),
              // Tapping within the a component card should request focus
              // for that component's children.
              child: Focus(
                focusNode: focusNode,
                canRequestFocus: true,
                child: GestureDetector(
                  onTapDown: (_) {
                    focusNode.requestFocus();
                  },
                  behavior: HitTestBehavior.opaque,
                  child: Card(
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        color: Theme.of(context).colorScheme.outlineVariant,
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 5.0, vertical: 20.0),
                      child: Center(
                        child: widget.child,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
