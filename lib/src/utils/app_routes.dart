import '../pages/cart_page.dart';
import '../pages/orders_page.dart';
import '../pages/product_detail_page.dart';
import '../pages/product_form_page.dart';
import '../pages/products_overview_page.dart';
import '../pages/products_page.dart';

class AppRoutes {
  static const home = '/';
  static const productDetail = '/product-detail';
  static const cart = '/cart';
  static const orders = '/orders';
  static const products = '/products';
  static const productForm = '/product-form';

  static final routes = {
    home: (context) => const ProductsOverviewPage(),
    productDetail: (context) => const ProductDetailPage(),
    cart: (context) => const CartPage(),
    orders: (context) => const OrdersPage(),
    products: (context) => const ProductsPage(),
    productForm: (context) => const ProductFormPage(),
  };
}
