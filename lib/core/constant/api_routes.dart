/// List of api end points
class ApiRoutes {
  ApiRoutes._();

  static const getRocketsList = "/rockets";
  static rocketDetail(id) => "/rockets/$id";
}
