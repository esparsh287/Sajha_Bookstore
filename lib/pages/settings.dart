import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:sajhabackup/Widgets/settingstile.dart';
import 'package:sajhabackup/pages/accountdetails.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(
          'Settings',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Color(0xFF9526BC),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SettingsTile(
                color: Color(0xFF9526BC),
                icon: Ionicons.person_circle_outline,
                title: "Account",
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => accountdetails()));
                },
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Color(0xFF9526BC),
                icon: Ionicons.help,
                title: "Help Center",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Color(0xFF9526BC),
                icon: Ionicons.moon_outline,
                title: "Theme",
                onTap: () {},
              ),
              const SizedBox(
                height: 10,
              ),
              SettingsTile(
                color: Color(0xFF9526BC),
                icon: Ionicons.language,
                title: "Language",
                onTap: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
