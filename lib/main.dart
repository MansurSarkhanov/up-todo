import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'core/routes/app_router.dart';
import 'core/theme/theme_scope.dart';
import 'core/theme/theme_scope_widget.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(ThemeScopeWidget(child: const MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = ThemeScope.of(context);
    final extensions = <ThemeExtension<dynamic>>[
      theme.appTypography,
      theme.appColors,
    ];
    return PopScope(
      canPop: false,
      child: MaterialApp.router(
        theme: ThemeData(extensions: extensions),
        themeMode: ThemeMode.system,
        debugShowCheckedModeBanner: false,
        title: 'Up Todo',
        routerConfig: appRouter,
      ),
    );
  }
}
