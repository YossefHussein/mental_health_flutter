import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final Color color;

  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          // this expand the colum
          // if don't adding expanded the is to be hidden description
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AutoSizeText(
                  title,
                  style: Theme.of(context).textTheme.labelMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    // this for don't make responded screen error
                    Flexible(
                      child: Text(
                        description,
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                    ),
                    const SizedBox(height: 3),
                    // Container(
                    //   padding: const EdgeInsets.all(3),
                    //   decoration: BoxDecoration(
                    //       color: Colors.grey.shade200,
                    //       borderRadius: BorderRadius.circular(50)),
                    //   child: const Icon(Icons.arrow_forward_ios),
                    // ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
