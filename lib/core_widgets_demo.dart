import 'package:flutter/material.dart';

class CoreWidgetsDemoApp extends StatelessWidget{
  const CoreWidgetsDemoApp({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Core Widgets Demo',
      home: const CoreWidgetsDemoScreen(),
    );
  }
}

class CoreWidgetsDemoScreen extends StatelessWidget {

  const CoreWidgetsDemoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: const Text('Core Widgets Demo'),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //Headline text
            const Text(
              'Welcome to Flutter UI',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            //Material App
            const Center(
              child: Icon(
                Icons.movie,
                size: 70,
                color: Colors.blue,
              ),
            ),

            const SizedBox(height: 20),

            //network image
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network('https://cdn2.tuoitre.vn/thumb_w/480/471584752817336320/2026/2/23/conan-movie-29-17718256771661715773080.png',
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),

            const SizedBox(height: 24),

            Card(
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: const ListTile(
                leading: Icon(Icons.person),
                title: Text('John Doe'),
                subtitle: Text('Flutter Developer'),
                trailing: Icon(Icons.arrow_forward_ios),
              ),
            ),
          ],
        ),
      ),
    );
  }
}