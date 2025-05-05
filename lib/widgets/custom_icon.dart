import 'package:flutter/material.dart';

class CustomIcon extends StatelessWidget {
  const CustomIcon({super.key, required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      width: 45,
      decoration: BoxDecoration(
        color: const Color(0x2EFFFFFF),
        borderRadius: BorderRadius.circular(10),
      ),
      child: IconButton(
        onPressed: () {},
        icon: Icon(icon, size: 25, color: Colors.white),
      ),
    );
  }
}
