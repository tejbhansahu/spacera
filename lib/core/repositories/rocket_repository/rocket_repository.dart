import 'package:spacera/core/models/rocket_list/rocket_response.dart';

abstract class RocketRepository {
  Future<List<RocketsResponse>> fetchRocketsList();
}
