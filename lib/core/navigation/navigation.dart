import 'package:flutter/material.dart';
import 'package:spacera/core/models/rocket_list/rocket_response.dart';
import 'package:spacera/ui/shared/fade_page_route.dart';
import 'package:spacera/ui/views/rocket_detail/rocket_detail.dart';

class Navigate {
  static openDetailPage(
      {required BuildContext context, required RocketsResponse data}) {
    Navigator.push(
        context,
        FadePageRoute(
            fullscreenDialog: true,
            builder: (_) => RocketDetail(detail: data)));
  }
}
