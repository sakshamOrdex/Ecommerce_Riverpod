import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shopy/providers/theme_provider.dart';
import 'package:shopy/screens/cart_page.dart';
import 'package:shopy/screens/home.dart';
import 'package:shopy/screens/login.dart';

void main() {
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeNotifierProvider);
    return ProviderScope(
      child: MaterialApp(
        theme: ThemeData.light(),
        darkTheme: ThemeData.dark(),
        themeMode: themeMode,
        debugShowCheckedModeBanner: false,
        title: "Shopy",
        home: Login(),
      ),
    );
  }
}
