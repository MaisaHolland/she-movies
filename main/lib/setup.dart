import 'package:data/repositories/movies_repository.dart';
import 'package:data/repositories/movies_repository_interface.dart';
import 'package:data/services/storage_service/storage_service.dart';
import 'package:data/services/storage_service/storage_service_interface.dart';
import 'package:get_it/get_it.dart';

GetIt getIt = GetIt.instance;

void setup(){
  getIt.registerSingleton<IMoviesRepository>(MoviesRepository());
  getIt.registerSingleton<IStorageService>(SharedStorageService());
}