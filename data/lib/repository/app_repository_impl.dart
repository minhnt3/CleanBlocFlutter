import 'source/local/app_local_data_source.dart';
import 'package:domain/domain.dart';

class AppRepositoryImpl extends AppRepository {
  final AppLocalDataSource _appLocalDataSource;

  AppRepositoryImpl(this._appLocalDataSource);

  @override
  Future<bool> saveIsDarkMode(bool isDarkMode) => _appLocalDataSource.saveIsDarkMode(isDarkMode);

  @override
  bool get isDarkMode => _appLocalDataSource.isDarkMode;
}
