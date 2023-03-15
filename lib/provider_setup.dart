import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacera/core/repositories/rocket_repository/rocket_repository_impl.dart';
import 'package:spacera/core/services/connectivity/connectivity_service_impl.dart';
import 'package:spacera/ui/views/rocket_detail/scroll_state_cubit.dart';

/// List of providers that provider transforms into a widget tree
/// with the main app as the child of that tree, so that the entire
/// app can use these streams anywhere there is a [BuildContext]
List<BlocProvider> providers = [
  ...independentServices,
  ...dependentServices,
  ...uiConsumableProviders
];

List<BlocProvider> independentServices = [];

List<BlocProvider> dependentServices = [];

List<BlocProvider> uiConsumableProviders = [
  BlocProvider<ConnectivityServiceImpl>(
    create: (context) => ConnectivityServiceImpl(),
  ),
  BlocProvider<RocketRepositoryImpl>(
    create: (context) => RocketRepositoryImpl(),
  ),
  BlocProvider<ScrollStateCubit>(
    create: (context) => ScrollStateCubit(),
  )
];
