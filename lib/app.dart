import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/colors.dart';
import 'package:job_app/src/components/styles/constants/strings_text.dart';
import 'package:job_app/src/components/styles/theme/theme.dart';
import 'package:job_app/src/routes/routes.dart';
import 'package:job_app/src/utils/bindings/general_binding.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: GetMaterialApp(
        title: JTexts.appName,
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', ''),
          Locale('vi', ''),
        ],
        locale: const Locale('vi'),
        themeMode: ThemeMode.system,
        theme: JAppTheme.lightTheme,
        darkTheme: JAppTheme.darkTheme,
        debugShowCheckedModeBanner: false,
        initialBinding: GeneralBinding(),
        initialRoute: '/', // Route ban đầu của ứng dụng
        getPages: JRoutes.routes,
        home: const Scaffold(
          backgroundColor: JColors.primary,
          body: Center(
            child: CircularProgressIndicator(
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
