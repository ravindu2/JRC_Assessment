import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jrc_assement/routes/app_pages.dart';
import 'package:jrc_assement/routes/app_routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:jrc_assement/data/local_data_source/local_data_source.dart';
import 'package:jrc_assement/data/remote_data_source/remote_data_source.dart';
import 'package:jrc_assement/data/repository/repository.dart';
import 'package:jrc_assement/data/repository/repository_interface.dart';
import 'package:jrc_assement/data/services/api_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  /// ✅ Initialize Repository globally before running the app
  Get.put<RepositoryInterface>(
    Repository(
      localDataSource: LocalDataSource(),
      remoteDataSource: RemoteDataSource(ApiService()),
    ),
    permanent: true, // Keeps it alive throughout the app lifecycle
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'jrc assessment',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
      ],
      initialRoute: AppRoutes.login,
      getPages: AppPages.pages,
    );
  }
}
