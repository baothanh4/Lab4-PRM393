import 'package:flutter/material.dart';

class LayoutCompositionApp extends StatelessWidget {
  const LayoutCompositionApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const LayoutCompositionScreen(),
    );
  }
}

class LayoutCompositionScreen extends StatelessWidget {
  const LayoutCompositionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Layout Composition'),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [
            // Profile section using Row
            Row(
              children: [
                const CircleAvatar(
                  radius: 35,
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/200',
                  ),
                ),

                const SizedBox(width: 16),

                // User information using Column
                const Column(
                  crossAxisAlignment:
                  CrossAxisAlignment.start,
                  children: [
                    Text(
                      'John Doe',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Flutter Developer'),
                  ],
                ),
              ],
            ),

            const SizedBox(height: 20),

            // Expanded ListView
            Expanded(
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Card(
                    child: ListTile(
                      leading: const Icon(Icons.task),
                      title: Text('Task ${index + 1}'),
                      subtitle: const Text(
                        'This is a sample task item.',
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}