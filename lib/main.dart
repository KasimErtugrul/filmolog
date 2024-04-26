import 'package:filmolog/lib.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
//import 'package:window_manager/window_manager.dart';

void main() async {
  configureDependencies();
  WidgetsFlutterBinding.ensureInitialized();
/*
  //DiApp.init();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    size: Size(360, 690),
    maximumSize: Size(360, 690),
    minimumSize: Size(360, 690),
    alwaysOnTop: true,
    //center: true,
    backgroundColor: Colors.transparent,
    skipTaskbar: false,
    // titleBarStyle: TitleBarStyle.hidden,
  );
  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });
*/

  runApp(const AppProviders());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        builder: (context, child) {
          return MaterialApp(
            scrollBehavior: MyCustomScrollBehavior(),
            debugShowCheckedModeBanner: false,
            title: 'Filmolog',
            themeMode: ThemeMode.dark,
            theme: getApplicationTheme(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('tr'),
              Locale('en'),
            ],
            // onGenerateRoute: RouteManager.generateRoute,
            // initialRoute: '/',
            home: const MainPage(),
          );
        });
  }
}

class MyCustomScrollBehavior extends MaterialScrollBehavior {
  // Override behavior methods and getters like dragDevices
  @override
  Set<PointerDeviceKind> get dragDevices => {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      };
}
