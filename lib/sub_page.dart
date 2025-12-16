import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';

class SubPage extends StatelessWidget {
  const SubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFB6B8D0),
      appBar: CustomAppBar(
        onBackPressed: () {
          // Navigate back to HomePage
          Navigator.pop(context);
        },
        onNotificationPressed: () {
          // Handle notification tap
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Notifications feature coming soon!'),
            ),
          );
        },
      ),
      body: Center(
        child: Container(

        )
      ),
    );
  }
}