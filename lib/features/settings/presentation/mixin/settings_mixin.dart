import 'package:flutter/material.dart';
import 'package:flutter_tech_task/features/settings/presentation/view/settings_view.dart';

mixin SettingsMixin on State<SettingsView> {
  @override
  void initState() {
    super.initState();
    initializeMixin();
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> initializeMixin() async {
    await initializeServices();
  }

  Future<void> initializeServices() async {}
}
