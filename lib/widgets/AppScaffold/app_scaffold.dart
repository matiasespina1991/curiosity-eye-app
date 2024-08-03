import 'dart:async';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:template_app/app_settings/app_general_settings.dart';
import 'package:template_app/app_settings/auth_config.dart';
import 'package:template_app/providers/providers_all.dart';
import 'package:template_app/utils/ui/is_dark_mode.dart';
import 'package:template_app/widgets/NotificationModal/notification_modal.dart';
import 'package:template_app/widgets/NotificationSnackbar/notification_snackbar.dart';

import 'package:go_router/go_router.dart';
import '../../app_settings/theme_settings.dart';
import '../../generated/l10n.dart';
import '../../models/general_models.dart';
import '../../routes/routes.dart';
import '../../screens/common/loading_screen/loading_screen.dart';
import '../ThemeAppBar/template_app_bar.dart';
import '../ThemeFloatingSpeedDialMenu/theme_floating_speed_dial_menu.dart';

class AppScaffold extends ConsumerStatefulWidget {
  final Widget body;
  final bool hideFloatingSpeedDialMenu;
  final String appBarTitle;
  final bool isProtected;
  final bool? useSafeArea;
  final ScrollPhysics? scrollPhysics;
  final LottieAnimationBackground? backgroundAnimation;
  final LottieAnimationBackground? backgroundAnimationDarkMode;
  final bool useTopAppBar;
  final bool showScreenTitleInAppBar;
  final bool? centerTitle;

  const AppScaffold({
    super.key,
    required this.body,
    required this.appBarTitle,
    required this.isProtected,
    this.useSafeArea,
    this.hideFloatingSpeedDialMenu = false,
    this.scrollPhysics,
    this.backgroundAnimation,
    this.backgroundAnimationDarkMode,
    this.useTopAppBar = false,
    this.showScreenTitleInAppBar = true,
    this.centerTitle,
  });

  @override
  AppScaffoldState createState() => AppScaffoldState();
}

class AppScaffoldState extends ConsumerState<AppScaffold> {
  bool _connectivityChecked = false;
  bool _userWentOffline = false;
  Timer? _connectivityTimer;

  @override
  void initState() {
    super.initState();

    final String debugRouteName = DebugConfig.debugScreen.name;

    if (DebugConfig.forceDebugScreen && debugRouteName.isNotEmpty) {
      bool navigationAllowed = true;
      // if (DebugConfig.alwaysAllowNavigation) {
      //   navigationAllowed = true;
      // }
      debugPrint(
          '[DebugConfig.forceDebugScreen is set to true. Target screen is: $debugRouteName. Navigation ${navigationAllowed ? 'allowed' : 'is blocked'}.');
    }
  }

  @override
  void dispose() {
    _connectivityTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final auth = ref.watch(authProvider);
    final connectivity = ref.watch(connectivityProvider);

    if (auth.isLoading && !auth.isAuthenticated) {
      return const LoadingScreen();
    }

    _handleProtectedRoutes(auth);
    _checkConnectivity(connectivity);

    return SafeArea(
      bottom: widget.useSafeArea ?? ThemeSettings.useSafeArea,
      top: widget.useSafeArea ?? ThemeSettings.useSafeArea,
      child: Scaffold(
        appBar: (AppGeneralSettings.useTopAppBar || widget.useTopAppBar)
            ? ThemeAppBar(
                appBarHeight: ThemeSettings.appBarHeight,
                centerTitle: widget.centerTitle,
                title: widget.showScreenTitleInAppBar ? widget.appBarTitle : '',
              )
            : null,
        body: Stack(
          fit: StackFit.expand,
          children: [
            _buildBackgroundAnimation(),
            _buildMainContent(auth.isAuthenticated),
            _buildFloatingMenuBackdrop(),
          ],
        ),
        floatingActionButton: ThemeFloatingSpeedDialMenu(
          hideFloatingSpeedDialMenu: widget.hideFloatingSpeedDialMenu,
          isDialOpenNotifier: ValueNotifier(false),
        ),
      ),
    );
  }

  LoadingScreen? _handleProtectedRoutes(auth) {
    if (DebugConfig.forceDebugScreen) {
      return null;
    }

    if (!DebugConfig.bypassLoginScreen &&
        AuthConfig.useProtectedRoutes &&
        widget.isProtected &&
        !auth.isAuthenticated) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        context.go(Routes.loginScreen.path);
      });
    }

    if (!auth.isAuthenticated && widget.isProtected) {
      return const LoadingScreen();
    }
    return null;
  }

  void _checkConnectivity(connectivity) {
    if (!connectivity.isConnected && !_connectivityChecked) {
      _connectivityChecked = true;
      _connectivityTimer?.cancel();
      _connectivityTimer = Timer(
          const Duration(
              seconds: ThemeSettings.secondsUntilNoInternetNotification), () {
        if (!connectivity.isConnected) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (ModalRoute.of(context)?.isCurrent == true) {
              _showNoInternetNotification(context);
              _userWentOffline = true;
            }
          });
        }
      });
    } else if (connectivity.isConnected && _userWentOffline) {
      _connectivityTimer?.cancel();
      _connectivityChecked = false;
      _userWentOffline = false;

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (ModalRoute.of(context)?.isCurrent == true) {
          _showBackToInternetConnectionNotification(context);
        }
      });
    }
  }

  ScrollPhysics getScrollPhysics() {
    switch (ThemeSettings.defaultScrollPhysics) {
      case 'never':
        return const NeverScrollableScrollPhysics();
      case 'always':
        return const AlwaysScrollableScrollPhysics();
      case 'clamp':
        return const ClampingScrollPhysics();
      default:
        return const AlwaysScrollableScrollPhysics();
    }
  }

  LottieAnimationBackground? getLottieAnimation() {
    final themeIsDark = isDarkMode(context);
    if (themeIsDark && widget.backgroundAnimationDarkMode != null) {
      return widget.backgroundAnimationDarkMode;
    }
    return widget.backgroundAnimation;
  }

  Widget _buildBackgroundAnimation() {
    final animationConfig = getLottieAnimation();
    if (animationConfig != null && animationConfig.active) {
      final screenWidth = MediaQuery.of(context).size.width;
      final screenHeight = MediaQuery.of(context).size.height;
      return Stack(
        children: [
          Positioned(
            left: (screenWidth / 2) +
                animationConfig.x -
                (screenWidth * (animationConfig.width / 100) / 2),
            top: (screenHeight / 2) +
                animationConfig.y -
                (screenWidth * (animationConfig.width / 100) / 2),
            width: screenWidth * (animationConfig.width / 100),
            child: Opacity(
              opacity: animationConfig.opacity,
              child: Lottie.asset(
                animationConfig.animationPath,
              ),
            ),
          ),
          if (animationConfig.blur > 0)
            Positioned.fill(
              child: BackdropFilter(
                filter: ImageFilter.blur(
                    sigmaX: animationConfig.blur, sigmaY: animationConfig.blur),
                child: Container(
                  color: Colors.transparent,
                ),
              ),
            ),
        ],
      );
    }
    return const SizedBox.shrink();
  }

  Widget _buildMainContent(bool isAuthenticated) {
    if (widget.scrollPhysics is NeverScrollableScrollPhysics) {
      return Skeletonizer(
        enabled: !isAuthenticated &&
            widget.isProtected &&
            !DebugConfig.forceDebugScreen &&
            !DebugConfig.bypassLoginScreen,
        child: Padding(
          padding: ThemeSettings.scaffoldPadding,
          child: widget.body,
        ),
      );
    }

    return SingleChildScrollView(
      physics: widget.scrollPhysics ?? getScrollPhysics(),
      child: Column(
        children: [
          Skeletonizer(
            enabled: !isAuthenticated &&
                widget.isProtected &&
                !DebugConfig.forceDebugScreen &&
                !DebugConfig.bypassLoginScreen,
            child: Padding(
              padding: ThemeSettings.scaffoldPadding,
              child: widget.body,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFloatingMenuBackdrop() {
    if (!widget.hideFloatingSpeedDialMenu &&
        AppGeneralSettings.useFloatingSpeedDialMenu) {
      return Positioned.fill(
        child: ValueListenableBuilder(
          valueListenable: ValueNotifier(false),
          builder: (context, value, child) {
            return value
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 1, sigmaY: 1),
                    child: Container(
                      color: Colors.black.withOpacity(0.1),
                    ),
                  )
                : const SizedBox.shrink();
          },
        ),
      );
    }
    return const SizedBox.shrink();
  }

  void _showNoInternetNotification(BuildContext context) {
    if (ThemeSettings.noInternetNotificationType == 'snackbar') {
      NotificationSnackbar.showSnackBar(
          message: S.of(context).noInternetConnection,
          icon: Icons.wifi_off,
          variant: 'info',
          duration: 'infinite');
    } else if (ThemeSettings.noInternetNotificationType == 'modal') {
      NotificationModal.noInternetConnection(
        context: context,
        onTapConfirm: () {
          setState(() {
            _connectivityChecked = true;
          });
        },
      );
    } else if (ThemeSettings.noInternetNotificationType == 'dialog') {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text(S.of(context).noInternetConnection),
          content: Text(S.of(context).youAreCurrentlyOfflineMessage),
          actions: <Widget>[
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                context.pop();
              },
            ),
          ],
        ),
      );
    }
  }

  void _showBackToInternetConnectionNotification(BuildContext context) {
    if (ThemeSettings.noInternetNotificationType == 'snackbar') {
      NotificationSnackbar.showSnackBar(
          message: S.of(context).backToInternetConnection,
          icon: Icons.wifi,
          variant: 'success',
          duration: 'long');
    } else if (ThemeSettings.noInternetNotificationType == 'modal') {
      NotificationModal.backToInternetConnection(
        context: context,
        onTapConfirm: () {
          setState(() {
            _connectivityChecked = false; // Allow for future offline checks
          });
        },
      );
    } else if (ThemeSettings.noInternetNotificationType == 'dialog') {
      NotificationSnackbar.showSnackBar(
          message: S.of(context).backToInternetConnection,
          icon: Icons.wifi,
          variant: 'success',
          duration: 'long');
    }
  }
}
