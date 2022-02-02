// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:settings_ui/settings_ui.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SettingsList(
      sections: [
        SettingsSection(
          title: Text('Common'),
          tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: Icon(Icons.language),
              title: Text('Language'),
              value: Text('English'),
            ),
            SettingsTile.switchTile(
              onToggle: (value) {},
              initialValue: true,
              leading: Icon(Icons.format_paint),
              title: Text('Enable custom theme'),
            ),
            SettingsTile.navigation(
              leading: Icon(Icons.logout),
              title: Text('Language'),
              value: Text('English'),
            ),
          ],
        ),
      ],
    );
  }
}
