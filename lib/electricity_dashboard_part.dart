import 'package:flutter/material.dart';
import 'package:scube_task_app/widgets/custom_app_bar.dart';
import 'package:scube_task_app/widgets/energy_chart_widget.dart';
import 'package:scube_task_app/widgets/expandable_data_card.dart';
import 'package:scube_task_app/widgets/radio_button.dart';
import 'package:scube_task_app/widgets/semi_circle_gauge.dart';

class EnergyDashboard extends StatefulWidget {
  const EnergyDashboard({super.key});

  @override
  EnergyDashboardState createState() => EnergyDashboardState();
}

class EnergyDashboardState extends State<EnergyDashboard> {
  bool isRevenueView = false;
  bool isCustomData = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onBackPressed: () {
          // Navigate back to login
          Navigator.pop(context);
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
          padding: EdgeInsets.only(top: 10),
          child: Stack(
            children: [
              Positioned(
                top: 40,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                    border: Border.all(color: Colors.blueGrey),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  children: [
                    // 1. Top Options: Data View vs Revenue View
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: 48,
                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(width: 1, color: Colors.blueGrey),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildCustomRadioButton(
                            size: 16,
                            label: 'Data View',
                            isSelected: !isRevenueView,
                            onTap: () {
                              setState(() {
                                isRevenueView = false;
                              });
                            },
                          ),
                          buildCustomRadioButton(
                            size: 16,
                            label: 'Revenue View',
                            isSelected: isRevenueView,
                            onTap: () {
                              setState(() {
                                isRevenueView = true;
                              });
                            },
                          ),
                        ],
                      ),
                    ),

                    SizedBox(height: 20),

                    // 2. Rounded Progress Bar with Text Inside
                    if (isRevenueView) ...[
                      GaugeWidget(value: 87777.00, unit: 'tk'),
                    ] else ...[
                      GaugeWidget(value: 57.00, unit: 'kWh/Sqft'),
                    ],

                    SizedBox(height: 60),

                    if (isRevenueView) ...[
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: Stack(
                          alignment: Alignment.topCenter,
                          children: [ExpandableDataCard()],
                        ),
                      ),
                    ] else ...[
                      // 3. Selection: Today Data vs Custom Data
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          buildCustomRadioButton(
                            size: 14,
                            label: 'Today Data',
                            isSelected: !isCustomData,
                            onTap: () {
                              setState(() {
                                isCustomData = false;
                              });
                            },
                          ),
                          buildCustomRadioButton(
                            size: 14,
                            isSelected: isCustomData,
                            label: 'Custom Date Data',
                            onTap: () {
                              setState(() {
                                isCustomData = true;
                              });
                            },
                          ),
                        ],
                      ),

                      SizedBox(height: 20),

                      // 4. Conditional Custom Data UI
                      if (isCustomData) ...[
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 3,
                                child: _buildDateField("From Date"),
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                flex: 3,
                                child: _buildDateField("To Date"),
                              ),
                              SizedBox(width: 10),
                              Expanded(flex: 1, child: _buildSearchField()),
                            ],
                          ),
                        ),
                        SizedBox(height: 15),
                        // Square Search Bar
                        EnergyChartWidget(),
                      ],
                      SizedBox(height: 15),
                      EnergyChartWidget(),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDateField(String label) {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        labelText: label,
        labelStyle: TextStyle(fontSize: 12),
        suffixIcon: Icon(Icons.calendar_today_outlined, size: 24),
        border: OutlineInputBorder(),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12, // ⬅ increase/decrease height
          horizontal: 12,
        ),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search, size: 28, color: Colors.blue),
        border: OutlineInputBorder(),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blue, width: 1),
        ),
        contentPadding: const EdgeInsets.symmetric(
          vertical: 12, // ⬅ increase/decrease height
          horizontal: 12,
        ),
      ),
    );
  }
}
