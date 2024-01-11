import 'package:ar_visionary_explora/App.dart';
import 'package:ar_visionary_explora/data/repositories/authentication/authentication_repository.dart';
import 'package:ar_visionary_explora/homeScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'firebase_options.dart';

Future<void> main() async {
// Add widget binding
  final WidgetsBinding widgetsBinding =
      WidgetsFlutterBinding.ensureInitialized();

// GetX local storage
  await GetStorage.init();

// awit splash screen until other item loads
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

// Add Firebase initialization and Authentication
  try{
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform)
    .then((FirebaseApp value) => Get.put(AuthenticationRepository()));
  } catch (errorMsg) {
    print("Error: " + errorMsg.toString());
  }
  //runApp(const MyApp());
  runApp(const App());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'AR Visionary Explora App',
//       theme: ThemeData(
//         primarySwatch: Colors.purple,
//       ),
//       debugShowCheckedModeBanner: false,
//       home: const HomeScreen(),
//     );
//   }
// }
