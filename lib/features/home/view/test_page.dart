import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_firebase3/features/home/view/widgets/question_card.dart';

class TestPage extends ConsumerWidget {
  const TestPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final testResultNotifier = ref.watch(testResultProvider);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: List.generate(10, (index) {
            final selectedOption = testResultNotifier.length > index
                ? testResultNotifier[index][index]
                : null;

            return Column(
              children: [
                QuestionCard(
                  questionText: "This is the question for the quiz is it true?",
                  options: ["Yes", "No", "Maybe", "I don't know"],
                  selectedOptionIndex: selectedOption,
                  onOptionSelected: (value) {
                    ref
                        .read(testResultProvider.notifier)
                        .addResult(value!, index);
                  },
                ),
                const SizedBox(height: 16),
              ],
            );
          }),
        ),
      ),
    );
  }
}

final testResultProvider =
    StateNotifierProvider<TestResultNotifier, List<Map<int, int>>>((ref) {
  return TestResultNotifier();
});

class TestResultNotifier extends StateNotifier<List<Map<int, int>>> {
  TestResultNotifier() : super([]);

  void addResult(int result, int index) {
    // Create a copy of the current state
    final newState = List<Map<int, int>>.from(state);

    if (newState.length > index) {
      // Update the existing map for the question
      newState[index] = {index: result};
    } else {
      // Add a new map for the question
      while (newState.length <= index) {
        newState.add({}); // Ensure the list has enough elements
      }
      newState[index] = {index: result};
    }

    // Assign the updated list to state
    state = newState;
  }
}
