import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    required this.isSelected,
    required this.color,
  });
  final bool isSelected;
  final Color color;
  @override
  Widget build(BuildContext context) {
    return isSelected
        ? CircleAvatar(
          backgroundColor: const Color(0xFFF0F0F0),
          radius: 32,
          child: CircleAvatar(backgroundColor: color, radius: 28),
        )
        : CircleAvatar(backgroundColor: color, radius: 32);
  }
}

class ColorListView extends StatefulWidget {
  const ColorListView({super.key});

  @override
  State<ColorListView> createState() => _ColorListViewState();
}

class _ColorListViewState extends State<ColorListView> {
  int currentIndex = 0;
  final List<Color> colors = const [
    Color(0xFFE74C3C),
    Color(0xFF1ABC9C),
    Color(0xFF2ECC71),
    Color(0xFF3498DB),
    Color(0xFF9B59B6),
    Color(0xFFF1C40F),
    Color(0xFFE67E22),
    Color(0xFF4A90D5),
    Color(0xFFE1E6E7),
    Color(0xFF16A085),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 32 * 2,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: GestureDetector(
              onTap: () {
                setState(() {
                  currentIndex = index;
                });
              },
              child: ColorItem(
                isSelected: currentIndex == index,
                color: colors[index],
              ),
            ),
          );
        },
      ),
    );
  }
}
