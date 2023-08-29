import 'package:flutter/material.dart';

class ReloadListTile extends StatefulWidget {
  final Function() onPressed;

  const ReloadListTile({super.key, required this.onPressed});

  @override
  _ReloadListTileState createState() => _ReloadListTileState();
}

class _ReloadListTileState extends State<ReloadListTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _animation = Tween(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _controller.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _startAnimation() {
    _controller.repeat();
    Future.delayed(const Duration(milliseconds: 1000), () {
      _controller.stop();
    });
    widget.onPressed();
  }

  @override
  Widget build(BuildContext context) {
    return IconButton(
      icon: Transform.rotate(
        angle: _animation.value * 2.0 * 3.14,
        child: const Icon(
          // Icons.cached_rounded,
          Icons.autorenew_rounded,
          size: 40,
        ),
      ),
      onPressed: _startAnimation,
    );
  }
}
