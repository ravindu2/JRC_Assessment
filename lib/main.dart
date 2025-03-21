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
import 'package:jrc_assement/themes/argument_const.dart';

void main() async {
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

  final repository = Get.find<RepositoryInterface>();
  bool isLoggedIn = await repository.isLoggedIn();
  String initialRoute = isLoggedIn ? AppRoutes.jobs : AppRoutes.login;

  runApp(MyApp(initialRoute: initialRoute));
}

class MyApp extends StatelessWidget {
  final String initialRoute;

  const MyApp({
    super.key,
    required this.initialRoute,
  });

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JRC Assessment',
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('en', ''),
      ],
      initialRoute: initialRoute,
      getPages: AppPages.pages,
    );
  }
}
