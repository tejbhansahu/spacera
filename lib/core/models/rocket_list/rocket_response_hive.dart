import 'package:hive/hive.dart';
import 'rocket_response.dart';

part 'rocket_response_hive.g.dart';

/// A Hive Database compatible Rocket List Model
///   - @HiveType(typeId: unique) is necessary for each HiveObject
///   - @HiveField(unique) is necessary if you need the object to persist
@HiveType(typeId: 1)
class RocketsListHive extends HiveObject {
  @HiveField(0)
  final String? name;

  @HiveField(1)
  final String? country;

  @HiveField(2)
  final num? firstStageEngines;

  @HiveField(3)
  num? secondStageEngines;

  @HiveField(4)
  final List<String>? flickrImages;

  @HiveField(5)
  final String? type;

  @HiveField(6)
  final bool? active;

  @HiveField(7)
  final num? stages;

  @HiveField(8)
  final num? boosters;

  @HiveField(9)
  final num? costPerLaunch;

  @HiveField(10)
  final num? successRatePct;

  @HiveField(11)
  final String? firstFlight;

  @HiveField(12)
  final String? company;

  @HiveField(13)
  final String? wikipedia;

  @HiveField(14)
  final String? description;

  @HiveField(15)
  final String? id;

  @HiveField(16)
  final num? height;

  @HiveField(17)
  final num? diameter;

  @HiveField(18)
  final num? mass;

  RocketsListHive(
      {this.height,
      this.diameter,
      this.mass,
      this.flickrImages,
      this.name,
      this.firstStageEngines,
      this.secondStageEngines,
      this.type,
      this.active,
      this.stages,
      this.boosters,
      this.costPerLaunch,
      this.successRatePct,
      this.firstFlight,
      this.country,
      this.company,
      this.wikipedia,
      this.description,
      this.id});

  factory RocketsListHive.fromModel(RocketsResponse rocket) {
    return RocketsListHive(
        height: rocket.height,
        diameter: rocket.diameter,
        flickrImages: rocket.flickrImages,
        firstStageEngines: rocket.firstStageEngines,
        mass: rocket.mass,
        secondStageEngines: rocket.secondStageEngines,
        name: rocket.name,
        type: rocket.type,
        active: rocket.active,
        stages: rocket.stages,
        boosters: rocket.boosters,
        costPerLaunch: rocket.costPerLaunch,
        successRatePct: rocket.successRatePct,
        firstFlight: rocket.firstFlight,
        country: rocket.country,
        company: rocket.company,
        wikipedia: rocket.wikipedia,
        description: rocket.description,
        id: rocket.id);
  }

  factory RocketsListHive.fromMap(Map<String, dynamic> map) {
    return RocketsListHive(
      height: map['height'],
      diameter: map['diameter'],
      mass: map['mass'],
      secondStageEngines: map['second_stage_engines'],
      firstStageEngines: map['first_stage_engines'],
      flickrImages: map['flickr_images'].cast<String>(),
      name: map['name'],
      type: map['type'],
      active: map['active'],
      stages: map['stages'],
      boosters: map['boosters'],
      costPerLaunch: map['cost_per_launch'],
      successRatePct: map['success_rate_pct'],
      firstFlight: map['first_flight'],
      country: map['country'],
      company: map['company'],
      wikipedia: map['wikipedia'],
      description: map['description'],
      id: map['id'],
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{};
    map['height'] = height;
    map['diameter'] = diameter;
    map['mass'] = mass;
    map['first_stage_engines'] = firstStageEngines;
    map['second_stage_engines'] = secondStageEngines;
    map['flickr_images'] = flickrImages;
    map['name'] = name;
    map['type'] = type;
    map['active'] = active;
    map['stages'] = stages;
    map['boosters'] = boosters;
    map['cost_per_launch'] = costPerLaunch;
    map['success_rate_pct'] = successRatePct;
    map['first_flight'] = firstFlight;
    map['country'] = country;
    map['company'] = company;
    map['wikipedia'] = wikipedia;
    map['description'] = description;
    map['id'] = id;
    return map;
  }

  @override
  int get hashCode =>
      height.hashCode ^
      diameter.hashCode ^
      mass.hashCode ^
      firstStageEngines.hashCode ^
      secondStageEngines.hashCode ^
      flickrImages.hashCode ^
      name.hashCode ^
      type.hashCode ^
      active.hashCode ^
      stages.hashCode ^
      boosters.hashCode ^
      costPerLaunch.hashCode ^
      successRatePct.hashCode ^
      firstFlight.hashCode ^
      country.hashCode ^
      company.hashCode ^
      wikipedia.hashCode ^
      description.hashCode ^
      id.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is RocketsListHive &&
          height == other.height &&
          diameter == other.diameter &&
          mass == other.mass &&
          firstStageEngines == other.firstStageEngines &&
          secondStageEngines == other.secondStageEngines &&
          flickrImages == other.flickrImages &&
          name == other.name &&
          type == other.type &&
          active == other.active &&
          stages == other.stages &&
          boosters == other.boosters &&
          costPerLaunch == other.costPerLaunch &&
          successRatePct == other.successRatePct &&
          country == other.country &&
          company == other.company &&
          wikipedia == other.wikipedia &&
          description == other.description &&
          id == other.id;
}
