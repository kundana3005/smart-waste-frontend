import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/worker.dart';

// Example provider for workers
final workerListProvider = StateProvider<List<Worker>>((ref) => []);