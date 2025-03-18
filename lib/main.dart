import 'package:dio/dio.dart';
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
import 'package:jrc_assement/data/services/api_constants.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  final dio = Dio(
    BaseOptions(
      baseUrl: ApiConstants.baseUrl,
      connectTimeout: Duration(milliseconds: ApiConstants.connectTimeout),
      receiveTimeout: Duration(milliseconds: ApiConstants.receiveTimeout),
      headers: ApiConstants.defaultHeaders,
    ),
  );

  final apiService = ApiService(dio);

  Get.put<RepositoryInterface>(
    Repository(
      localDataSource: LocalDataSource(),
      remoteDataSource: RemoteDataSource(apiService),
    ),
    permanent: true,
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
