import '../../repository/user_repository.dart';

class LoginUseCase {
  final UserRepository _userRepository;

  const LoginUseCase(this._userRepository);

  Future<void> call({required String email, required String password}) =>
      _userRepository.login(email, password);
}
