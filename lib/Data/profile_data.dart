class ProfileData {
  static List<Map<String, dynamic>> _profileList = [
    {'Name': '', 'Phone': ''}
  ];

  static List<Map<String, dynamic>> get profileList => _profileList;

  static void addprofileMap(Map<String, dynamic> profileMap) {
    // Replace the existing profile map with the new one
    _profileList.clear(); // Clear the list
    _profileList.add(profileMap); // Add the new profile map
  }

  static void removeprofileMap(Map<String, dynamic> profileMap) {
    _profileList.remove(profileMap);
  }
}
