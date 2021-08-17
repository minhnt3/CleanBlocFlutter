import '../../repository/app_repository.dart';

class SaveIsDarkModeUseCase {
  final AppRepository _appRepository;

  SaveIsDarkModeUseCase(this._appRepository);

  Future<bool> call(bool isDarkMode) => _appRepository.saveIsDarkMode(isDarkMode);
}
