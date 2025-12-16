import 'package:flutter/material.dart';
import 'package:scube_task_app/electricity_dashboard_part.dart';

class ElectricityWidget extends StatelessWidget {
  const ElectricityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.6;

    return Container(
      height: height,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Tabs
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text('Summary', style: TextStyle(fontWeight: FontWeight.w600)),
              Text('SLD'),
              Text('Data'),
            ],
          ),

          const SizedBox(height: 8),
          const Divider(thickness: 1),

          /// Title
          const Text(
            'Electricity',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          const SizedBox(height: 16),

          /// Circle Indicator
          Center(
            child: Container(
              width: 140,
              height: 140,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.grey.shade400, width: 4),
              ),
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.grey.shade200,
                  ),
                  child: const Center(
                    child: Text(
                      'Total Power\n55 kW',
                      textAlign: TextAlign.center,
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ),

          const SizedBox(height: 16),
          const Divider(thickness: 1),

          /// Source / Load
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: const [
              Text('Source', style: TextStyle(fontWeight: FontWeight.w600)),
              Text('Load'),
            ],
          ),

          const Divider(thickness: 1),
          const SizedBox(height: 8),

          /// Scrollable Demo Cards
          Expanded(
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EnergyDashboard(),
                      ),
                    );
                  },
                  child: Container(
                    height: 60,
                    margin: const EdgeInsets.only(bottom: 8),
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                    decoration: BoxDecoration(
                      color: Colors.grey.shade100,
                      borderRadius: BorderRadius.circular(6),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Demo Card ${index + 1}',
                      style: const TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
