import 'package:get/get.dart';
import '../../../core/services/theme_service.dart';
import '../../../core/services/localization_service.dart';
import '../../../data/models/product_model.dart';
import '../../../data/models/category_model.dart';
import 'home_state.dart';

class HomeLogic extends GetxController {
  final HomeState state = HomeState();
  late ThemeService _themeService;

  @override
  void onInit() {
    super.onInit();
    _themeService = Get.find<ThemeService>();
    updateState();
    getProducts();
    getCategories();
  }

  void updateState() {
    state.isDarkMode.value = _themeService.isDarkMode;
    state.currentLanguage.value = Get.locale?.languageCode ?? 'zh';
  }

  void toggleTheme() {
    _themeService.toggleTheme();
    updateState();
  }

  void toggleLanguage() {
    LocalizationService.toggleLanguage();
    updateState();
  }

  Future<void> getProducts() async {
    state.isLoading.value = true;
    state.error.value = '';

    try {
      await Future.delayed(const Duration(seconds: 1));

      final mockProducts = [
        ProductModel(
          id: 1,
          name: 'iPhone 15 Pro',
          description: '最新款 iPhone，搭载 A17 Pro 芯片',
          price: 7999.00,
          originalPrice: 8999.00,
          stock: 100,
          image: 'https://picsum.photos/200/200?random=1',
          images: [
            'https://picsum.photos/200/200?random=1',
            'https://picsum.photos/200/200?random=2',
            'https://picsum.photos/200/200?random=3',
          ],
          categoryId: 1,
          categoryName: '手机',
          rating: 4.8,
          reviewCount: 256,
          isFeatured: true,
          isNew: true,
          isOnSale: true,
          createdAt: '2024-01-01T00:00:00Z',
          updatedAt: '2024-01-01T00:00:00Z',
        ),
        ProductModel(
          id: 2,
          name: 'MacBook Pro 14"',
          description: '专业级笔记本电脑，M3 芯片',
          price: 14999.00,
          originalPrice: 15999.00,
          stock: 50,
          image: 'https://picsum.photos/200/200?random=4',
          images: [
            'https://picsum.photos/200/200?random=4',
            'https://picsum.photos/200/200?random=5',
            'https://picsum.photos/200/200?random=6',
          ],
          categoryId: 2,
          categoryName: '电脑',
          rating: 4.9,
          reviewCount: 189,
          isFeatured: true,
          isNew: true,
          isOnSale: false,
          createdAt: '2024-01-02T00:00:00Z',
          updatedAt: '2024-01-02T00:00:00Z',
        ),
        ProductModel(
          id: 3,
          name: 'AirPods Pro 2',
          description: '主动降噪耳机',
          price: 1899.00,
          originalPrice: 1999.00,
          stock: 200,
          image: 'https://picsum.photos/200/200?random=7',
          images: [
            'https://picsum.photos/200/200?random=7',
            'https://picsum.photos/200/200?random=8',
          ],
          categoryId: 3,
          categoryName: '耳机',
          rating: 4.7,
          reviewCount: 321,
          isFeatured: false,
          isNew: true,
          isOnSale: true,
          createdAt: '2024-01-03T00:00:00Z',
          updatedAt: '2024-01-03T00:00:00Z',
        ),
        ProductModel(
          id: 4,
          name: 'iPad Pro 12.9"',
          description: '专业级平板电脑',
          price: 8999.00,
          originalPrice: 9499.00,
          stock: 80,
          image: 'https://picsum.photos/200/200?random=9',
          images: [
            'https://picsum.photos/200/200?random=9',
            'https://picsum.photos/200/200?random=10',
          ],
          categoryId: 4,
          categoryName: '平板',
          rating: 4.8,
          reviewCount: 156,
          isFeatured: true,
          isNew: false,
          isOnSale: true,
          createdAt: '2024-01-04T00:00:00Z',
          updatedAt: '2024-01-04T00:00:00Z',
        ),
      ];

      state.products.value = mockProducts;
      state.featuredProducts.value = mockProducts.where((p) => p.isFeatured).toList();
      state.newProducts.value = mockProducts.where((p) => p.isNew).toList();
    } catch (e) {
      state.error.value = e.toString();
    } finally {
      state.isLoading.value = false;
    }
  }

  Future<void> getCategories() async {
    state.isLoading.value = true;
    state.error.value = '';

    try {
      await Future.delayed(const Duration(seconds: 1));

      final mockCategories = [
        CategoryModel(
          id: 1,
          name: '手机',
          image: 'https://picsum.photos/100/100?random=11',
          icon: 'smartphone',
          parentId: 0,
          order: 1,
          isActive: true,
          createdAt: '2024-01-01T00:00:00Z',
          updatedAt: '2024-01-01T00:00:00Z',
        ),
        CategoryModel(
          id: 2,
          name: '电脑',
          image: 'https://picsum.photos/100/100?random=12',
          icon: 'laptop',
          parentId: 0,
          order: 2,
          isActive: true,
          createdAt: '2024-01-01T00:00:00Z',
          updatedAt: '2024-01-01T00:00:00Z',
        ),
        CategoryModel(
          id: 3,
          name: '耳机',
          image: 'https://picsum.photos/100/100?random=13',
          icon: 'headphones',
          parentId: 0,
          order: 3,
          isActive: true,
          createdAt: '2024-01-01T00:00:00Z',
          updatedAt: '2024-01-01T00:00:00Z',
        ),
        CategoryModel(
          id: 4,
          name: '平板',
          image: 'https://picsum.photos/100/100?random=14',
          icon: 'tablet',
          parentId: 0,
          order: 4,
          isActive: true,
          createdAt: '2024-01-01T00:00:00Z',
          updatedAt: '2024-01-01T00:00:00Z',
        ),
      ];

      state.categories.value = mockCategories;
    } catch (e) {
      state.error.value = e.toString();
    } finally {
      state.isLoading.value = false;
    }
  }
}
