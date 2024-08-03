import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../app_settings/theme_settings.dart';
import '../../../widgets/AppScaffold/app_scaffold.dart';
import '../../../widgets/LoadingCircle/loading_circle.dart';

class LoadingScreen extends ConsumerStatefulWidget {
  const LoadingScreen({super.key});

  @override
  ConsumerState<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends ConsumerState<LoadingScreen> {
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      bottom: ThemeSettings.useSafeArea,
      top: ThemeSettings.useSafeArea,
      child: Scaffold(
        body: Center(
          child: LoadingCircle(
            color: ThemeSettings.seedColor,
          ),
        ),
      ),
    );
  }
}
