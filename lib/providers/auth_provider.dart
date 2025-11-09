import 'package:flutter_riverpod/flutter_riverpod.dart';

enum AuthRole { user, worker, admin }

final authRoleProvider = StateProvider<AuthRole>((ref) => AuthRole.user);

// You can expand with login status, token, user info, etc.
final authStatusProvider = StateProvider<bool>((ref) => false);