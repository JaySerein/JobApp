import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:job_app/src/components/styles/constants/strings_text.dart';
import 'package:job_app/src/components/styles/theme/theme.dart';
import 'package:job_app/src/layouts/public/welcome/welcome.dart';
import 'package:job_app/src/routes/routes.dart';
import 'package:job_app/src/utils/bindings/general_binding.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: JTexts.appName,
      themeMode: ThemeMode.system,
      theme: JAppTheme.lightTheme,
      darkTheme: JAppTheme.darkTheme,
      debugShowCheckedModeBanner: false,
      initialBinding: GeneralBinding(),
      initialRoute: '/', // Route ban đầu của ứng dụng
      getPages: JRoutes.routes,
      home: const WelcomeScreens(),
    );
  }
}
