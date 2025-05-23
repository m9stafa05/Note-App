import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

const Color kModeColor = Color(0xFF393939);
const Color kPrimaryColor = Color.fromARGB(255, 0, 158, 211);
const String kNoteBox = 'note_box';

// Colors List for notes
final List<Color> kColors = const [
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

// Function to format date
String formatFriendlyDate(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = today.subtract(Duration(days: 1));
  final dateToCheck = DateTime(date.year, date.month, date.day);

  String time = DateFormat('h:mm a').format(date);

  if (dateToCheck == today) {
    return 'Today at $time';
  } else if (dateToCheck == yesterday) {
    return 'Yesterday at $time';
  } else if (now.difference(date).inDays < 7) {
    return '${DateFormat('EEEE').format(date)} at $time'; // e.g., Monday at 3:00 PM
  } else {
    return '${DateFormat('MMM d, yyyy').format(date)} at $time'; // e.g., May 20, 2025 at 3:00 PM
  }
}
