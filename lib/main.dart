import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:myapp/ui/routes/app_router.dart';

import 'main_binding.dart';
import 'ui/theme/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Intl.defaultLocale = "es_ES";

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBinding(),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', ''),
        Locale('es', ''),
      ],
      debugShowCheckedModeBanner: false,
      title: "Hexa Test",
      theme: AppTheme.light,
      initialRoute: AppRouter.initialRoute,
      getPages: AppRouter.routes,
      onGenerateRoute: ((settings) => AppRouter.onGenerateRoute(settings)),
    );
  }
}
