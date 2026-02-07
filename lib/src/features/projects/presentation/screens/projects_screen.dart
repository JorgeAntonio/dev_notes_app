import 'package:dev_notes_app/src/features/projects/presentation/widgets/project_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ProjectsScreen extends ConsumerWidget {
  const ProjectsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.menu),
                      ),
                      const SizedBox(width: 8),
                      const Text(
                        'Dashboard',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundImage: NetworkImage(
                      'https://i.pravatar.cc/150?img=11',
                    ), // Placeholder
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Search
              TextField(
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  hintText: 'Search repositories...',
                  suffixIcon: const Icon(Icons.tune),
                  filled: true,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 32),

              // Active Projects Header
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'ACTIVE PROJECTS',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      'View All',
                      style: TextStyle(color: Color(0xFF8B5CF6)),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),

              // Project List
              const ProjectCard(
                title: 'Analytics Dashboard',
                updatedAt: '2h ago',
                progress: 0.75,
                status: 'In Development',
                version: 'v2.0.1',
                color: Color(0xFF8B5CF6),
                icon: Icons.bar_chart,
              ),
              const SizedBox(height: 16),
              const ProjectCard(
                title: 'Legacy Migration',
                updatedAt: '1d ago',
                progress: 0.30,
                status: 'On Hold',
                statusColor: Colors.orange,
                color: Colors.orange,
                icon: Icons.warning_amber_rounded,
              ),
              const SizedBox(height: 16),
              const ProjectCard(
                title: 'Mobile App MVP',
                updatedAt: '5h ago',
                progress: 0.10,
                status: 'Planning',
                statusColor: Colors.blue,
                color: Colors.blue,
                icon: Icons.smartphone,
              ),
              const SizedBox(height: 16),
              const ProjectCard(
                title: 'Website Redesign',
                updatedAt: 'Deployed 3d ago',
                progress: 1.0,
                status: 'Live',
                statusColor: Colors.green,
                color: Colors.green,
                icon: Icons.layers,
              ),
              const SizedBox(height: 80), // Bottom padding for FAB
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF8B5CF6),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}
