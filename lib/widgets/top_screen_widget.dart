import 'package:flutter/material.dart';

class TopScreenWidget extends StatelessWidget {
  const TopScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.red.withOpacity(.7),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomLeft: Radius.circular(20),
                topRight: Radius.circular(40),
              )),
          child: Padding(
            padding: const EdgeInsets.only(
                left: 8.0, right: 20, top: 10, bottom: 10),
            child: Row(
              children: const [
                Icon(
                  Icons.location_on_outlined,
                  color: Colors.white,
                ),
                Text(
                  "Momen St",
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        Container(
          width: 50,
          height: 50,
          decoration: BoxDecoration(
              shape: BoxShape.circle, border: Border.all(color: Colors.grey)),
        ),
      ],
    );
  }
}
