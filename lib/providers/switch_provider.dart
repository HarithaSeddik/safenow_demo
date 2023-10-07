import 'package:flutter_riverpod/flutter_riverpod.dart';

// First tried ChangeNotifierProvider --> then StateNotifierProvider --> then StateProvider

// StateProvider type works best with very simple primitive state types like Strings, booleans, enums, etc...

// StateNotifierProvider should be used when working with more complex states like custom classes who's states are modified/fetched by methods --> for example, state of a TODOs class
final switchStateProvider = StateProvider<bool>((ref) => false);
