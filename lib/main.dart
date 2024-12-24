import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mezan/constant/shared.dart';
import 'package:mezan/screnns/change.dart';
import 'package:mezan/screnns/info.dart';
import 'package:mezan/screnns/orgnaization.dart';
import 'package:mezan/screnns/premuim.dart';
import 'package:mezan/screnns/splash_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Pref.init();
  runApp(const Mezan());
}

class Mezan extends StatelessWidget {
  const Mezan({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: const Locale('ar'),
      supportedLocales: const [Locale('ar', '')],
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      routes: {
        'change': (BuildContext context) => const Change(),
        'orgnization': (BuildContext context) => const Orgnaization(),
        'info': (BuildContext context) => const Personal(),
        'premuim': (BuildContext context) => const Premium(),
       
      },
      home: const SplashScreen(),
    );
  }
}
