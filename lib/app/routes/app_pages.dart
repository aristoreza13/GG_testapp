import 'package:get/get.dart';

import '../modules/add_item/bindings/add_item_binding.dart';
import '../modules/add_item/views/add_item_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ADD_ITEM,
      page: () => const AddItemView(),
      binding: AddItemBinding(),
    ),
  ];
}
