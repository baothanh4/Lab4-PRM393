import 'package:flutter/material.dart';

class InputControlsApp extends StatelessWidget{
  const InputControlsApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: InputControlsDemo(),
    );
  }
}

class InputControlsDemo extends StatefulWidget{
  const InputControlsDemo({super.key});

  @override
  State<InputControlsDemo> createState() =>
      _InputControlsDemoState();
}

class _InputControlsDemoState extends State<InputControlsDemo>{
  double sliderValue = 50;

  bool isDarkWeb = false;

  String selectedOption = 'Option 1';

  DateTime? selectedDate;

  Future<void> pickDate() async{
    final picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2020),
        lastDate: DateTime(2030),
    );

    if(picked != null){
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Input Widgets Demo'),
      ),

      body: Padding(
          padding: const EdgeInsets.all(16),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //slider
              const Text(
                'Slider',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Slider(
                  value: sliderValue,
                  min: 0,
                  max: 100,
                  onChanged: (value){
                    setState(() {
                      sliderValue = value;
                    });
                  },
              ),

              Text('Value :${sliderValue.toStringAsFixed(0)}'),

              const SizedBox(height: 20),

              SwitchListTile(
                  title: const Text('Enable Dark Mode'),
                  value: isDarkWeb,
                onChanged: (value){
                    setState(() {
                      isDarkWeb = value;
                    });
                },
              ),

              Text(isDarkWeb? 'Dark Mode ON' : 'Dark Mode OFF'),

              const SizedBox(height: 20),

              RadioListTile<String>(
                title: const Text('Option 1'),
                value: 'Option 1',
                groupValue: selectedOption,
                onChanged: (value){
                  setState(() {
                    selectedOption = value!;
                  });
                },
              ),

              Text('Selected: $selectedOption'),

              const SizedBox(height: 20),

              ElevatedButton(
                  onPressed: pickDate,
                  child: const Text('Select Date'),
              ),

              const SizedBox(height: 10),

              Text(
                selectedDate == null
                    ? 'No date selected'
                    : 'Selected Date: '
                          '${selectedDate!.day}/'
                          '${selectedDate!.month}/'
                          '${selectedDate!.year}',
              ),
            ],
          ),
      ),
    );
  }
}