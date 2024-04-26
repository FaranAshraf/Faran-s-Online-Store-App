class MyCartList {
  static List<Map<String, dynamic>> _cartList = [];

  static List<Map<String, dynamic>> get cartList => _cartList;

  static void addProduct(Map<String, dynamic> product) {
    _cartList.add(product);
  }

  static void removeProduct(Map<String, dynamic> product) {
    _cartList.remove(product);
  }

  static void clearCart() {
    _cartList.clear();
  }

  static double calculateTotalPrice() {
    double totalPrice = 0;
    for (var i = 0; i < _cartList.length; i++) {
      totalPrice += _cartList[i]['quantity'] * _cartList[i]['price'];
    }
    return totalPrice;
  }
}
