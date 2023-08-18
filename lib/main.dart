import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pin_app/views/screens/screen_home.dart';
import 'package:pin_app/widgets/custom_error.dart';

import 'helpers/theme.dart';
import 'helpers/theme_services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      locale: Locale('en', 'US'),
      debugShowCheckedModeBanner: false,
      title: "Pin App",
      routingCallback: (route) {
        print(route?.current);
      },
      home: ScreenHome(),
      themeMode: ThemeService.getThemeMode(),
      theme: Themes().lightTheme,
      darkTheme: Themes().darkTheme,
      builder: (context, widget) {
        ErrorWidget.builder = (FlutterErrorDetails errorDetails) {
          return CustomError(errorDetails: errorDetails);
        };
        return ScrollConfiguration(
            behavior: NoColorScrollBehavior(), child: widget!);
      },
    );
  }
}


class ScrollBehaviorModified extends ScrollBehavior {
  const ScrollBehaviorModified();

  @override
  ScrollPhysics getScrollPhysics(BuildContext context) {
    switch (getPlatform(context)) {
      case TargetPlatform.iOS:
      case TargetPlatform.macOS:
      case TargetPlatform.android:
        return const BouncingScrollPhysics();
      case TargetPlatform.fuchsia:
      case TargetPlatform.linux:
      case TargetPlatform.windows:
        return const ClampingScrollPhysics();
    }
  }
}

class NoColorScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}