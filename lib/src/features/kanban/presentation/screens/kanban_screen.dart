import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class KanbanScreen extends ConsumerWidget {
  const KanbanScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFD700), // Gold/Orangeish
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: const Icon(
                      Icons.dashboard_customize,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Sprint 24 Board',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          'Project Alpha',
                          style: TextStyle(
                            color: Colors.grey[400],
                            fontSize: 13,
                          ),
                        ),
                      ],
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                    style: IconButton.styleFrom(
                      backgroundColor: Colors.white10,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // Tabs
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                children: [
                  _buildTab('To Do', 5, true),
                  _buildTab('In Progress', 2, false),
                  _buildTab('Done', 1, false),
                ],
              ),
            ),
            const SizedBox(height: 20),

            // Column Header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                children: [
                  const Icon(Icons.circle, size: 12, color: Colors.grey),
                  const SizedBox(width: 8),
                  const Text(
                    'To Do',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  const Spacer(),
                  const Icon(Icons.more_horiz, color: Colors.grey),
                ],
              ),
            ),
            const SizedBox(height: 16),

            // Task List
            Expanded(
              child: ListView(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                children: [
                  const KanbanCard(
                    tag: 'Feature',
                    tagColor: Color(0xFF8B5CF6),
                    title: 'Implement Auth Flow for new users',
                    date: 'Today',
                    avatarUrl: 'https://i.pravatar.cc/150?img=60',
                  ),
                  const KanbanCard(
                    tag: 'Bug',
                    tagColor: Colors.redAccent,
                    title: 'Fix login crash on iOS 17',
                    priority: 'High Priority',
                    priorityColor: Colors.redAccent,
                    initials: 'JD',
                    initialsColor: Colors.blue,
                  ),
                  const KanbanCard(
                    tag: 'Chore',
                    tagColor: Colors.grey,
                    title: 'Clean up legacy assets',
                    date: 'No Due Date',
                  ),

                  const SizedBox(height: 16),
                  // Add Task Button
                  Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.white10,
                        style: BorderStyle.solid,
                      ), // Dashed border simulation needs custom painter, solid is fine for MVP
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.transparent,
                    ),
                    child: const Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.add, color: Colors.grey),
                          SizedBox(width: 8),
                          Text(
                            'Add Task',
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: const Color(0xFF8B5CF6),
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }

  Widget _buildTab(String label, int count, bool isSelected) {
    return Container(
      margin: const EdgeInsets.only(right: 24),
      padding: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        border: isSelected
            ? const Border(
                bottom: BorderSide(color: Color(0xFF8B5CF6), width: 2),
              )
            : null,
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
            decoration: BoxDecoration(
              color: isSelected
                  ? const Color(0xFF8B5CF6).withValues(alpha: 0.2)
                  : Colors.white10,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              count.toString(),
              style: TextStyle(
                fontSize: 12,
                color: isSelected ? const Color(0xFF8B5CF6) : Colors.grey,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class KanbanCard extends StatelessWidget {
  final String tag;
  final Color tagColor;
  final String title;
  final String? date;
  final String? priority;
  final Color? priorityColor;
  final String? avatarUrl;
  final String? initials;
  final Color? initialsColor;

  const KanbanCard({
    super.key,
    required this.tag,
    required this.tagColor,
    required this.title,
    this.date,
    this.priority,
    this.priorityColor,
    this.avatarUrl,
    this.initials,
    this.initialsColor,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: const Color(0xFF252525), // Slightly lighter than background
        borderRadius: BorderRadius.circular(24),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 4,
                ),
                decoration: BoxDecoration(
                  color: tagColor.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  tag,
                  style: TextStyle(
                    color: tagColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const Icon(Icons.more_vert, color: Colors.grey, size: 20),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            title,
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (priority != null)
                Row(
                  children: [
                    Icon(Icons.flag, size: 16, color: priorityColor),
                    const SizedBox(width: 4),
                    Text(
                      priority!,
                      style: TextStyle(color: priorityColor, fontSize: 13),
                    ),
                  ],
                )
              else
                Row(
                  children: [
                    const Icon(
                      Icons.calendar_today,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      date ?? '',
                      style: const TextStyle(color: Colors.grey, fontSize: 13),
                    ),
                  ],
                ),

              if (avatarUrl != null)
                CircleAvatar(
                  backgroundImage: NetworkImage(avatarUrl!),
                  radius: 12,
                )
              else if (initials != null)
                CircleAvatar(
                  radius: 12,
                  backgroundColor: initialsColor,
                  child: Text(
                    initials!,
                    style: const TextStyle(fontSize: 10, color: Colors.white),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
