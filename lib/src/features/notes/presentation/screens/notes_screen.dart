import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class NotesScreen extends ConsumerWidget {
  const NotesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios_new, size: 20),
        title: const Column(
          children: [
            Text(
              'README.md',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            Text(
              'Edited 2m ago',
              style: TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.ios_share)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.check, color: Color(0xFF8B5CF6)),
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Heading with purple accent bar
            Row(
              children: [
                Container(width: 4, height: 32, color: const Color(0xFF8B5CF6)),
                const SizedBox(width: 12),
                const Text(
                  'Introduction',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            const SizedBox(height: 24),

            const Text(
              'This is a clean editor for developers. It supports standard markdown features and focuses on a distraction-free writing experience.',
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Color(0xFFE0E0E0),
              ),
            ),
            const SizedBox(height: 32),

            // Code Block
            Container(
              decoration: BoxDecoration(
                color: const Color(0xFF1E1E2E), // Darker code bg
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Code Header
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'main.dart',
                          style: TextStyle(
                            color: Colors.grey[500],
                            fontFamily: 'monospace',
                          ),
                        ),
                        const Row(
                          children: [
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Color(0xFFFF5F56),
                            ),
                            SizedBox(width: 6),
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Color(0xFFFFBD2E),
                            ),
                            SizedBox(width: 6),
                            CircleAvatar(
                              radius: 5,
                              backgroundColor: Color(0xFF27C93F),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: Colors.white10),
                  // Code Content
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: RichText(
                      text: const TextSpan(
                        style: TextStyle(
                          fontFamily: 'monospace',
                          fontSize: 14,
                          height: 1.5,
                        ),
                        children: [
                          TextSpan(
                            text: 'void ',
                            style: TextStyle(color: Color(0xFFC792EA)),
                          ), // Purple
                          TextSpan(
                            text: 'main',
                            style: TextStyle(color: Color(0xFF82AAFF)),
                          ), // Blue
                          TextSpan(
                            text: '() {\n',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: '  // This prints to the console\n',
                            style: TextStyle(color: Color(0xFF676E95)),
                          ), // Comment
                          TextSpan(
                            text: '  print',
                            style: TextStyle(color: Color(0xFF82AAFF)),
                          ),
                          TextSpan(
                            text: '(',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: "'Hello, World!'",
                            style: TextStyle(color: Color(0xFFC3E88D)),
                          ), // String
                          TextSpan(
                            text: ');\n\n',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: '  final ',
                            style: TextStyle(color: Color(0xFFC792EA)),
                          ),
                          TextSpan(
                            text: 'int ',
                            style: TextStyle(color: Color(0xFFC792EA)),
                          ),
                          TextSpan(
                            text: 'answer = ',
                            style: TextStyle(color: Colors.white),
                          ),
                          TextSpan(
                            text: '42',
                            style: TextStyle(color: Color(0xFFF78C6C)),
                          ), // Number
                          TextSpan(
                            text: ';\n}',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 32),

            const Text(
              'You can easily switch between writing prose and code. The interface adapts to your needs. Continue writing your documentation here...',
              style: TextStyle(
                fontSize: 16,
                height: 1.6,
                color: Color(0xFFE0E0E0),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: const BoxDecoration(
          color: Color(0xFF1E1E1E),
          border: Border(
            top: BorderSide(color: Color.fromARGB(26, 100, 84, 84)),
          ),
        ),
        child: SafeArea(
          child: SizedBox(
            height: 48,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.format_bold, color: Colors.grey),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.format_italic, color: Colors.white),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.code, color: Colors.grey),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.data_object, color: Colors.grey),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.link, color: Colors.grey),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.format_list_bulleted,
                    color: Colors.grey,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.format_quote, color: Colors.grey),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
