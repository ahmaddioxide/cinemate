import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemate/views/theme/theme.dart';
import 'package:cinemate/constants/strings.dart';
import 'package:cinemate/services/shared_preferences.dart';
import 'package:cinemate/views/screens/home_screen/home_screen.dart';
import 'package:cinemate/views/screens/on_boarding_screens/on_boarding_screen.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]).then((value) =>runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const ProviderScope(
        child: MyApp(),
      ), // Wrap your app
    ),
  ),
  );

}


class MyApp extends StatelessWidget {
  const MyApp({super.key});
  Future<Widget> checkIfOpenedBefore() async {
    bool openedBefore = await SharedPreferenceServiceImpl().ifOpenedBefore();
    if (openedBefore) {
      return const HomeScreen();
    } else {
      return const OnBoardingPage();
    }
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: appName,
      theme: theme(),
      home:  FutureBuilder(
        future: checkIfOpenedBefore(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return snapshot.data as Widget;
          } else {
            return const Center(
              child: CircularProgressIndicator(
                color: darkAccent,
              ),
            );
          }
        },
      ),
    );
  }
}
