import 'package:flutter/material.dart';

class QuickAccess extends StatelessWidget {
  const QuickAccess({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _QuickAccessItem('RELIANCE'),
          const SizedBox(width: 6),
          _QuickAccessItem('ASIANPAINT'),
          const SizedBox(width: 6),
          _QuickAccessItem('AAA002'),
          const SizedBox(width: 6),
          _QuickAccessItem('Lalit'),
        ],
      ),
    );
  }
}

class _QuickAccessItem extends StatelessWidget {
  final String label;
  const _QuickAccessItem(this.label);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: Row(
          children: [
            Text(
              label,
              style: Theme.of(
                context,
              ).textTheme.bodyMedium?.copyWith(fontSize: 15),
            ),
            const SizedBox(width: 10),
            const Icon(Icons.close, color: Color(0xFF6B7280), size: 22),
          ],
        ),
      ),
    );
  }
}
