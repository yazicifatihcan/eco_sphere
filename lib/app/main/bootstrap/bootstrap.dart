import 'dart:async';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_base_project/firebase_options.dart';
import '../../app.dart';
import '../../libs/locale_manager/locale_manager.dart';

/// Tüm proje ortamları bu bootstrap Fon. nunu çağırmakta
Future<void> bootstrap(App app) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await LocaleManager.cacheInit();
  runApp.call(app);
}
