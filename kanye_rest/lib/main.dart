import 'package:flutter/material.dart';
import 'package:kanye_rest/page/home.dart';
import 'package:kanye_rest/shared/connectivity.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectionStatusSingleton connectionStatus =
      ConnectionStatusSingleton.getInstance();
  connectionStatus.initialize();
  runApp(KanyeRest());
}

class KanyeRest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kanye Says It',
      themeMode: ThemeMode.dark,
      home: HomePage(),
    );
  }
}
