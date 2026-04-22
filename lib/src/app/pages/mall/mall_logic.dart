import 'package:get/get.dart';
import 'mall_state.dart';
import '../../../data/models/product_model.dart';

class MallLogic extends GetxController {
  final MallState state = MallState();

  @override
  void onInit() {
    super.onInit();
    loadCategories();
    loadProducts();
  }

  void loadCategories() {
    state.categories.value = [];
  }

  void loadProducts() {
    state.isLoading.value = true;
    state.products.value = [];
    state.isLoading.value = false;
  }

  void selectCategory(int index) {
    state.selectedCategoryIndex.value = index;
  }

  List<ProductModel> getFilteredProducts() {
    if (state.selectedCategoryIndex.value == 0) {
      return state.products;
    }
    final categoryId = state.categories[state.selectedCategoryIndex.value].id;
    return state.products.where((p) => p.categoryId == categoryId).toList();
  }

  void goToProductDetail(int productId) {
    Get.toNamed('/product/$productId');
  }
}
