import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/localization/api_asset_loader.dart';
import 'package:flutter_application_1/localization/localization_repository.dart';

import 'core/design_system.dart';
import 'screens/login_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  final repository = LocalizationRepository(
    baseUrl: 'https://your-api.com/langs',
  );

  runApp(
    EasyLocalization(
      supportedLocales: [Locale('en'), Locale('ar')],
      fallbackLocale: Locale('en'),
      path: 'assets/langs',
      assetLoader: ApiAssetLoader(repository: repository),
      child: CBAlphaApp(),
    ),
  );
}

class CBAlphaApp extends StatelessWidget {
  const CBAlphaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CB Alpha Trader',
      debugShowCheckedModeBanner: false,
      locale: context.locale,
      supportedLocales: context.supportedLocales,
      localizationsDelegates: context.localizationDelegates,
      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.scaffoldBg,
        fontFamily: 'Roboto',
        textTheme: AppTextStyles.textTheme,
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
        ),
      ),
      home: const LoginScreen(),
    );
  }
}
