class FavoriteList {
  static List<Map<String, dynamic>> _favoritesList = [];

  static List<Map<String, dynamic>> get favoritesList => _favoritesList;

  static void addProduct(Map<String, dynamic> product) {
    _favoritesList.add(product);
  }

  static void removeProduct(Map<String, dynamic> product) {
    _favoritesList.remove(product);
  }
}
