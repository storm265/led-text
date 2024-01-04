import 'package:flutter/material.dart';
import 'package:led_text/screens/led_screen/led_controller.dart';
import 'package:led_text/screens/set_up_screen/set_up_screen.dart';
import 'package:led_text/services/system_chrome_provider.dart';
import 'package:led_text/screens/set_up_screen/set_up_controller.dart';
import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChromeProvider.setSystemChrome();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LedController(),
        ),
        ChangeNotifierProvider(
          create: (_) => SetUpController(),
        ),
      ],
      child: MediaQuery(
        /// avoids text shit if set increased text size in Accessibility settings;
        data: MediaQuery.of(context).copyWith(
          textScaler: const TextScaler.linear(1),
        ),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.green,
          ),
          title: 'Led Text',
          home: const SetUpScreen(),
        ),
      ),
    );
  }
}
