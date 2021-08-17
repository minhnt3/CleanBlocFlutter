import '../../repository/user_repository.dart';

class GetHasLoginUseCase {
  final UserRepository _userRepository;

  const GetHasLoginUseCase(this._userRepository);

  bool call() => _userRepository.isLoggedIn;
}
