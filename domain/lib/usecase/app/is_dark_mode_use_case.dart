import '../../repository/app_repository.dart';

class IsDarkModeUseCase {
  final AppRepository _appRepository;

  IsDarkModeUseCase(this._appRepository);

  bool call() => _appRepository.isDarkMode;
}
