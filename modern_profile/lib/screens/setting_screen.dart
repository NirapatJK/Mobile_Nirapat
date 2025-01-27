import 'package:flutter/material.dart';

class SettingScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: Colors.blue,  
            ),
            title: Text('Account Settings'),
            subtitle: Text('Apple ID, iCloud, Security'),
            onTap: () {
              // Action for account settings
            },
          ),
          ListTile(
            leading: Icon(
              Icons.notifications,
              color: Colors.green,  
            ),
            title: Text('Notifications'),
            onTap: () {
              // Action for notifications
            },
          ),
          ListTile(
            leading: Icon(
              Icons.lock,
              color: Colors.orange,  
            ),
            title: Text('Privacy Settings'),
            onTap: () {
              // Action for privacy settings
            },
          ),
          ListTile(
            leading: Icon(
              Icons.language,
              color: Colors.purple,  
            ),
            title: Text('Language'),
            onTap: () {
              // Action for language settings
            },
          ),
          ListTile(
            leading: Icon(
              Icons.info,
              color: Colors.red,  
            ),
            title: Text('About'),
            onTap: () {
              // Action for about page
            },
          ),
        ],
      ),
    );
  }
}

