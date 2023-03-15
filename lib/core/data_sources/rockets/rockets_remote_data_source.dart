import 'package:spacera/core/constant/api_routes.dart';
import 'package:spacera/core/models/rocket_list/rocket_response.dart';
import 'package:spacera/core/services/http/http_service.dart';
import 'package:spacera/locator.dart';

abstract class RocketsRemoteDataSource {
  Future<List<RocketsResponse>> fetchRockets();
}

class RocketsRemoteDataSourceImpl implements RocketsRemoteDataSource {
  final HttpService? httpService = locator<HttpService>();

  @override
  Future<List<RocketsResponse>> fetchRockets() async {
    final rocketsJsonData =
        await httpService!.getHttp(route: ApiRoutes.getRocketsList);
    List<RocketsResponse> rocketsResponse = [];
    rocketsJsonData.forEach((json) => rocketsResponse.add(RocketsResponse(
        active: json['active'],
        boosters: json['boosters'],
        company: json['company'],
        costPerLaunch: json['cost_per_launch'],
        country: json['country'],
        description: json['description'],
        diameter: json['diameter']['feet'],
        firstFlight: json['first_flight'],
        firstStageEngines: json['first_stage']['engines'],
        flickrImages: List<String>.from(json["flickr_images"].map((x) => x)),
        height: json['height']['feet'],
        id: json['id'],
        mass: json['mass']['kg'],
        name: json['name'],
        secondStageEngines: json['second_stage']['engines'],
        stages: json['stages'],
        successRatePct: json['success_rate_pct'],
        type: json['type'],
        wikipedia: json['wikipedia'])));
    return rocketsResponse;
  }
}
