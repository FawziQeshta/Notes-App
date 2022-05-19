import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:notes/bindings/auth_binding.dart';
import 'package:notes/bindings/category_binding.dart';
import 'package:notes/bindings/profile_binding.dart';
import 'package:notes/screens/about_app_screen.dart';
import 'package:notes/screens/about_course_screen.dart';
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

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
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
          GetPage(name: Routes.SPLASH_SCREEN, page: () => const SplashScreen(), binding: AuthBinding()),
          GetPage(name: Routes.LOGIN_SCREEN, page: () => const LoginScreen()),
          GetPage(name: Routes.SIGN_UP_SCREEN, page: () => const SignUpScreen()),
          GetPage(name: Routes.CATEGORIES_SCREEN, page: () => const CategoriesScreen()),
          GetPage(name: Routes.CATEGORY_NOTES_SCREEN, page: () => CategoryNotesScreen(categoryId: '',)),
          GetPage(name: Routes.SETTINGS_SCREEN, page: () => const SettingsScreen()),
          GetPage(name: Routes.PROFILE_SCREEN, page: () => const ProfileScreen()),
          GetPage(name: Routes.CREATE_OR_UPDATE_NOTE_SCREEN, page: () => const CreateOrUpdateCategoryScreen()),
          GetPage(name: Routes.CREATE_OR_UPDATE_CATEGORY_SCREEN, page: () => const CreateOrUpdateNoteScreen()),
          GetPage(name: Routes.ABOUT_APP_SCREEN, page: () => const AboutAppScreen()),
          GetPage(name: Routes.ABOUT_COURSE_SCREEN, page: () => const AboutCourseScreen()),
        ]
    );
  }
}

