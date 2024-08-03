import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:template_app/app_settings/app_general_settings.dart';
import 'package:template_app/widgets/AppScaffold/app_scaffold.dart';
import '../../../generated/l10n.dart';
import '../../../providers/providers_all.dart';
import '../../../utils/ui/is_dark_mode.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  bool useAppBar = AppGeneralSettings.useTopAppBar;
  ValueNotifier<bool> isDialOpen = ValueNotifier(false);
  int _sliderValue = 0;
  int _stepperIndex = 0;
  bool exampleSwitchValue = false;
  static const bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final themeNotifier = ref.watch(themeProvider);

    final isDarkMode = themeNotifier.themeMode == ThemeMode.dark;
    return AppScaffold(
      isProtected: true,
      appBarTitle: S.of(context).homeScreenTitle,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Skeletonizer(
              enabled: isLoading,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(S.of(context).exampleTitle,
                      style: Theme.of(context).textTheme.headlineSmall),
                  const SizedBox(height: 10),
                  Text(S.of(context).exampleDescription,
                      style: Theme.of(context).textTheme.bodyMedium),
                  const SizedBox(height: 20),
                  Text(S.of(context).buttonsSectionTitle,
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 10),
                  ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 47),
                      ),
                      child: Text(S.of(context).elevatedButtonLabel)),
                  TextButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 47),
                      ),
                      child: Text(S.of(context).textButtonLabel)),
                  OutlinedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 47),
                      ),
                      child: Text(S.of(context).outlinedButtonLabel)),
                  const SizedBox(height: 20),
                  Text(S.of(context).switchesSectionTitle,
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 10),
                  SwitchListTile(
                    title: Text(S.of(context).exampleSwitch),
                    value: exampleSwitchValue,
                    onChanged: (value) {
                      setState(() {
                        exampleSwitchValue = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(S.of(context).inputsSectionTitle,
                      style: Theme.of(context).textTheme.titleSmall),
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      labelText: S.of(context).textFieldLabel,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Divider(),
            const SizedBox(height: 20),
            Skeletonizer(
              enabled: isLoading,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        S.of(context).lightMode,
                        style: TextStyle(
                          fontWeight:
                              isDarkMode ? FontWeight.normal : FontWeight.bold,
                        ),
                      ),
                      const Text(
                        ' / ',
                      ),
                      Text(
                        S.of(context).darkMode,
                        style: TextStyle(
                          fontWeight:
                              isDarkMode ? FontWeight.bold : FontWeight.normal,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Center(
                    child: Switch(
                      thumbIcon: WidgetStateProperty.all(Icon(
                        isDarkMode ? Icons.dark_mode : Icons.light_mode,
                        color: Colors.white,
                      )),
                      value: isDarkMode,
                      onChanged: (value) {
                        ref.read(themeProvider).toggleTheme(value);
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          ref
                              .read(localeProvider)
                              .setLocale(const Locale('en'));
                        },
                        child: const Text(
                          '🇺🇸',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('/'),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          ref
                              .read(localeProvider)
                              .setLocale(const Locale('es'));
                        },
                        child: const Text(
                          '🇪🇸',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Text('/'),
                      const SizedBox(width: 10),
                      GestureDetector(
                        onTap: () {
                          ref
                              .read(localeProvider)
                              .setLocale(const Locale('de'));
                        },
                        child: const Text(
                          '🇩🇪',
                          style: TextStyle(fontSize: 30),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Divider(),
            Skeletonizer(
                enabled: isLoading,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(S.of(context).chipsSectionTitle,
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        children: [
                          Chip(
                            label: Text(S.of(context).chipOneLabel),
                          ),
                          Chip(label: Text(S.of(context).chipTwoLabel)),
                          Chip(label: Text(S.of(context).chipThreeLabel)),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Text(S.of(context).slidersSectionTitle,
                          style: Theme.of(context).textTheme.titleSmall),
                      const SizedBox(height: 10),
                      Slider(
                        value: _sliderValue.toDouble(),
                        onChanged: (value) {
                          setState(() {
                            _sliderValue = value.toInt();
                          });
                        },
                        min: 0,
                        max: 100,
                        // inactiveColor: Colors.white.withOpacity(0.4),

                        divisions: 100,
                      ),
                      Text('${S.of(context).sliderValueLabel}: $_sliderValue%'),
                    ])),
            const Divider(),
            Skeletonizer(
              enabled: isLoading,
              child: Stepper(
                physics: const NeverScrollableScrollPhysics(),
                margin: const EdgeInsets.all(0),
                controlsBuilder: (context, details) {
                  return Row(
                    children: [
                      OutlinedButton(
                        onPressed: details.onStepContinue,
                        child: Text(S.of(context).continueButton),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                          minimumSize: const Size(92, 0),
                        ),
                        onPressed: details.onStepCancel,
                        child: Text(S.of(context).back),
                      ),
                    ],
                  );
                },
                currentStep: _stepperIndex,
                onStepTapped: (index) {
                  setState(() {
                    _stepperIndex = index;
                  });
                },
                onStepContinue: () {
                  if (_stepperIndex < 2) {
                    setState(() {
                      _stepperIndex++;
                    });
                  }
                },
                onStepCancel: () {
                  if (_stepperIndex > 0) {
                    setState(() {
                      _stepperIndex--;
                    });
                  }
                },
                steps: [
                  Step(
                    title: Text(S.of(context).stepOneTitle),
                    content: SizedBox(
                        height: 100,
                        child:
                            Center(child: Text(S.of(context).stepOneContent))),
                    isActive: _stepperIndex == 0,
                  ),
                  Step(
                    title: Text(S.of(context).stepTwoTitle),
                    content: SizedBox(
                        height: 100,
                        child:
                            Center(child: Text(S.of(context).stepTwoContent))),
                    isActive: _stepperIndex == 1,
                  ),
                  Step(
                    title: Text(S.of(context).stepThreeTitle),
                    content: SizedBox(
                        height: 100,
                        child: Center(
                            child: Text(S.of(context).stepThreeContent))),
                    isActive: _stepperIndex == 2,
                  ),
                ],
              ),
            ),
            const Divider(),
            Skeletonizer(
              enabled: isLoading,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    RichText(
                      text: TextSpan(
                        text: S.of(context).exampleDisplayLargePrefix,
                        style: Theme.of(context).textTheme.displayLarge,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Large',
                            style: Theme.of(context)
                                .textTheme
                                .displayLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: S.of(context).exampleDisplayMediumPrefix,
                        style: Theme.of(context).textTheme.displayMedium,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Medium',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: S.of(context).exampleDisplaySmallPrefix,
                        style: Theme.of(context).textTheme.displaySmall,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Small',
                            style: Theme.of(context)
                                .textTheme
                                .displaySmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: S.of(context).exampleHeadlineLargePrefix,
                        style: Theme.of(context).textTheme.headlineLarge,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Large',
                            style: Theme.of(context)
                                .textTheme
                                .headlineLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: S.of(context).exampleHeadlineMediumPrefix,
                        style: Theme.of(context).textTheme.headlineMedium,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Medium',
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: S.of(context).exampleHeadlineSmallPrefix,
                        style: Theme.of(context).textTheme.headlineSmall,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Small',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: S.of(context).exampleTitleLargePrefix,
                        style: Theme.of(context).textTheme.titleLarge,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Large',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: S.of(context).exampleTitleMediumPrefix,
                        style: Theme.of(context).textTheme.titleMedium,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Medium',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: S.of(context).exampleTitleSmallPrefix,
                        style: Theme.of(context).textTheme.titleSmall,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Small',
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: S.of(context).exampleBodyLargePrefix,
                        style: Theme.of(context).textTheme.bodyLarge,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Large',
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: S.of(context).exampleBodyMediumPrefix,
                        style: Theme.of(context).textTheme.bodyMedium,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Medium',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: S.of(context).exampleBodySmallPrefix,
                        style: Theme.of(context).textTheme.bodySmall,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Small',
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: S.of(context).exampleLabelLargePrefix,
                        style: Theme.of(context).textTheme.labelLarge,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Large',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: S.of(context).exampleLabelMediumPrefix,
                        style: Theme.of(context).textTheme.labelMedium,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Medium',
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    RichText(
                      text: TextSpan(
                        text: S.of(context).exampleLabelSmallPrefix,
                        style: Theme.of(context).textTheme.labelSmall,
                        children: <TextSpan>[
                          TextSpan(
                            text: 'Small',
                            style: Theme.of(context)
                                .textTheme
                                .labelSmall
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                  ]),
            ),
            const SizedBox(height: 80),
          ],
        ),
      ),
    );
  }
}
