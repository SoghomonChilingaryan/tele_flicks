
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
import 'package:tele_flicks/src/common/core/app/app.dart';
import 'package:tele_flicks/src/common/core/di/di_service.dart' as di;
import 'package:path_provider/path_provider.dart';

Future<void> main() async {
  
  WidgetsFlutterBinding.ensureInitialized();
  HydratedBloc.storage = await HydratedStorage.build(
    storageDirectory: kIsWeb
        ? HydratedStorage.webStorageDirectory
        : await getApplicationDocumentsDirectory(),
  );
  await di.setup();
  runApp(const AppProviders());
}