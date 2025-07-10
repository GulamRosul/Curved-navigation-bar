import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(
    const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TimeDateSelector(),
    ),
  );
}

class TimeDateSelector extends StatefulWidget {
  const TimeDateSelector({super.key});

  @override
  State<TimeDateSelector> createState() => _TimeDateSelectorState();
}

class _TimeDateSelectorState extends State<TimeDateSelector> {
  String displayText = '';
  int selectedIndex = -1;

  Future<void> showTime() async {
    final TimeOfDay? pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (pickedTime != null) {
      final now = DateTime.now();
      final formattedTime = DateFormat('hh:mm a').format(
        DateTime(
          now.year,
          now.month,
          now.day,
          pickedTime.hour,
          pickedTime.minute,
        ),
      );
      setState(() {
        displayText = 'Time: $formattedTime';
        selectedIndex = 0;
      });
    }
  }

  Future<void> showDate() async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      setState(() {
        displayText = 'Date: $formattedDate';
        selectedIndex = 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Time & Date Selector'),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              displayText,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: showTime,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedIndex == 0
                        ? Colors.teal
                        : Colors.grey,
                  ),
                  child: const Text('Show Time'),
                ),
                ElevatedButton(
                  onPressed: showDate,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selectedIndex == 1
                        ? Colors.teal
                        : Colors.grey,
                  ),
                  child: const Text('Show Date'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
