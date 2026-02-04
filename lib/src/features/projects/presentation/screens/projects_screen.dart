import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

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

class ProjectCard extends StatelessWidget {
  final String title;
  final String updatedAt;
  final double progress;
  final String status;
  final String? version;
  final Color color;
  final Color? statusColor;
  final IconData icon;

  const ProjectCard({
    super.key,
    required this.title,
    required this.updatedAt,
    required this.progress,
    required this.status,
    this.version,
    required this.color,
    this.statusColor,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: Colors.white.withValues(alpha: 0.05)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Icon Box
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: color),
          ),
          const SizedBox(width: 16),

          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Last updated $updatedAt',
                  style: TextStyle(color: Colors.grey[400], fontSize: 13),
                ),
                const SizedBox(height: 12),

                // Tags
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: (statusColor ?? color).withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                          color: (statusColor ?? color).withValues(alpha: 0.2),
                        ),
                      ),
                      child: Text(
                        status,
                        style: TextStyle(
                          color: statusColor ?? color,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    if (version != null) ...[
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white.withValues(alpha: 0.05),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          version!,
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ],
                ),

                const SizedBox(height: 16),
                // Avatars
                SizedBox(
                  height: 32,
                  child: Stack(
                    children: [
                      for (int i = 0; i < 3; i++)
                        Positioned(
                          left: i * 20.0,
                          child: CircleAvatar(
                            radius: 14,
                            backgroundColor: const Color(0xFF1E1E1E),
                            child: CircleAvatar(
                              radius: 12,
                              backgroundImage: NetworkImage(
                                'https://i.pravatar.cc/150?img=${i + 20}',
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),

          // Progress
          Column(
            children: [
              CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 5.0,
                percent: progress,
                center: Text(
                  "${(progress * 100).toInt()}%",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
                progressColor: color,
                backgroundColor: color.withValues(alpha: 0.1),
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
