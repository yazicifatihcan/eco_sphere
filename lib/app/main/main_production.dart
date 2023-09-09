import '../app.dart';
import '../constants/app/app_constant.dart';
import '../constants/app/http_url.dart';
import '../constants/enum/general_enum.dart';
import 'bootstrap/bootstrap.dart';

/// product ortamı
///
/// COMMAND LINE örneği
/// flutter run --flavor product lib/app/main/main_production.dart
/// flutter build apk --release --flavor product lib/app/main/main_production.dart --no-tree-shake-icons
/// flutter build appbundle --release --flavor product lib/app/main/main_production.dart
void main() {
  environment = AppEnvironment.Production;
  HttpUrl.baseUrl = '';

  bootstrap(
    const App(title: 'Sbcli Example App'),
  );
}

