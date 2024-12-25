import 'package:flutter/material.dart';
import 'package:kano_city_guide/core/textstyle.dart';
import 'package:kano_city_guide/providers/auth_provider.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    AuthProvider authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            Column(
              children: [
                CircleAvatar(),
                const SizedBox(
                  height: 12,
                ),
                TextField(),
              ],
            ),
            ElevatedButton.icon(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Text(
                      'Sign Out',
                      style: kTextStyle(24),
                    ),
                    titlePadding: const EdgeInsets.all(16),
                    content: Text(
                      'Are you sure you want to sign out',
                      style: kTextStyle(12),
                    ),
                    actions: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text("No"),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                          Navigator.pop(context);
                          authProvider.signOut(context);
                        },
                        child: Text("Yes"),
                      )
                    ],
                  ),
                );
              },
              label: Text(
                'Sign Out',
                style: kTextStyle(18),
              ),
              icon: const Icon(Icons.logout_rounded),
            )
          ],
        ),
      ),
    );
  }
}
