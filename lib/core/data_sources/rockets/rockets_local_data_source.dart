import 'package:hive/hive.dart';
import 'package:spacera/core/constant/local_storage_keys.dart';
import 'package:spacera/core/exceptions/cache_exception.dart';
import 'package:spacera/core/models/rocket_list/rocket_response.dart';
import 'package:spacera/core/models/rocket_list/rocket_response_hive.dart';
import 'package:spacera/core/utils/file_helper.dart';
import 'package:spacera/locator.dart';

abstract class RocketsLocalDataSource {
  Future<void> init();

  Future<List<RocketsResponse>> fetchRockets();

  Future<void> cacheRockets(List<RocketsResponse> rocketList);
}

class RocketsLocalDataSourceImpl implements RocketsLocalDataSource {
  final FileHelper _fileHelper = locator<FileHelper>();
  final HiveInterface _hiveService = locator<HiveInterface>();

  bool get _isBoxOpen => _hiveService.isBoxOpen(LocalStorageKeys.rocketsList);

  Box<RocketsListHive> get _rocketsBox =>
      _hiveService.box<RocketsListHive>(LocalStorageKeys.rocketsList);

  @override
  Future<void> init() async {
    final path = await _fileHelper.getApplicationDocumentsDirectoryPath();
    _hiveService.init(path);
    _hiveService.registerAdapter<RocketsListHive>(RocketsListHiveAdapter());
    if (!_isBoxOpen) {
      await _hiveService.openBox<RocketsListHive>(LocalStorageKeys.rocketsList);
    }
  }

  @override
  Future<List<RocketsResponse>> fetchRockets() async {
    if (!_isBoxOpen) {
      await _hiveService.openBox<RocketsListHive>(LocalStorageKeys.rocketsList);
    }
    if (_rocketsBox.isEmpty) {
      throw const CacheException('No rockets list found in cache');
    }
    return _rocketsBox.values
        .map<RocketsResponse>((rocketsListHive) =>
            RocketsResponse.fromJson(rocketsListHive.toMap()))
        .toList();
  }

  @override
  Future<void> cacheRockets(List<RocketsResponse> rocketList) async {
    final rocketsMap = <String, RocketsListHive>{};
    for (var rocket in rocketList) {
      rocketsMap.addAll({rocket.id!: RocketsListHive.fromModel(rocket)});
    }
    await _rocketsBox.putAll(rocketsMap);
  }
}
