import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_firebase3/test/try.dart';

class Try2 extends StatelessWidget {
  const Try2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("try"),
      ),
      body: Consumer(
        builder: (context, ref, _) {
          // Sample data for testing (Replace with actual data)
          final countryModel = [
            CountryModel(code: 'US', name: 'United States', states: [
              CountryState(code: 'CA', name: 'California'),
              CountryState(code: 'NY', name: 'New York'),
            ]),
            CountryModel(code: 'IN', name: 'India', states: [
              CountryState(code: 'DL', name: 'Delhi'),
              CountryState(code: 'KA', name: 'Karnataka'),
            ]),
          ];

          final countryState = ref.watch(countryStateNotifierProvider);

          return Column(
            children: [
              // Country Dropdown
              DropdownButtonFormField<String>(
                decoration: InputDecoration(labelText: "Select Country"),
                value: countryState.selectedCountry,
                items: countryModel.map((country) {
                  return DropdownMenuItem<String>(
                    value: country.code, // Use the country code as the value
                    child: Text(country.name),
                  );
                }).toList(),
                onChanged: (selectedValue) {
                  print("selected value is1 $selectedValue");
                  print("country state is ${countryState.states}");
                  if (selectedValue != null) {
                    // Find the selected country from the list
                    final selectedCountry = countryModel.firstWhere(
                      (country) => country.code == selectedValue,
                      orElse: () =>
                          CountryModel(code: '', name: '', states: []),
                    );

                    print(
                        "selected country is ${selectedCountry.code} ${selectedCountry.name} ${selectedCountry.states}");

                    // If the new selected country does not have the previously selected state,
                    // reset selectedState to null
                    String? newSelectedState;
                    if (selectedCountry.states.any(
                        (state) => state.code == countryState.selectedState)) {
                      newSelectedState = countryState.selectedState;
                    }
                    print("new selected state is $newSelectedState");
                    // Update state with the new country and its states
                    ref
                        .read(countryStateNotifierProvider.notifier)
                        .selectCountry(
                          selectedValue,
                          countryModel,
                          newSelectedState,
                        );
                    // ref.read(countryStateNotifierProvider.notifier).selectState();
                    print("country state is22 ${countryState.states}");
                  }
                },
              ),

              SizedBox(height: 16), // Add some spacing between dropdowns

              // State Dropdown (only show when country has states)
              if (countryState.states.isNotEmpty) ...[
                //FIxx
                DropdownButtonFormField<String>(
                  decoration: InputDecoration(labelText: "Select State"),
                  value: countryState.selectedState,
                  items: countryState.states.map((state) {
                    print("state is $state");
                    return DropdownMenuItem<String>(
                      value: state.code, // Use state code as the value
                      child: Text(state.name),
                    );
                  }).toList(),
                  onChanged: (selectedValue) {
                    print("selected value is $selectedValue");
                    print("country state is ${countryState.states}");
                    if (selectedValue != null) {
                      ref
                          .read(countryStateNotifierProvider.notifier)
                          .selectState(selectedValue); // Update selected state
                    }
                  },
                ),
              ],
            ],
          );
        },
      ),
    );
  }
}



// DropdownButtonFormField<String>(
//   decoration: InputDecoration(labelText: "Select State"),
//   value: countryState.selectedState, // Must match exactly one item in items
//   items: countryState.states.map((state) {
//     return DropdownMenuItem<String>(
//       value: state.code, // Ensure unique values for each state
//       child: Text(state.name),
//     );
//   }).toList(),
//   onChanged: (selectedValue) {
//     if (selectedValue != null) {
//       ref
//           .read(countryStateNotifierProvider.notifier)
//           .selectState(selectedValue); // Update selected state
//     }
//   },
// ),
