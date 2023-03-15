import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:logging/logging.dart';
import 'package:spacera/core/data_sources/rockets/rockets_local_data_source.dart';
import 'package:spacera/core/data_sources/rockets/rockets_remote_data_source.dart';
import 'package:spacera/core/exceptions/cache_exception.dart';
import 'package:spacera/core/exceptions/network_exception.dart';
import 'package:spacera/core/exceptions/repository_exception.dart';
import 'package:spacera/core/models/rocket_list/rocket_response.dart';
import 'package:spacera/core/repositories/rocket_repository/rocket_repository.dart';
import 'package:spacera/core/services/connectivity/connectivity_service.dart';
import 'package:spacera/locator.dart';

part '../../../ui/views/home/rocket_data_state.dart';

class RocketRepositoryImpl extends Cubit<RocketDataState>
    implements RocketRepository {
  final RocketsRemoteDataSource? remoteDataSource =
      locator<RocketsRemoteDataSource>();
  final RocketsLocalDataSource? localDataSource =
      locator<RocketsLocalDataSource>();
  final ConnectivityService? connectivityService =
      locator<ConnectivityService>();

  final _log = Logger('MovieRepositoryImpl');

  RocketRepositoryImpl() : super(RocketDataLoading()) {
    fetchRocketsList();
  }

  @override
  Future<List<RocketsResponse>> fetchRocketsList() async {
    emit(RocketDataLoading());
    try {
      if (await connectivityService!.isConnected) {
        final rocketList = await remoteDataSource!.fetchRockets();
        await localDataSource!.cacheRockets(rocketList);
        emit(RocketDataSuccess(rocketList: rocketList));
        return rocketList;
      } else {
        final rocketList = await localDataSource!.fetchRockets();
        emit(RocketDataSuccess(rocketList: rocketList));
        return rocketList;
      }
    } on NetworkException catch (e) {
      _log.severe('Failed to fetch movies list remotely');
      emit(RocketDataError());
      throw RepositoryException(e.message);
    } on CacheException catch (e) {
      _log.severe('Failed to fetch movies list locally');
      emit(RocketDataError());
      throw RepositoryException(e.message);
    }
  }
}
