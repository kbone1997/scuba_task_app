import 'package:flutter/material.dart';
import 'package:scube_task_app/widgets/custom_app_bar.dart';
import 'package:scube_task_app/widgets/energy_chart_widget.dart';

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
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // 1. Top Options: Data View vs Revenue View
              ToggleButtons(
                borderRadius: BorderRadius.circular(10),
                constraints: BoxConstraints(
                  minWidth: (MediaQuery.of(context).size.width - 50) / 2,
                  minHeight: 45,
                ),
                isSelected: [!isRevenueView, isRevenueView],
                onPressed:
                    (index) => setState(() => isRevenueView = index == 1),
                children: [Text("Data View"), Text("Revenue View")],
              ),

              SizedBox(height: 40),

              // 2. Rounded Progress Bar with Text Inside
              Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: 150,
                    height: 150,
                    child: CircularProgressIndicator(
                      value: 0.55, // 55%
                      strokeWidth: 12,
                      backgroundColor: Colors.grey[200],
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                  Text(
                    "55.00\nkwh/sqt",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),

              SizedBox(height: 40),

              // 3. Selection: Today Data vs Custom Data
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: Text("Today Data"),
                    selected: !isCustomData,
                    onSelected: (val) => setState(() => isCustomData = false),
                  ),
                  SizedBox(width: 10),
                  ChoiceChip(
                    label: Text("Custom Data"),
                    selected: isCustomData,
                    onSelected: (val) => setState(() => isCustomData = true),
                  ),
                ],
              ),

              SizedBox(height: 20),

              // 4. Conditional Custom Data UI
              if (isCustomData) ...[
                Row(
                  children: [
                    Expanded(flex: 3, child: _buildDateField("From Date")),
                    SizedBox(width: 10),
                    Expanded(flex: 3, child: _buildDateField("To Date")),
                    SizedBox(width: 10),
                    Expanded(flex: 1, child: _buildSearchField()),
                  ],
                ),
                SizedBox(height: 15),
                // Square Search Bar
              ],
              EnergyChartWidget(),
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
        suffixIcon: Icon(Icons.calendar_today, size: 12),
        border: OutlineInputBorder(),
      ),
    );
  }

  Widget _buildSearchField() {
    return TextField(
      readOnly: true,
      decoration: InputDecoration(
        suffixIcon: Icon(Icons.search, size: 18),
        border: OutlineInputBorder(),
      ),
    );
  }
}
