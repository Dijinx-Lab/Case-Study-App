// ignore_for_file: library_private_types_in_public_api

import 'package:case_study_app/utility/loading_util.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OverlayLoading extends StatefulWidget {
  const OverlayLoading({super.key, this.type = 0});

  final int type;

  @override
  _OverlayLoadingState createState() => _OverlayLoadingState();
}

class _OverlayLoadingState extends State<OverlayLoading>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reset();
        _controller.forward();
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Visibility(
          visible: widget.type == 1, child: LoadingUtil.buildAdaptiveLoader()),
      Visibility(
          visible: widget.type == 2, child: LoadingUtil.buildLineLoader()),
    ]);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
