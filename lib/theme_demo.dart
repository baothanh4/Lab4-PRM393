import 'package:flutter/material.dart';
import 'package:lab4_prm393/main.dart'; // To access themeNotifier

class ThemeDemoScreen extends StatefulWidget {
  const ThemeDemoScreen({super.key});

  @override
  State<ThemeDemoScreen> createState() => _ThemeDemoScreenState();
}

class _ThemeDemoScreenState extends State<ThemeDemoScreen> {
  DateTime? _selectedDate;
  int _counter = 0;

  // Fix: DatePicker build context errors by calling from valid widget tree.
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate ?? DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != _selectedDate) {
      // Fix: state update issue by adding setState().
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Exercise 5: UI Fixes & Theme'),
        actions: [
          IconButton(
            icon: Icon(themeNotifier.value == ThemeMode.light 
                ? Icons.dark_mode 
                : Icons.light_mode),
            onPressed: () {
              themeNotifier.value = themeNotifier.value == ThemeMode.light 
                  ? ThemeMode.dark 
                  : ThemeMode.light;
              setState(() {}); // Refresh local UI
            },
          ),
        ],
      ),
      // We use a Column here to demonstrate Expanded. 
      // To satisfy "Fix overflow using SingleChildScrollView", we wrap the column parts that might overflow.
      body: Column(
        children: [
          // Part 1: Top section that might overflow if too many elements are added
          // Fix: overflow in small screens using SingleChildScrollView.
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Theme & UI Fixes Demo',
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  const Text('This screen demonstrates the fixes required in Exercise 5.'),
                  const Divider(),
                  
                  const Text('State Update (setState):'),
                  Row(
                    children: [
                      Text('Counter: $_counter'),
                      const SizedBox(width: 20),
                      ElevatedButton(
                        onPressed: () {
                          setState(() { _counter++; });
                        },
                        child: const Text('Increment'),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 20),
                  const Text('DatePicker Fix:'),
                  ElevatedButton(
                    onPressed: () => _selectDate(context),
                    child: const Text('Open Date Picker'),
                  ),
                  if (_selectedDate != null)
                    Text('Selected: ${_selectedDate!.toLocal()}'.split(' ')[0]),
                    
                  const SizedBox(height: 20),
                  const Text('Overflow Protection Demo:'),
                  Container(
                    padding: const EdgeInsets.all(10),
                    color: Colors.blue.withOpacity(0.1),
                    child: const Text(
                      'The SingleChildScrollView prevents overflow when content exceeds the available height of this section.',
                    ),
                  ),
                ],
              ),
            ),
          ),
          
          const Divider(thickness: 2),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'ListView inside Column (Fixed with Expanded):',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          
          // Fix: ListView inside Column using Expanded.
          // This allows the ListView to take up the remaining space without causing a layout error.
          Expanded(
            flex: 1,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.list),
                title: Text('List Item #$index'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
