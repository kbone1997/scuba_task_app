import 'package:flutter/material.dart';
import 'widgets/custom_app_bar.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () {
          Navigator.pop(context);
        },
        onNotificationPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Notifications feature coming soon!')),
          );
        },
      ),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.8,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 2, color: Color(0xFFB6B8D0)),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            children: [
              Image.asset('assets/images/no_data.png', width: 300, height: 200),
              Text('No data is here, \n please wait.'),
            ],
          ),
        ),
      ),
    );
  }
}
