import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:storyappsdicoding/repository/auth_repository.dart';
import 'package:storyappsdicoding/repository/story_repository.dart';
import 'package:storyappsdicoding/routes/go_router.dart';
import 'package:storyappsdicoding/ui/add/upload_provider.dart';
import 'package:storyappsdicoding/ui/auth/auth_provider.dart';
import 'package:storyappsdicoding/ui/detail/detail_provider.dart';
import 'package:storyappsdicoding/ui/home/home_provider.dart';
import 'package:storyappsdicoding/ui/settings/setting_provider.dart';
import 'package:storyappsdicoding/ui/splash/splash_screen_provider.dart';
import 'package:storyappsdicoding/utils/common.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const StoryApp());
}

class StoryApp extends StatefulWidget {
  const StoryApp({super.key});

  @override
  State<StoryApp> createState() => _StoryAppState();
}

class _StoryAppState extends State<StoryApp> {
  late AuthRepository _authRepository;
  late StoryRepository _storyRepository;

  @override
  void initState() {
    _authRepository = AuthRepositoryImpl(client: http.Client());
    _storyRepository = StoryRepositoryImpl(client: http.Client());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SplashScreenProvider>(
          create: (_) => SplashScreenProvider(),
        ),
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(authRepository: _authRepository),
        ),
        ChangeNotifierProvider<HomeProvider>(
          create: (_) => HomeProvider(storyRepository: _storyRepository),
        ),
        ChangeNotifierProvider<DetailProvider>(
          create: (_) => DetailProvider(
              storyRepository: _storyRepository, context: context),
        ),
        ChangeNotifierProvider<UploadProvider>(
          create: (_) => UploadProvider(storyRepository: _storyRepository),
        ),
        ChangeNotifierProvider<SettingProvider>(
          create: (_) => SettingProvider(),
        ),
      ],
      child: const App(),
    );
  }
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    final goRouter = AppRouter.createRouter(context);
    return Consumer<SettingProvider>(builder: (context, lang, _) {
      return MaterialApp.router(
        localizationsDelegates: const [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        locale: lang.locale,
        supportedLocales: const [
          Locale('en', 'US'),
          Locale('id', 'ID'),
          Locale('ar', 'AR'),
        ],
        debugShowCheckedModeBanner: false,
        title: 'Story App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        routeInformationParser: goRouter.routeInformationParser,
        routeInformationProvider: goRouter.routeInformationProvider,
        routerDelegate: goRouter.routerDelegate,
      );
    });
  }
}
