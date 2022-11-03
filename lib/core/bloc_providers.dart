import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ice_code_task/modules/games/cubit/games_cubit.dart';
import 'package:ice_code_task/modules/games/data/reposatory/games_repo_impl.dart';

import '../modules/map/cubit/location_cubit.dart';
import '../modules/map/data/location_repo_impl.dart';
import 'app_cubit/app_cubit.dart';

class BlocProviders {
  static List<BlocProvider> providers(BuildContext context) => [
        BlocProvider<AppCubit>(
          create: (context) => AppCubit(),
        ),
        BlocProvider<LocationCubit>(
          create: (context) => LocationCubit(
            locationRepo: LocationRepoImp(),
          ),
          lazy: true,
        ),
        BlocProvider<GamesCubit>(
          create: (context) => GamesCubit(
            gamesRepo: GamesRepoImpl(),
          ),
          lazy: true,
        ),
      ];
}
