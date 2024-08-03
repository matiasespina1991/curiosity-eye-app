import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../widgets/AppScaffold/app_scaffold.dart';

class NotFoundScreen extends ConsumerStatefulWidget {
  const NotFoundScreen({super.key});

  @override
  ConsumerState<NotFoundScreen> createState() => _NotFoundScreenState();
}

class _NotFoundScreenState extends ConsumerState<NotFoundScreen> {
  @override
  Widget build(BuildContext context) {
    return const AppScaffold(
      isProtected: false,
      body: Center(
        child: Text('404 - Page Not Found', style: TextStyle(fontSize: 24)),
      ),
      appBarTitle: '404 - Page Not Found',
    );
  }
}
