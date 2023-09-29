import 'package:flutter/material.dart';

class GridItem extends StatelessWidget {
  const GridItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          height: 50,
          width: 50,
          decoration: decoration(context),
        ),
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 12,
              width: 100,
              decoration: decoration(context),
            ),
            const SizedBox(
              height: 5,
            ),
            Container(
              height: 12,
              width: 50,
              decoration: decoration(context),
            ),
          ],
        ),
      ],
    );
  }

  BoxDecoration decoration(BuildContext context) {
    return BoxDecoration(
      borderRadius: BorderRadius.circular(12),
      color: Colors.grey.shade300.withOpacity(0.5),
    );
  }
}
