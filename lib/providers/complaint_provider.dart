import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../models/complaint.dart';

// Example provider for complaints
final complaintListProvider = StateProvider<List<Complaint>>((ref) => []);