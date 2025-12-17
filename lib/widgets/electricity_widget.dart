import 'package:flutter/material.dart';
import 'package:scube_task_app/electricity_dashboard_part.dart';
import 'package:scube_task_app/widgets/data_widget.dart';
import 'package:scube_task_app/widgets/source_load_widget.dart';

class ElectricityWidget extends StatelessWidget {
  const ElectricityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.6;
    final List<Map<String, dynamic>> dataCardsValues = [
      {
        "activeStatus": true,
        "data1": 5553.01,
        "data2": 3434.23,
        "image": "assets/images/solar-cell.png",
        "title": "Data View",
      },
      {
        "activeStatus": true,
        "data1": 1280.75,
        "data2": 980.42,
        "image": "assets/images/battery.png",
        "title": "Data Type 2",
      },
      {
        "activeStatus": false,
        "data1": 845.24,
        "data2": 620.16,
        "image": "assets/images/power.png",
        "title": "Data Type 3",
      },
      {
        "activeStatus": true,
        "data1": 2300.05,
        "data2": 1900.55,
        "image": "assets/images/solar-cell.png",
        "title": "Total Solar",
      },
    ];

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
          Center(
            child: const Text(
              'Electricity',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          Divider(thickness: 1),

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

          /// Source / Load
          SourceLoadToggle(),

          const Divider(thickness: 1),
          const SizedBox(height: 8),

          /// Scrollable Demo Cards
          Expanded(
            child: Scrollbar(
              child: ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  final card = dataCardsValues[index];
                  return DataCard(
                    index: index,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const EnergyDashboard(),
                        ),
                      );
                    },
                    activeStatus: card['activeStatus'],
                    data1: card['data1'],
                    data2: card['data2'],
                    image: Image.asset(card['image'], width: 24, height: 24),
                    title: card['title'],
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
