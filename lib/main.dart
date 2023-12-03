import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:go_router/go_router.dart';
import 'package:jeomgymjeok_gwabuha/screens/app.dart';
import 'package:jeomgymjeok_gwabuha/screens/calender.dart';
import 'package:jeomgymjeok_gwabuha/screens/finding_result.dart';
import 'package:jeomgymjeok_gwabuha/screens/graph.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
      overlays: [SystemUiOverlay.top]);
  await initializeDateFormatting();

  runApp(const ProviderScope(child: Main()));
}

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _rootNavigatorCalendar =
    GlobalKey<NavigatorState>(debugLabel: 'calendar');
final _rootNavigatorGraph = GlobalKey<NavigatorState>(debugLabel: 'graph');

final _router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: <RouteBase>[
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return AppScreen(
          navigationShell: navigationShell,
        );
      },
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          navigatorKey: _rootNavigatorCalendar,
          routes: [
            GoRoute(
              path: '/',
              name: 'calendar',
              builder: (context, state) {
                return CalendarScreen(key: state.pageKey);
              },
            )
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _rootNavigatorGraph,
          routes: [
            GoRoute(
                path: '/graph',
                name: 'graph',
                builder: (context, state) {
                  return GraphScreen(key: state.pageKey);
                },
                routes: [
                  GoRoute(
                    path: 'find-result',
                    name: 'find-result',
                    builder: (context, state) {
                      String name = state.extra as String;
                      return FindingResult(
                          key: state.pageKey, workoutName: name);
                    },
                  )
                ])
          ],
        ),
      ],
    )
  ],
);

class Main extends StatelessWidget {
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
      debugShowCheckedModeBanner: false,
      title: 'Go Router Example',
    );
  }
}
