import 'package:flutter/material.dart';

import 'package:lab4_prm393/core_widgets_demo.dart';
import 'package:lab4_prm393/input_controls_demo.dart';
import 'package:lab4_prm393/layout_composition_demo.dart';
import 'package:lab4_prm393/scaffold_demo.dart';
import 'package:lab4_prm393/theme_demo.dart';

// Global ValueNotifier for theme mode
final ValueNotifier<ThemeMode> themeNotifier = ValueNotifier(ThemeMode.light);

void main() {
  runApp(const MyApp());
}

// Root app
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
      valueListenable: themeNotifier,
      builder: (_, ThemeMode currentMode, __) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter UI Lab',
          
          // Theme Data Customization (Exercise 4)
          theme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.blue,
            brightness: Brightness.light,
          ),
          darkTheme: ThemeData(
            useMaterial3: true,
            colorSchemeSeed: Colors.blue,
            brightness: Brightness.dark,
          ),
          themeMode: currentMode,

          // Initial screen
          home: const HomeScreen(),

          // Named routes
          routes: {
            '/core': (context) => const CoreWidgetsDemoScreen(),
            '/input': (context) => const InputControlsDemo(),
            '/layout': (context) => const LayoutCompositionScreen(),
            '/scaffold': (context) => const ScaffoldDemoScreen(),
            '/theme': (context) => const ThemeDemoScreen(),
          },
        );
      },
    );
  }
}

// Home menu screen
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter UI Exercises'),
        actions: [
          IconButton(
            icon: Icon(themeNotifier.value == ThemeMode.light 
                ? Icons.dark_mode 
                : Icons.light_mode),
            onPressed: () {
              themeNotifier.value = themeNotifier.value == ThemeMode.light 
                  ? ThemeMode.dark 
                  : ThemeMode.light;
            },
          )
        ],
      ),

      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Exercise 1
          Card(
            child: ListTile(
              leading: const Icon(Icons.widgets),
              title: const Text('Exercise 1 - Core Widgets'),
              subtitle: const Text('Text, Image, Icon, Card, ListTile'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => Navigator.pushNamed(context, '/core'),
            ),
          ),
          // Exercise 2
          Card(
            child: ListTile(
              leading: const Icon(Icons.tune),
              title: const Text('Exercise 2 - Input Widgets'),
              subtitle: const Text('Slider, Switch, Radio, DatePicker'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => Navigator.pushNamed(context, '/input'),
            ),
          ),
          // Exercise 3
          Card(
            child: ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Exercise 3 - Layout Composition'),
              subtitle: const Text('Column, Row, Padding, ListView'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => Navigator.pushNamed(context, '/layout'),
            ),
          ),
          // Exercise 4
          Card(
            child: ListTile(
              leading: const Icon(Icons.phone_android),
              title: const Text('Exercise 4 - Scaffold Structure'),
              subtitle: const Text('AppBar, Drawer, FAB, BottomNav'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => Navigator.pushNamed(context, '/scaffold'),
            ),
          ),
          // Exercise 5
          Card(
            child: ListTile(
              leading: const Icon(Icons.color_lens),
              title: const Text('Exercise 5 - ThemeData'),
              subtitle: const Text('ThemeData + UI Fixes'),
              trailing: const Icon(Icons.arrow_forward),
              onTap: () => Navigator.pushNamed(context, '/theme'),
            ),
          ),
        ],
      ),
    );
  }
}
