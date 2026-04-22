import 'package:get/get.dart';
import '../../../data/models/product_model.dart';
import '../../../data/models/category_model.dart';

class MallState {
  final RxList<ProductModel> products = <ProductModel>[].obs;
  final RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final RxInt selectedCategoryIndex = 0.obs;
  final RxBool isLoading = false.obs;
  final RxString error = ''.obs;
}
