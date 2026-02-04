import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routing/routes.dart';

class SettingsScreen extends ConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back),
        title: const Text('Settings'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile
            Center(
              child: Stack(
                children: [
                  Container(
                    padding: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: const Color(0xFF8B5CF6).withValues(alpha: 0.5),
                        width: 2,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: const Color(0xFF8B5CF6).withValues(alpha: 0.2),
                          blurRadius: 20,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: NetworkImage(
                        'https://i.pravatar.cc/150?img=11',
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: const BoxDecoration(
                        color: Color(0xFF1E1E1E),
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Color(0xFF8B5CF6),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              'Alex Dev',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 4),
            const Text(
              'Lead Backend Engineer',
              style: TextStyle(color: Color(0xFF8B5CF6), fontSize: 14),
            ),
            const SizedBox(height: 32),

            // Account Section
            _buildSectionHeader('ACCOUNT'),
            _buildSettingsGroup([
              _buildSettingsTile(
                icon: Icons.shield_outlined,
                iconColor: const Color(0xFF8B5CF6),
                title: 'Account Security',
                onTap: () {},
              ),
              _buildSettingsTile(
                icon: Icons.hub_outlined,
                iconColor: const Color(0xFF8B5CF6),
                title: 'Connected Repositories',
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 24),

            // Preferences
            _buildSectionHeader('PREFERENCES'),
            _buildSettingsGroup([
              _buildSettingsTile(
                icon: Icons.palette_outlined,
                iconColor: const Color(0xFF8B5CF6),
                title: 'Theme Customization',
                value: 'Cyber Dark',
                onTap: () {},
              ),
              _buildSettingsTile(
                icon: Icons.text_fields,
                iconColor: const Color(0xFF8B5CF6),
                title: 'Editor Font Size',
                value: '14px',
                onTap: () {},
              ),
            ]),
            const SizedBox(height: 24),

            // Notifications
            _buildSectionHeader('NOTIFICATIONS'),
            _buildSettingsGroup([
              _buildSwitchTile(
                icon: Icons.check_circle_outline,
                iconColor: const Color(0xFF8B5CF6),
                title: 'Build Success Alerts',
                value: true,
                onChanged: (v) {},
              ),
              _buildSwitchTile(
                icon: Icons.comment_outlined,
                iconColor: Colors.grey, // Inactive look
                title: 'PR Reviews',
                value: false,
                onChanged: (v) {},
              ),
              _buildSwitchTile(
                icon: Icons.email_outlined,
                iconColor: const Color(0xFF8B5CF6),
                title: 'Marketing Emails',
                value: false,
                onChanged: (v) {},
              ),
            ]),
            const SizedBox(height: 32),

            // Log Out
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: () {
                  context.go(Routes.auth.path);
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: Colors.redAccent,
                  side: BorderSide(
                    color: Colors.redAccent.withValues(alpha: 0.2),
                  ),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  backgroundColor: Colors.redAccent.withValues(alpha: 0.05),
                ),
                child: const Text('Log Out'),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Version 2.4.0 (Build 302)',
              style: TextStyle(color: Colors.grey[600], fontSize: 12),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 8, bottom: 8),
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title,
          style: TextStyle(
            color: Colors.grey[400],
            fontSize: 12,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),
      ),
    );
  }

  Widget _buildSettingsGroup(List<Widget> children) {
    return Container(
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(children: children),
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    String? value,
    required VoidCallback onTap,
  }) {
    return ListTile(
      onTap: onTap,
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (value != null) ...[
            Text(value, style: const TextStyle(color: Colors.grey)),
            const SizedBox(width: 8),
          ],
          const Icon(Icons.chevron_right, color: Colors.grey),
        ],
      ),
    );
  }

  Widget _buildSwitchTile({
    required IconData icon,
    required Color iconColor,
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: iconColor.withValues(alpha: 0.1),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: iconColor, size: 20),
      ),
      title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeThumbColor: Colors.white,
        activeTrackColor: const Color(0xFF3B82F6), // Blue as per image
      ),
    );
  }
}
