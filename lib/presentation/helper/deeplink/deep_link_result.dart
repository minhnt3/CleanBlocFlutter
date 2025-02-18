import 'package:meta/meta.dart';

@sealed
abstract class DeepLinkResult {}

class UnknownDeepLink extends DeepLinkResult {
  UnknownDeepLink();
}

class ResetPasswordDeepLink extends DeepLinkResult {
  final String resetPasswordToken;

  ResetPasswordDeepLink(this.resetPasswordToken);
}
