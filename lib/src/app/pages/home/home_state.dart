import 'package:get/get.dart';
import '../../../data/models/product_model.dart';
import '../../../data/models/category_model.dart';

class HomeState {
  final isDarkMode = false.obs;
  final currentLanguage = 'zh'.obs;
  final welcomeMessage = 'welcome'.tr.obs;

  final products = <ProductModel>[].obs;
  final categories = <CategoryModel>[].obs;
  final featuredProducts = <ProductModel>[].obs;
  final newProducts = <ProductModel>[].obs;
  final isLoading = false.obs;
  final error = ''.obs;
}