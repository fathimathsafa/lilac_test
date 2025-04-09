// user_profile_service.dart
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:japx/japx.dart';
import 'package:lilac_test/repository/message_list_screen/model/message_list_screen_model.dart';

class UserProfileService {
  static const String baseUrl = 'https://test.myfliqapp.com/api/v1';
  static const String endpoint = '/chat/chat-messages/queries/contact-users';
  
  // Add your API key and auth token as needed
  static const Map<String, String> headers = {
    'Content-Type': 'application/json',
    'Accept': 'application/json',
    // Add your auth headers here
    // 'Authorization': 'Bearer YOUR_TOKEN',
  };

  Future<UserProfileResponse> getUserProfiles() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl$endpoint'),
        headers: headers,
      );

      if (response.statusCode == 200) {
        // First parse the response body to a JSON map
        final jsonMap = json.decode(response.body);
        
        // Then use Japx to decode the JSON:API format
        final decodedJson = Japx.decode(jsonMap);
        
        return UserProfileResponse.fromJson(decodedJson);
      } else {
        throw Exception('Failed to load user profiles: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching user profiles: $e');
    }
  }
}
// Provider for User Profiles
class UserProfileProvider with ChangeNotifier {
  final UserProfileService _service = UserProfileService();
  
  bool _isLoading = false;
  String _error = '';
  List<Customer> _userProfiles = [];
  
  // Getters
  bool get isLoading => _isLoading;
  String get error => _error;
  List<Customer> get userProfiles => _userProfiles;
  
  // Fetch user profiles
  Future<void> fetchUserProfiles() async {
    try {
      _isLoading = true;
      _error = '';
      notifyListeners();
      
      final response = await _service.getUserProfiles();
      _userProfiles = response.data;
      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _error = e.toString();
      _isLoading = false;
      notifyListeners();
    }
  }
  
  // Refresh user profiles
  Future<void> refreshUserProfiles() async {
    _error = '';
    notifyListeners();
    await fetchUserProfiles();
  }
}