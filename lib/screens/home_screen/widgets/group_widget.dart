import 'package:flutter/material.dart';
import 'package:safenow_demo/utils/constants/theme_constants.dart';

class GroupWidget extends StatelessWidget {
  const GroupWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white,
                border: Border.all(
                    width: 3,
                    color: Colors.grey.shade300.withOpacity(0.8),
                    style: BorderStyle.solid),
              ),
              alignment: Alignment.center,
              child: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey.shade300.withOpacity(0.8),
                ),
              ),
            ),
            Positioned(
              right: 5,
              bottom: 5,
              child: Container(
                height: 20,
                width: 20,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: const Color.fromARGB(255, 19, 62, 173),
                ),
                alignment: Alignment.center,
                child: const Icon(
                  Icons.add,
                  color: Colors.white,
                  size: 20,
                  weight: 50,
                ),
              ),
            )
          ],
        ),
        const Text(
          "New group",
          style: ThemeConstants.drawerSmallTextLight,
        ),
      ],
    );
  }
}
