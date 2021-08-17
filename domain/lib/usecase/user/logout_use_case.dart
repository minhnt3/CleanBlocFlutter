import '../../repository/user_repository.dart';

class LogoutUseCase {
  final UserRepository _userRepository;

  const LogoutUseCase(this._userRepository);

  Future<void> call() => _userRepository.logout();
}
