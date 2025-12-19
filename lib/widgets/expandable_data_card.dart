import 'package:flutter/material.dart';

class ExpandableDataCard extends StatefulWidget {
  const ExpandableDataCard({super.key});

  @override
  State<ExpandableDataCard> createState() => _ExpandableDataCardState();
}

class _ExpandableDataCardState extends State<ExpandableDataCard> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // The Main Trigger Header
        GestureDetector(
          onTap: () => setState(() => isExpanded = !isExpanded),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueGrey),
              borderRadius: BorderRadius.circular(8),
            ),
            width: MediaQuery.of(context).size.width * 0.8,
            height: 40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  const Icon(Icons.bar_chart, size: 20),
                  const SizedBox(width: 8),
                  const Text(
                    'Data & Cost info',
                    style: TextStyle(fontWeight: FontWeight.w500),
                  ),
                  const Spacer(),
                  // Circular Icon Container
                  Container(
                    padding: const EdgeInsets.all(2),
                    decoration: const BoxDecoration(
                      color: Colors.blue,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isExpanded
                          ? Icons.keyboard_double_arrow_down
                          : Icons.keyboard_double_arrow_up,
                      size: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),

        // The Expandable Section
        if (isExpanded)
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            margin: const EdgeInsets.only(top: 8),
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[50],
              border: Border.all(color: Colors.blueGrey.withOpacity(0.5)),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                _buildDataRow("Data 1", "9832948723"),
                _buildDataRow("Cost 1", "983948"),
                const Divider(),
                _buildDataRow("Data 2", "938938493"),
                _buildDataRow("Cost 2", "9039449"),
              ],
            ),
          ),
      ],
    );
  }

  Widget _buildDataRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$label :", style: const TextStyle(color: Colors.black87)),
          Text(value, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
