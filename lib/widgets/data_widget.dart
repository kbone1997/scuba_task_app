import 'package:flutter/material.dart';

class DataCard extends StatelessWidget {
  final VoidCallback onTap;
  final Image image;
  final String title;
  final bool activeStatus;
  final double data1;
  final double data2;
  final int index;

  const DataCard({
    super.key,
    required this.index,
    required this.onTap,
    required this.activeStatus,
    required this.data1,
    required this.data2,
    required this.image,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: index == 0 ? onTap : () {},
      child: Container(
        height: 76,
        margin: const EdgeInsets.only(bottom: 8),
        padding: const EdgeInsets.symmetric(horizontal: 12),
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 192, 227, 255),
          borderRadius: BorderRadius.circular(6),
          border: Border.all(color: Colors.blueGrey.shade300, width: 1),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(padding: EdgeInsets.fromLTRB(4, 12, 12, 12), child: image),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        shape: BoxShape.rectangle,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      title,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    SizedBox(width: 10),
                    Text(
                      activeStatus ? '(Active)' : '(Inactive)',
                      style: TextStyle(
                        fontSize: 12,
                        color: activeStatus ? Colors.blue : Colors.red,
                      ),
                    ),
                  ],
                ),
                if (index == 3) ...[
                  Text('Live Power   :   $data1'),
                  Text('Total Energy :   $data2'),
                ] else ...[
                  Text('Data 1   :   $data1'),
                  Text('Data 2   :   $data2'),
                ],
              ],
            ),
            const Spacer(),
            Icon(Icons.arrow_forward_ios_sharp),
          ],
        ),
      ),
    );
  }
}
