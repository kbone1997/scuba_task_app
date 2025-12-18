import 'package:flutter/material.dart';
import 'package:scube_task_app/widgets/data_widget.dart';
import 'package:scube_task_app/widgets/power_circle_widget.dart';
import 'package:scube_task_app/widgets/source_load_widget.dart';
import 'package:scube_task_app/electricity_dashboard_part.dart';

class ElectricityWidget extends StatefulWidget {
  const ElectricityWidget({super.key});

  @override
  State<ElectricityWidget> createState() => _ElectricityWidgetState();
}

class _ElectricityWidgetState extends State<ElectricityWidget> {
  late final ScrollController _scrollController;

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
    {
      "activeStatus": true,
      "data1": 1850.30,
      "data2": 1200.75,
      "image": "assets/images/battery.png",
      "title": "Battery Status",
    },
    {
      "activeStatus": false,
      "data1": 950.45,
      "data2": 750.20,
      "image": "assets/images/power.png",
      "title": "Grid Power",
    },
    {
      "activeStatus": true,
      "data1": 3200.80,
      "data2": 2800.60,
      "image": "assets/images/solar-cell.png",
      "title": "Solar Output",
    },
    {
      "activeStatus": true,
      "data1": 1450.25,
      "data2": 1100.90,
      "image": "assets/images/battery.png",
      "title": "Energy Storage",
    },
  ];

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height * 0.65;

    return Container(
      height: height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey, width: 1),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// Top Tabs
          Row(
            children: [
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(8),
                      topRight: Radius.circular(8),
                    ),
                  ),
                  child: const Text(
                    'Summary',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Expanded(
                child: Text(
                  'SLD',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                ),
              ),
              const Expanded(
                child: Text(
                  'Data',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 16, color: Colors.blueGrey),
                ),
              ),
            ],
          ),

          const Divider(thickness: 1, height: 1),

          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
              child: Column(
                children: [
                  const Center(
                    child: Text(
                      'Electricity',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const Divider(thickness: 2),

                  PowerDisplayCircle(),
                  SourceLoadToggle(),

                  const Divider(thickness: 3),
                  const SizedBox(height: 8),

                  /// Scrollable Cards with Custom Gradient Scrollbar
                  Expanded(
                    child: Stack(
                      children: [
                        // Main ListView
                        Positioned.fill(
                          child: ListView.builder(
                            controller: _scrollController,
                            padding: const EdgeInsets.only(right: 20),
                            itemCount: dataCardsValues.length,
                            itemBuilder: (context, index) {
                              final card = dataCardsValues[index];
                              return DataCard(
                                index: index,
                                activeStatus: card['activeStatus'],
                                data1: card['data1'],
                                data2: card['data2'],
                                image: Image.asset(
                                  card['image'],
                                  width: 24,
                                  height: 24,
                                ),
                                title: card['title'],
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder:
                                          (context) => const EnergyDashboard(),
                                    ),
                                  );
                                },
                              );
                            },
                          ),
                        ),

                        // Custom Gradient Scrollbar
                        Positioned(
                          right: 0,
                          top: 0,
                          bottom: 0,
                          width: 8,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.grey.shade400,
                              borderRadius: BorderRadius.circular(6),
                              border: Border.all(
                                color: Colors.grey.shade500,
                                width: 0.5,
                              ),
                            ),
                            child: LayoutBuilder(
                              builder: (context, constraints) {
                                return AnimatedBuilder(
                                  animation: _scrollController,
                                  builder: (context, child) {
                                    // Check if scroll controller has clients and position is attached
                                    if (!_scrollController.hasClients ||
                                        !_scrollController
                                            .position
                                            .hasContentDimensions) {
                                      return const SizedBox.shrink();
                                    }

                                    try {
                                      final position =
                                          _scrollController.position;
                                      final maxScrollExtent =
                                          position.maxScrollExtent;
                                      final currentOffset = position.pixels;
                                      final viewportHeight =
                                          position.viewportDimension;
                                      final trackHeight = constraints.maxHeight;

                                      // If there's no scrollable content, don't show scrollbar
                                      if (maxScrollExtent <= 0 ||
                                          trackHeight <= 0) {
                                        return const SizedBox.shrink();
                                      }

                                      // Calculate thumb size (fixed bigger size)
                                      final thumbHeight = 60.0;

                                      // Calculate thumb position
                                      final scrollRatio =
                                          currentOffset / maxScrollExtent;
                                      final maxThumbOffset =
                                          trackHeight - thumbHeight;
                                      final thumbOffset = (scrollRatio *
                                              maxThumbOffset)
                                          .clamp(0.0, maxThumbOffset);

                                      return Align(
                                        alignment: Alignment.topCenter,
                                        child: Container(
                                          margin: EdgeInsets.only(
                                            top: thumbOffset,
                                            left: 2,
                                            right: 2,
                                          ),
                                          width: 10,
                                          height: thumbHeight,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(
                                              4,
                                            ),
                                            gradient: const LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Colors.blue,
                                                Colors.blueAccent,
                                                Colors.deepPurple,
                                              ],
                                            ),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.black.withOpacity(
                                                  0.2,
                                                ),
                                                blurRadius: 2,
                                                offset: const Offset(0, 1),
                                              ),
                                            ],
                                          ),
                                        ),
                                      );
                                    } catch (e) {
                                      // Return empty widget if any error occurs
                                      return const SizedBox.shrink();
                                    }
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
