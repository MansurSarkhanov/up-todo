import 'dart:async';

import 'package:flutter/material.dart';

class AnimationButtonEffect extends StatefulWidget {
  const AnimationButtonEffect({
    required this.child,
    super.key,
    this.disabled = true,
    this.lowerBound,
  });
  final bool disabled;
  final double? lowerBound;

  final Widget child;

  @override
  State createState() => _AnimationButtonEffectState();
}

class _AnimationButtonEffectState extends State<AnimationButtonEffect>
    with TickerProviderStateMixin {
  late AnimationController _controllerA;

  double squareScaleA = 0.95;

  @override
  void initState() {
    _controllerA = AnimationController(
      vsync: this,
      lowerBound: widget.lowerBound ?? 0.98,
      duration: const Duration(milliseconds: 80),
    );
    _controllerA.addListener(() {
      setState(() {
        squareScaleA = _controllerA.value;
      });
    });
    unawaited(_controllerA.forward(from: 0));
    super.initState();
  }

  @override
  void dispose() {
    _controllerA.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.disabled
        ? Listener(
            onPointerDown: (_) async {
              await _controllerA.reverse();
            },
            onPointerUp: (_) async {
              await _controllerA.forward(from: 1);
            },
            child: Transform.scale(scale: squareScaleA, child: widget.child),
          )
        : widget.child;
  }
}
