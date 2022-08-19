import 'package:bitpay/view/screens/profile_page/widgets/settings_tile.dart';
import 'package:flutter/material.dart';

class SettingsPanel extends StatelessWidget {
  const SettingsPanel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SettingsTile(
          tileTitle: 'Personal Info',
          tileIcon: Icons.person,
        ),
        SettingsTile(
          tileTitle: 'My QR Code',
          tileIcon: Icons.qr_code_scanner,
        ),
        SettingsTile(
          tileTitle: 'Banks and Cards',
          tileIcon: Icons.location_city,
        ),
        SettingsTile(
          tileTitle: 'Payment Preferences',
          tileIcon: Icons.payments_rounded,
        ),
        SettingsTile(
          tileTitle: 'Automatic Payments',
          tileIcon: Icons.replay,
        ),
        SettingsTile(
          tileTitle: 'Login and Security',
          tileIcon: Icons.login_outlined,
        ),
        SettingsTile(
          tileTitle: 'Notifications',
          tileIcon: Icons.notifications,
        ),
      ],
    );
  }
}
