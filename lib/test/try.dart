// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CountryRiverPodState {
  final String? selectedCountry;
  final String? selectedState;

  final List<CountryState> states; // List of states for the selected country

  CountryRiverPodState({
    this.selectedCountry,
    this.selectedState,
    this.states = const <CountryState>[], // Default empty list
  });

  CountryRiverPodState copyWith({
    String? selectedCountry,
    String? selectedState,
    List<CountryState>? states,
  }) {
    return CountryRiverPodState(
      selectedCountry: selectedCountry ?? this.selectedCountry,
      selectedState: selectedState ?? this.selectedState,
      states: states ?? this.states,
    );
  }
}

class CountryStateNotifier extends StateNotifier<CountryRiverPodState> {
  CountryStateNotifier() : super(CountryRiverPodState());

  void selectCountry(String selectedCountryCode,
      List<CountryModel> countryModelList, String? newSelectedState) {
    final selectedCountry = countryModelList.firstWhere(
      (country) => country.code == selectedCountryCode,
      orElse: () => CountryModel(code: '', name: '', states: []),
    );

    state = state.copyWith(
      selectedCountry: selectedCountryCode,
      states: selectedCountry.states,
      selectedState: newSelectedState ??
          (selectedCountry.states.isNotEmpty
              ? selectedCountry.states[selectedCountry.states.length - 1].code
              : null),
    );
  }

  // void selectCountry(String selectedCountryCode,
  //     List<CountryModel> countryModelList, String? newSelectedState) {
  //   final selectedCountry = countryModelList.firstWhere(
  //     (country) => country.code == selectedCountryCode,
  //     orElse: () => CountryModel(code: '', name: '', states: []),
  //   );

  //   // Reset selectedState if the country has no matching state
  //   state = state.copyWith(
  //     selectedCountry: selectedCountryCode,
  //     states: selectedCountry.states,
  //     selectedState: newSelectedState ??
  //         (selectedCountry.states.isEmpty ? null : state.selectedState),
  //   );
  // }

  void selectState(String selectedStateCode) {
    state = state.copyWith(selectedState: selectedStateCode);
  }
}

// Define the provider
final countryStateNotifierProvider =
    StateNotifierProvider<CountryStateNotifier, CountryRiverPodState>(
  (ref) => CountryStateNotifier(),
);

class CountryModel {
  final String code;
  final String name;
  final List<CountryState> states;
  CountryModel({
    required this.code,
    required this.name,
    required this.states,
  });

  CountryModel copyWith({
    String? code,
    String? name,
    List<CountryState>? states,
  }) {
    return CountryModel(
      code: code ?? this.code,
      name: name ?? this.name,
      states: states ?? this.states,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
      'states': states.map((x) => x.toMap()).toList(),
    };
  }

  factory CountryModel.fromMap(Map<String, dynamic> map) {
    return CountryModel(
      code: map['code'] as String,
      name: map['name'] as String,
      states: List<CountryState>.from(
        (map['states'] as List<int>).map<CountryState>(
          (x) => CountryState.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryModel.fromJson(String source) =>
      CountryModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'CountryModel(code: $code, name: $name, states: $states)';

  @override
  bool operator ==(covariant CountryModel other) {
    if (identical(this, other)) return true;

    return other.code == code &&
        other.name == name &&
        listEquals(other.states, states);
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode ^ states.hashCode;
}

class CountryState {
  final String code;
  final String name;
  CountryState({
    required this.code,
    required this.name,
  });

  CountryState copyWith({
    String? code,
    String? name,
  }) {
    return CountryState(
      code: code ?? this.code,
      name: name ?? this.name,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'name': name,
    };
  }

  factory CountryState.fromMap(Map<String, dynamic> map) {
    return CountryState(
      code: map['code'] as String,
      name: map['name'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountryState.fromJson(String source) =>
      CountryState.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CountryState(code: $code, name: $name)';

  @override
  bool operator ==(covariant CountryState other) {
    if (identical(this, other)) return true;

    return other.code == code && other.name == name;
  }

  @override
  int get hashCode => code.hashCode ^ name.hashCode;
}
