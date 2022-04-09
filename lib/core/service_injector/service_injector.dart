import 'package:food_app/core/services/service_exports.dart';

class ServiceInjector {
  RouterService routerService = RouterService();
  PersistenceStorageservice persistenceStorageservice =
      PersistenceStorageservice();
  UtilityService utilityService = UtilityService();
  FoodService foodService = FoodService();
}

ServiceInjector si = ServiceInjector();
