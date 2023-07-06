import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cinemate/repositories/popular_movies_repo.dart';
import 'package:cinemate/views/screens/popular_movie_screen/popular_movies_screen.dart';
import 'package:cinemate/views/theme/theme.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ByteData data =
      await PlatformAssetBundle().load('assets/ca/lets-encrypt-r3.pem');
  SecurityContext.defaultContext
      .setTrustedCertificatesBytes(data.buffer.asUint8List());

  runApp(
    DevicePreview(
      enabled: !kReleaseMode,
      builder: (context) => const ProviderScope(
        child: MyApp(),
      ), // Wrap your app
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // ignore: deprecated_member_use
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      title: 'CineMate',
      theme: theme(),
      home: const PopularMoviesScreen(),
    );
  }
}

// class MyHomePage extends StatelessWidget {
//   MyHomePage({super.key});
//
//   final HttpPopularMoviesRepo _httpPopularMoviesRepo = HttpPopularMoviesRepo();
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () async {
//             final movies = await _httpPopularMoviesRepo.getPopularMovies(1);
//             debugPrint(movies.toString());
//           },
//           child: const Text('Get Popular Movies'),
//         ),
//       ),
//     );
//   }
// }
