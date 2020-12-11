import 'package:bookingsAfricaApp/network_services/home_service.dart';
import 'package:bookingsAfricaApp/ui/view_model.dart/home_screenVm.dart';
import 'package:bookingsAfricaApp/ui/view_model.dart/splash_screenVM.dart';
import 'package:get_it/get_it.dart';
import 'core/provider_model/base_provider_model.dart';
import 'network_services/shared_preference.dart';

GetIt locator = GetIt.instance;

void setUpLocator() {
  locator.registerLazySingleton(() => BaseProviderModel());
  locator.registerFactory(() => SharedPref());
  locator.registerLazySingleton(() => HomeScreenVM());
  locator.registerLazySingleton(() => SplashScreenVM());
  locator.registerLazySingleton(() => HomeApi());
}
