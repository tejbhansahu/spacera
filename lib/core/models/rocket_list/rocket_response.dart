import 'dart:convert';
/// name : "Falcon 1"
/// country : "Republic of the Marshall Islands"
/// first_stage_engines : 1
/// second_stage_engines : 1
/// flickr_images : ["https://imgur.com/DaCfMsj.jpg","https://imgur.com/azYafd8.jpg"]
/// type : "rocket"
/// active : false
/// stages : 2
/// boosters : 0
/// cost_per_launch : 6700000
/// success_rate_pct : 40
/// first_flight : "2006-03-24"
/// company : "SpaceX"
/// wikipedia : "https://en.wikipedia.org/wiki/Falcon_1"
/// description : "The Falcon 1 was an expendable launch system privately developed and manufactured by SpaceX during 2006-2009. On 28 September 2008, Falcon 1 became the first privately-developed liquid-fuel launch vehicle to go into orbit around the Earth."
/// id : "5e9d0d95eda69955f709d1eb"
/// height : 5.5
/// diameter : 5.5
/// mass : 30146.4

RocketsResponse rocketsResponseFromJson(String str) => RocketsResponse.fromJson(json.decode(str));
String rocketsResponseToJson(RocketsResponse data) => json.encode(data.toJson());
class RocketsResponse {
  RocketsResponse({
      String? name, 
      String? country, 
      num? firstStageEngines, 
      num? secondStageEngines, 
      List<String>? flickrImages, 
      String? type, 
      bool? active, 
      num? stages, 
      num? boosters, 
      num? costPerLaunch, 
      num? successRatePct, 
      String? firstFlight, 
      String? company, 
      String? wikipedia, 
      String? description, 
      String? id, 
      num? height, 
      num? diameter, 
      num? mass,}){
    _name = name;
    _country = country;
    _firstStageEngines = firstStageEngines;
    _secondStageEngines = secondStageEngines;
    _flickrImages = flickrImages;
    _type = type;
    _active = active;
    _stages = stages;
    _boosters = boosters;
    _costPerLaunch = costPerLaunch;
    _successRatePct = successRatePct;
    _firstFlight = firstFlight;
    _company = company;
    _wikipedia = wikipedia;
    _description = description;
    _id = id;
    _height = height;
    _diameter = diameter;
    _mass = mass;
}

  RocketsResponse.fromJson(dynamic json) {
    _name = json['name'];
    _country = json['country'];
    _firstStageEngines = json['first_stage_engines'];
    _secondStageEngines = json['second_stage_engines'];
    _flickrImages = json['flickr_images'] != null ? json['flickr_images'].cast<String>() : [];
    _type = json['type'];
    _active = json['active'];
    _stages = json['stages'];
    _boosters = json['boosters'];
    _costPerLaunch = json['cost_per_launch'];
    _successRatePct = json['success_rate_pct'];
    _firstFlight = json['first_flight'];
    _company = json['company'];
    _wikipedia = json['wikipedia'];
    _description = json['description'];
    _id = json['id'];
    _height = json['height'];
    _diameter = json['diameter'];
    _mass = json['mass'];
  }
  String? _name;
  String? _country;
  num? _firstStageEngines;
  num? _secondStageEngines;
  List<String>? _flickrImages;
  String? _type;
  bool? _active;
  num? _stages;
  num? _boosters;
  num? _costPerLaunch;
  num? _successRatePct;
  String? _firstFlight;
  String? _company;
  String? _wikipedia;
  String? _description;
  String? _id;
  num? _height;
  num? _diameter;
  num? _mass;
RocketsResponse copyWith({  String? name,
  String? country,
  num? firstStageEngines,
  num? secondStageEngines,
  List<String>? flickrImages,
  String? type,
  bool? active,
  num? stages,
  num? boosters,
  num? costPerLaunch,
  num? successRatePct,
  String? firstFlight,
  String? company,
  String? wikipedia,
  String? description,
  String? id,
  num? height,
  num? diameter,
  num? mass,
}) => RocketsResponse(  name: name ?? _name,
  country: country ?? _country,
  firstStageEngines: firstStageEngines ?? _firstStageEngines,
  secondStageEngines: secondStageEngines ?? _secondStageEngines,
  flickrImages: flickrImages ?? _flickrImages,
  type: type ?? _type,
  active: active ?? _active,
  stages: stages ?? _stages,
  boosters: boosters ?? _boosters,
  costPerLaunch: costPerLaunch ?? _costPerLaunch,
  successRatePct: successRatePct ?? _successRatePct,
  firstFlight: firstFlight ?? _firstFlight,
  company: company ?? _company,
  wikipedia: wikipedia ?? _wikipedia,
  description: description ?? _description,
  id: id ?? _id,
  height: height ?? _height,
  diameter: diameter ?? _diameter,
  mass: mass ?? _mass,
);
  String? get name => _name;
  String? get country => _country;
  num? get firstStageEngines => _firstStageEngines;
  num? get secondStageEngines => _secondStageEngines;
  List<String>? get flickrImages => _flickrImages;
  String? get type => _type;
  bool? get active => _active;
  num? get stages => _stages;
  num? get boosters => _boosters;
  num? get costPerLaunch => _costPerLaunch;
  num? get successRatePct => _successRatePct;
  String? get firstFlight => _firstFlight;
  String? get company => _company;
  String? get wikipedia => _wikipedia;
  String? get description => _description;
  String? get id => _id;
  num? get height => _height;
  num? get diameter => _diameter;
  num? get mass => _mass;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['country'] = _country;
    map['first_stage_engines'] = _firstStageEngines;
    map['second_stage_engines'] = _secondStageEngines;
    map['flickr_images'] = _flickrImages;
    map['type'] = _type;
    map['active'] = _active;
    map['stages'] = _stages;
    map['boosters'] = _boosters;
    map['cost_per_launch'] = _costPerLaunch;
    map['success_rate_pct'] = _successRatePct;
    map['first_flight'] = _firstFlight;
    map['company'] = _company;
    map['wikipedia'] = _wikipedia;
    map['description'] = _description;
    map['id'] = _id;
    map['height'] = _height;
    map['diameter'] = _diameter;
    map['mass'] = _mass;
    return map;
  }

}