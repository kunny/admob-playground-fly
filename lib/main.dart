import 'package:admob_playground/page/destination_list_page.dart';
import 'package:admob_playground/page/destination_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'destination.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // TODO: Initialize Google Mobile Ads SDK

  runApp(const MyApp());
}

final _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const DestinationListPage(),
      routes: [
        GoRoute(
          path: 'destination',
          builder: (context, state) {
            final destination = state.extra as Destination;
            return DestinationPage(destination: destination);
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routerConfig: _router,
    );
  }
}
