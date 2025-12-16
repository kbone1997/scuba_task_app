import 'package:flutter/material.dart';
import 'package:scube_task_app/widgets/electricity_widget.dart';
import 'widgets/custom_app_bar.dart';
import 'widgets/custom_card_widget.dart';
import 'detail_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () {
          // Navigate back to login
          Navigator.pushReplacementNamed(context, '/');
        },
        onNotificationPressed: () {
          // Handle notification tap
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Notifications feature coming soon!')),
          );
        },
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const ElectricityWidget(),

              const SizedBox(height: 16),

              // Row 1
              Row(
                children: [
                  Expanded(
                    child: CustomCardWidget(
                      imagePath: 'assets/images/chart.png',
                      text: 'Analysis Pro',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomCardWidget(
                      imagePath: 'assets/images/gen.png',
                      text: 'G. Generator',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Row 2
              Row(
                children: [
                  Expanded(
                    child: CustomCardWidget(
                      imagePath: 'assets/images/charge.png',
                      text: 'Plant Summary',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomCardWidget(
                      imagePath: 'assets/images/fire.png',
                      text: 'Natural Gas',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 16),

              // Row 3
              Row(
                children: [
                  Expanded(
                    child: CustomCardWidget(
                      imagePath: 'assets/images/gen.png',
                      text: 'D. Generator',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailPage(),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: CustomCardWidget(
                      imagePath: 'assets/images/faucet.png',
                      text: 'Water Process',
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const DetailPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
