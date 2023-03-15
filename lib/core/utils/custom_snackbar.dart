import 'package:flutter/cupertino.dart';
import 'package:spacera/core/models/snack_bar_request/confirm_snack_bar_request.dart';
import 'package:spacera/core/services/snackbar/snack_bar_service.dart';
import 'package:spacera/locator.dart';

class CustomSnackBar {
  final SnackBarService? _snackBarService = locator<SnackBarService>();

  // Snack bar Sample usage
  Future<void> showSnackBar(
      {required BuildContext context,
      required String text,
      VoidCallback? function,
      required String buttonText}) async {
    final request = ConfirmSnackBarRequest(
      (r) => r
        ..message = text
        ..onPressed = function
        ..buttonText = buttonText,
    );
    await _snackBarService!.showSnackBar(context, request);
  }
}
