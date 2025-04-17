// Model class for user data
class UserModel {
  final String id;
  final String firstName;
  final String lastName;
  final String email;
  final String userType; // 'buyer' or 'seller'
  final bool isEmailVerified;
  final String? phoneNumber;
  final String? profileImageUrl;
  final String? country;
  final Map<String, dynamic>? additionalData;

  // Computed property for full name
  String get fullName => '$firstName $lastName'.trim();

  UserModel({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.userType,
    required this.isEmailVerified,
    this.phoneNumber,
    this.profileImageUrl,
    this.country,
    this.additionalData,
  });

  // Create a UserModel object from JSON
  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id']?.toString() ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      email: json['email'] ?? '',
      userType: json['user_type'] ?? 'buyer',
      isEmailVerified: json['is_email_verified'] ?? false,
      phoneNumber: json['phone_number'],
      profileImageUrl: json['profile_image_url'],
      country: json['country'],
      additionalData: json['additional_data'],
    );
  }

  // Convert UserModel to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'user_type': userType,
      'is_email_verified': isEmailVerified,
      'phone_number': phoneNumber,
      'profile_image_url': profileImageUrl,
      'country': country,
      'additional_data': additionalData,
    };
  }

  // Create a copy of this UserModel with modified fields
  UserModel copyWith({
    String? id,
    String? firstName,
    String? lastName,
    String? email,
    String? userType,
    bool? isEmailVerified,
    String? phoneNumber,
    String? profileImageUrl,
    String? country,
    Map<String, dynamic>? additionalData,
  }) {
    return UserModel(
      id: id ?? this.id,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      email: email ?? this.email,
      userType: userType ?? this.userType,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      profileImageUrl: profileImageUrl ?? this.profileImageUrl,
      country: country ?? this.country,
      additionalData: additionalData ?? this.additionalData,
    );
  }
}
