import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_tech_task/features/bottom_bar/view/bottom_bar_view.dart';

mixin BottomBarMixin on State<BottomBarView> {
  late ValueNotifier<int> activeIndexNotifier;

  @override
  void initState() {
    super.initState();
    activeIndexNotifier = ValueNotifier<int>(0);

    initializeMixin();
  }

  Future<void> initializeMixin() async {
    await initalizeServices();
  }

  Future<void> initalizeServices() async {}
}
