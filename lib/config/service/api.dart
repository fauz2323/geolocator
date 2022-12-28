class Api {
  static String baseUrl = "http://10.0.2.2:8000";

  static Uri allCategory = Uri.parse("$baseUrl/api/all-category");
  static Uri allFaskes = Uri.parse("$baseUrl/api/all-faskes");
  static Uri byCategoru = Uri.parse("$baseUrl/api/faskes-by-category");

  getHeaderGet(var token) {
    Map<String, String> data = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return data;
  }

  getHeaderPost(var token) {
    Map<String, String> data = {
      'Accept': 'application/json',
      'Authorization': 'Bearer $token',
    };

    return data;
  }
}
