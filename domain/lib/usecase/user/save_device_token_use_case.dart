import '../../repository/user_repository.dart';

class SaveDeviceTokenUseCase {
  final UserRepository _userRepository;

  SaveDeviceTokenUseCase(this._userRepository);

  Future<bool> call(String deviceToken) => _userRepository.saveDeviceToken(deviceToken);
}
