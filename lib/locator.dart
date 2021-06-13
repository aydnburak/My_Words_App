import 'package:get_it/get_it.dart';
import 'package:my_words_app/repositorys/auth_repository.dart';
import 'package:my_words_app/repositorys/firestore_repository.dart';
import 'package:my_words_app/services/auth_service.dart';
import 'package:my_words_app/services/firestore_service.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => AuthService());
  locator.registerLazySingleton(() => AuthRepository());
  locator.registerLazySingleton(() => FirestoreService());
  locator.registerLazySingleton(() => FirestoreRepository());
}
