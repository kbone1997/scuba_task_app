import 'package:flutter/material.dart';

class EnergyChartWidget extends StatelessWidget {
  const EnergyChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1, // Outer container remains square
      child: Container(
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: Colors.blueGrey),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 80,
              child: Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Energy Chart",
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Text(
                      "5.53 kWh",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView(
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  _buildDataCard("Data A", Colors.blue, "23424", "50%", "3425"),
                  const SizedBox(height: 8),
                  _buildDataCard(
                    "Data B",
                    Colors.green,
                    "12100",
                    "25%",
                    "1500",
                  ),
                  const SizedBox(height: 8),
                  _buildDataCard("Data C", Colors.orange, "8500", "15%", "900"),
                  const SizedBox(height: 8),
                  _buildDataCard("Data D", Colors.red, "4800", "10%", "500"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDataCard(
    String title,
    Color color,
    String value,
    String percent,
    String cost,
  ) {
    return Container(
      height: 55, // Fixed height for rectangular look
      padding: const EdgeInsets.only(left: 12, right: 12),
      decoration: BoxDecoration(
        color: Colors.grey[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueGrey),
      ),
      child: Row(
        children: [
          // Left Section: Dot above Text
          SizedBox(
            width: 50,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    color: color,
                    shape: BoxShape.circle,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  title, // Shows "A", "B", etc.
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Vertical Line
          VerticalDivider(
            color: Colors.grey.shade400,
            thickness: 1,
            width: 20,
            indent: 5,
            endIndent: 5,
          ),

          // Right Section: Two rows of data
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Row 1: Data
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Data   :  ",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    Text(
                      "$value ($percent)",
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                // Row 2: Cost
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text(
                      "Cost   :  ",
                      style: TextStyle(color: Colors.black54, fontSize: 14),
                    ),
                    Text(
                      '$cost ৳',
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
