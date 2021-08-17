import 'package:data/di/data_source_module.dart';
import 'package:data/di/local_storage_module.dart';
import 'package:data/di/mapper_module.dart';
import 'package:data/di/network_module.dart';
import 'package:data/di/repository_module.dart';
import 'package:domain/domain.dart';
import 'package:get/get.dart';

class CoreModule extends Bindings {
  @override
  void dependencies() {
    MapperModule().dependencies();
    LocalStorageModule().dependencies();
    NetworkModule().dependencies();
    DataSourceModule().dependencies();
    RepositoryModule().dependencies();
    UseCaseModule().dependencies();
  }
}