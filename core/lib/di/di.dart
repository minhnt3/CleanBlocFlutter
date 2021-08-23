import 'package:data/data.dart' as data;
import 'package:domain/domain.dart' as domain;

Future<void> configureInjection() async {
  await data.configureInjection();
  await domain.configureInjection();
}