import 'package:etiya_case_study/locator.dart';
import 'package:etiya_case_study/presentation/widgets/game_detail/bloc/game_detail_bloc.dart';
import 'package:etiya_case_study/presentation/widgets/game_filter/bloc/platform_filter_bloc.dart';
import 'package:etiya_case_study/presentation/widgets/game_list/bloc/game_bloc.dart';
import 'package:etiya_case_study/presentation/widgets/game_sorting/bloc/list_ordering_bloc.dart';
import 'package:etiya_case_study/router/routes.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  setupLocator();

  runApp(const MyApp());
}

//Autoroute
final _appRouter = AppRouter();

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<GameBloc>(
          create: (BuildContext context) => GameBloc(),
        ),
        BlocProvider<GameDetailBloc>(
          create: (BuildContext context) => GameDetailBloc(),
        ),
        BlocProvider<PlatformFilterBloc>(
          create: (BuildContext context) =>
              PlatformFilterBloc()..add(const FetchPlatformFilterEvent()),
        ),
        BlocProvider<ListOrderingBloc>(
          create: (BuildContext context) =>
              ListOrderingBloc()..add(const FetchOrderingEvent()),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerDelegate: _appRouter.delegate(),
        routeInformationParser: _appRouter.defaultRouteParser(),
        title: 'Material App',
      ),
    );
  }
}
