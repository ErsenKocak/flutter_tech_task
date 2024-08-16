import 'package:flutter/material.dart';
import 'package:flutter_tech_task/common/widgets/app_bar/actions/notification/app_bar_notification_action.dart';
import 'package:flutter_tech_task/common/widgets/app_bar/app_bar_widget.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppbar,
      body: _buildBody,
    );
  }

  get _buildAppbar {
    return AppBarWidget(
      actions: [AppBarNotificationAction()],
    );
  }

  Widget get _buildBody {
    return Center(
      child: Text('Settings View'),
    );
  }
}
