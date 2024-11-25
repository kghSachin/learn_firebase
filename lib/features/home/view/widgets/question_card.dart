import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class QuestionCard extends ConsumerWidget {
  final String questionText;
  final List<String> options;
  final int? selectedOptionIndex;
  final Function(int?)? onOptionSelected;
  const QuestionCard({
    super.key,
    required this.questionText,
    required this.options,
    required this.selectedOptionIndex,
    required this.onOptionSelected,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.black.withOpacity(0.1)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            offset: const Offset(0, 4),
            blurRadius: 12,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(0, 8),
            blurRadius: 16,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              border: Border(
                bottom: BorderSide(
                  color: Colors.grey.withOpacity(0.2),
                  width: 1,
                ),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.blue.shade400,
                            Colors.blue.shade600,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.blue.withOpacity(0.3),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: const Text(
                        "Question 1",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Container(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(0.1),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(
                            Icons.timer_outlined,
                            size: 16,
                            color: Colors.green.shade700,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            "30 sec",
                            style: TextStyle(
                              color: Colors.green.shade700,
                              fontWeight: FontWeight.w600,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  questionText,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                        height: 1.4,
                        letterSpacing: 0.2,
                      ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 16), // Reduced from 20
          ...List.generate(4, (index) {
            return Container(
              margin: const EdgeInsets.only(bottom: 8), // Reduced from 12
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: index == selectedOptionIndex
                      ? Colors.blue.withOpacity(0.3)
                      : Colors.grey.withOpacity(0.2),
                ),
                color: index == selectedOptionIndex
                    ? Colors.blue.withOpacity(0.05)
                    : Colors.white,
              ),
              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(12),
                  onTap: () {},
                  child: RadioListTile.adaptive(
                    title: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(6), // Reduced from 8
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: index == selectedOptionIndex
                                ? Colors.blue.withOpacity(0.1)
                                : Colors.grey.withOpacity(0.1),
                          ),
                          child: Text(
                            String.fromCharCode(65 + index),
                            style: TextStyle(
                              color: index == selectedOptionIndex
                                  ? Colors.blue.shade700
                                  : Colors.grey.shade700,
                              fontWeight: FontWeight.bold,
                              fontSize: 14, // Added font size
                            ),
                          ),
                        ),
                        const SizedBox(width: 8), // Reduced from 12
                        Text(
                          options[index],
                          style: TextStyle(
                            fontSize: 15, // Reduced from 16
                            fontWeight: index == selectedOptionIndex
                                ? FontWeight.w600
                                : FontWeight.normal,
                            color: index == selectedOptionIndex
                                ? Colors.blue.shade700
                                : Colors.black87,
                          ),
                        ),
                      ],
                    ),
                    value: index,
                    groupValue: selectedOptionIndex,
                    activeColor: Colors.blue.shade700,
                    selectedTileColor: Colors.blue.withOpacity(0.1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 12, // Reduced from 16
                      vertical: 4, // Reduced from 8
                    ),
                    onChanged: onOptionSelected,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}
