import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:storyappsdicoding/ui/add/add_screen.dart';
import 'package:storyappsdicoding/ui/auth/reset_password/reset_password_screen.dart';
import 'package:storyappsdicoding/ui/map/pick_location_screen.dart';
import 'package:storyappsdicoding/ui/auth/auth_provider.dart';
import 'package:storyappsdicoding/ui/auth/login/login_screen.dart';
import 'package:storyappsdicoding/ui/auth/register/register_screen.dart';
import 'package:storyappsdicoding/ui/detail/detail_screen.dart';
import 'package:storyappsdicoding/ui/home/home_screen.dart';
import 'package:storyappsdicoding/ui/profile/profile_screen.dart';
import 'package:storyappsdicoding/ui/settings/setting_screen.dart';
import 'package:storyappsdicoding/ui/splash/splash_screen.dart';

class AppRouter with ChangeNotifier {
  static AppRouter? _instance;

  static AppRouter get instance {
    _instance ??= AppRouter._();
    return _instance!;
  }

  AppRouter._();

  static GoRouter createRouter(BuildContext context) {
    final AuthProvider authProvider = Provider.of(context, listen: false);

    return GoRouter(
      refreshListenable: authProvider,
      debugLogDiagnostics: true,
      routerNeglect: true,
      redirect: (context, state) {
        authProvider.isAuthenticated();
        final isLoggedIn = authProvider.isLoggedIn;
        final isLoginRoute = state.matchedLocation == '/login';
        final isRegisterRoute = state.matchedLocation == '/register';
        final isResetPasswordRoute = state.matchedLocation == '/reset';
        if (!isLoggedIn && !isLoginRoute && !isRegisterRoute &&!isResetPasswordRoute) {
          return '/login';
        } else if (isLoggedIn && (isLoginRoute || isRegisterRoute || isResetPasswordRoute)) {
          return '/home';
        } else {
          return null;
        }
      },
      initialLocation: '/login',
      routes: [
        GoRoute(
          path: '/login',
          name: 'login',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: LoginScreen(),
            );
          },
        ),
        GoRoute(
          path: '/splash',
          name: 'splash',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: SplashScreen(),
            );
          },
        ),
        GoRoute(
          path: '/reset',
          name: 'reset',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: ResetPasswordScreen(),
            );
          },
        ),

        GoRoute(
          path: '/register',
          name: 'register',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: RegisterScreen(),
            );
          },
        ),
        GoRoute(
          path: '/home',
          name: 'home',
          pageBuilder: (context, state) {
            return const MaterialPage(
              child: HomeScreen(),
            );
          },
          routes: [
            GoRoute(
              path: 'story-detail/:id',
              name: 'story-detail',
              pageBuilder: (context, state) {
                final id = state.pathParameters['id'];
                return MaterialPage(
                  child: DetailScreen(id: id!),
                );
              },
            ),
            GoRoute(
                path: 'add_story',
                name: 'add_story',
                pageBuilder: (context, state) {
                  return const MaterialPage(
                    child: AddScreen(),
                  );
                },
                routes: [
                  GoRoute(
                      path: 'pick-location',
                      name: 'pick-location',
                      pageBuilder: (context, state) {
                        return const MaterialPage(
                          child: PickLocationScreen(),
                        );
                      }),
                ]),
            GoRoute(
              path: 'settings',
              name: 'settings',
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: SettingsScreen(),
                );
              },
            ),
            GoRoute(
              path: 'profile',
              name: 'profile',
              pageBuilder: (context, state) {
                return const MaterialPage(
                  child: ProfileScreen(),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
