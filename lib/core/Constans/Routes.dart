import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mars_photos/Data/Repos/Repo.dart';
import 'package:mars_photos/Logic/cubit/marsphotobloc_cubit.dart';
import 'package:mars_photos/UI/LandingPage.dart';
import 'package:mars_photos/UI/Main_Screen.dart';
import 'package:go_router/go_router.dart';

GoRouter router() {
  return GoRouter(
    initialLocation: "/",
    routes: [
      GoRoute(
        path: "/",
        builder: (context, state) => BlocProvider<MarsphotoblocCubit>.value(
          value: MarsphotoblocCubit(repo: Repo()),
          child: Landing(),
        ),
      ),
      GoRoute(
        path: "/MainScreen",
        builder: (context, state) => BlocProvider<MarsphotoblocCubit>.value(
          value: MarsphotoblocCubit(repo: Repo()),
          child: MainScreen(
         
          ),
        ),
      ),
    ],
  );
}
