import 'package:flutter/material.dart';

class SourceLoadToggle extends StatefulWidget {
  const SourceLoadToggle({super.key});

  @override
  State<SourceLoadToggle> createState() => _SourceLoadToggleState();
}

class _SourceLoadToggleState extends State<SourceLoadToggle> {
  int selectedIndex = 0; // 0 = Source, 1 = Load

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: MediaQuery.of(context).size.width * 0.7,
        decoration: BoxDecoration(
          color: Colors.grey.shade200,
          borderRadius: BorderRadius.circular(999),
        ),
        child: Row(children: [_buildItem('Source', 0), _buildItem('Load', 1)]),
      ),
    );
  }

  Widget _buildItem(String title, int index) {
    final bool isSelected = selectedIndex == index;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() => selectedIndex = index);
        },
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.blue : Colors.transparent,
            borderRadius: BorderRadius.circular(999),
          ),
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: isSelected ? Colors.white : Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}
