import 'package:flutter/material.dart';

class FadeInAnim extends StatefulWidget {
  const FadeInAnim({
    super.key,
    required this.child,
    required this.state,
  });

  final Widget child;
  final bool state;

  @override
  State<FadeInAnim> createState() => _FadeInAnimState();
}

class _FadeInAnimState extends State<FadeInAnim>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeInAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
    );

    _fadeInAnim = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeIn,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    widget.state ? _controller.forward() : _controller.reverse();
    return FadeTransition(
      opacity: _fadeInAnim,
      child: widget.child,
    );
  }
}
