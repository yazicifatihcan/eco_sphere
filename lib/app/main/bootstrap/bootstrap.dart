import 'dart:async';
import 'package:flutter/material.dart';
import '../../app.dart';
import '../../libs/locale_manager/locale_manager.dart';

/// Tüm proje ortamları bu bootstrap Fon. nunu çağırmakta
Future<void> bootstrap(App app) async {
  WidgetsFlutterBinding.ensureInitialized();
      await LocaleManager.cacheInit();
      runApp.call(app);
}
