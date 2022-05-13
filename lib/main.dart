import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/screens/about_app_screen.dart';
import 'package:notes/screens/categories_screen.dart';
import 'package:notes/screens/category_notes_screen.dart';
import 'package:notes/screens/create_or_update_category_screen.dart';
import 'package:notes/screens/login_screen.dart';
import 'package:notes/screens/profile_screen.dart';
import 'package:notes/screens/settings_screen.dart';
import 'package:notes/screens/sign_up_screen.dart';
import 'package:notes/screens/create_or_update_note_screen.dart';
import 'screens/splash_screen.dart';
import 'utils/routes.dart';

void main() {
  runApp(const LauncherApp());
}

class LauncherApp extends StatefulWidget {
  const LauncherApp({Key? key}) : super(key: key);

  @override
  State<LauncherApp> createState() => _LauncherAppState();
}

class _LauncherAppState extends State<LauncherApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
        initialRoute: Routes.SPLASH_SCREEN,
        getPages: [
          GetPage(name: Routes.SPLASH_SCREEN, page: () => SplashScreen()),
          GetPage(name: Routes.LOGIN_SCREEN, page: () => LoginScreen()),
          GetPage(name: Routes.SIGN_UP_SCREEN, page: () => SignUpScreen()),
          GetPage(name: Routes.CATEGORIES_SCREEN, page: () => CategoriesScreen()),
          GetPage(name: Routes.CATEGORY_NOTES_SCREEN, page: () => CategoryNotesScreen()),
          GetPage(name: Routes.SETTINGS_SCREEN, page: () => SettingsScreen()),
          GetPage(name: Routes.PROFILE_SCREEN, page: () => ProfileScreen()),
          GetPage(name: Routes.CREATE_OR_UPDATE_NOTE_SCREEN, page: () => CreateOrUpdateCategoryScreen()),
          GetPage(name: Routes.CREATE_OR_UPDATE_CATEGORY_SCREEN, page: () => CreateOrUpdateNoteScreen()),
          GetPage(name: Routes.ABOUT_APP_SCREEN, page: () => AboutAppScreen()),
        ]
    );
  }
}

