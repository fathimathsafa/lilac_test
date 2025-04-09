// user_profile_model.dart

class UserProfileResponse {
  final List<Customer> data;
  final Meta meta;
  final Links links;

  UserProfileResponse({
    required this.data,
    required this.meta,
    required this.links,
  });

  factory UserProfileResponse.fromJson(Map<String, dynamic> json) {
    return UserProfileResponse(
      data: (json['data'] as List).map((e) => Customer.fromJson(e)).toList(),
      meta: Meta.fromJson(json['meta']),
      links: Links.fromJson(json['links']),
    );
  }
}

class Customer {
  final String type;
  final String id;
  final CustomerAttributes attributes;

  Customer({
    required this.type,
    required this.id,
    required this.attributes,
  });

  factory Customer.fromJson(Map<String, dynamic> json) {
    return Customer(
      type: json['type'],
      id: json['id'],
      attributes: CustomerAttributes.fromJson(json['attributes']),
    );
  }
}

class CustomerAttributes {
  final String? messageReceivedFromPartnerAt;
  final int authUserId;
  final String name;
  final String username;
  final String email;
  final String? profilePhotoPath;
  final String? profilePhotoId;
  final String? phone;
  final String? gender;
  final int? countryId;
  final String? countryName;
  final int? stateId;
  final String? stateName;
  final int? cityId;
  final String? cityName;
  final String? customCityName;
  final bool isActive;
  final String customerCode;
  final bool isPremiumCustomer;
  final bool isOnline;
  final String? bioIntroText;
  final String? lastActiveAt;
  final String? dateOfBirth;
  final int? nativeLanguageId;
  final String? nativeLanguageName;
  final String? profilePhotoUrl;
  final String? square100ProfilePhotoUrl;
  final String? square300ProfilePhotoUrl;
  final String? square500ProfilePhotoUrl;
  final int? age;

  CustomerAttributes({
    this.messageReceivedFromPartnerAt,
    required this.authUserId,
    required this.name,
    required this.username,
    required this.email,
    this.profilePhotoPath,
    this.profilePhotoId,
    this.phone,
    this.gender,
    this.countryId,
    this.countryName,
    this.stateId,
    this.stateName,
    this.cityId,
    this.cityName,
    this.customCityName,
    required this.isActive,
    required this.customerCode,
    required this.isPremiumCustomer,
    required this.isOnline,
    this.bioIntroText,
    this.lastActiveAt,
    this.dateOfBirth,
    this.nativeLanguageId,
    this.nativeLanguageName,
    this.profilePhotoUrl,
    this.square100ProfilePhotoUrl,
    this.square300ProfilePhotoUrl,
    this.square500ProfilePhotoUrl,
    this.age,
  });

  factory CustomerAttributes.fromJson(Map<String, dynamic> json) {
    return CustomerAttributes(
      messageReceivedFromPartnerAt: json['message_received_from_partner_at'],
      authUserId: json['auth_user_id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
      profilePhotoPath: json['profile_photo_path'],
      profilePhotoId: json['profile_photo_id'],
      phone: json['phone'],
      gender: json['gender'],
      countryId: json['country_id'],
      countryName: json['country_name'],
      stateId: json['state_id'],
      stateName: json['state_name'],
      cityId: json['city_id'],
      cityName: json['city_name'],
      customCityName: json['custom_city_name'],
      isActive: json['is_active'],
      customerCode: json['customer_code'],
      isPremiumCustomer: json['is_premium_customer'],
      isOnline: json['is_online'],
      bioIntroText: json['bio_intro_text'],
      lastActiveAt: json['last_active_at'],
      dateOfBirth: json['date_of_birth'],
      nativeLanguageId: json['native_language_id'],
      nativeLanguageName: json['native_language_name'],
      profilePhotoUrl: json['profile_photo_url'],
      square100ProfilePhotoUrl: json['square100_profile_photo_url'],
      square300ProfilePhotoUrl: json['square300_profile_photo_url'],
      square500ProfilePhotoUrl: json['square500_profile_photo_url'],
      age: json['age'],
    );
  }
}

class Meta {
  final Pagination pagination;

  Meta({required this.pagination});

  factory Meta.fromJson(Map<String, dynamic> json) {
    return Meta(
      pagination: Pagination.fromJson(json['pagination']),
    );
  }
}

class Pagination {
  final int total;
  final int count;
  final int perPage;
  final int currentPage;
  final int totalPages;

  Pagination({
    required this.total,
    required this.count,
    required this.perPage,
    required this.currentPage,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      total: json['total'],
      count: json['count'],
      perPage: json['per_page'],
      currentPage: json['current_page'],
      totalPages: json['total_pages'],
    );
  }
}

class Links {
  final String self;
  final String first;
  final String last;

  Links({
    required this.self,
    required this.first,
    required this.last,
  });

  factory Links.fromJson(Map<String, dynamic> json) {
    return Links(
      self: json['self'],
      first: json['first'],
      last: json['last'],
    );
  }
}

// // To parse this JSON data, do
// //
// //     final messageModel = messageModelFromJson(jsonString);

// import 'dart:convert';

// MessageModel messageModelFromJson(String str) => MessageModel.fromJson(json.decode(str));

// String messageModelToJson(MessageModel data) => json.encode(data.toJson());

// class MessageModel {
//     List<Datum>? data;
//     Meta? meta;
//     Links? links;

//     MessageModel({
//         this.data,
//         this.meta,
//         this.links,
//     });

//     factory MessageModel.fromJson(Map<String, dynamic> json) => MessageModel(
//         data: json["data"] == null ? null : List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
//         meta: json["meta"] == null ? null : Meta.fromJson(json["meta"]),
//         links: json["links"] == null ? null : Links.fromJson(json["links"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "data": data == null ? null : List<dynamic>.from(data!.map((x) => x.toJson())),
//         "meta": meta?.toJson(),
//         "links": links?.toJson(),
//     };
// }

// class Datum {
//     String? type;
//     String? id;
//     Attributes? attributes;

//     Datum({
//         this.type,
//         this.id,
//         this.attributes,
//     });

//     factory Datum.fromJson(Map<String, dynamic> json) => Datum(
//         type: json["type"],
//         id: json["id"],
//         attributes: json["attributes"] == null ? null : Attributes.fromJson(json["attributes"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "type": type,
//         "id": id,
//         "attributes": attributes?.toJson(),
//     };
// }

// class Attributes {
//     DateTime? messageReceivedFromPartnerAt;
//     int? authUserId;
//     String? name;
//     String? username;
//     String? email;
//     dynamic profilePhotoPath;
//     dynamic profilePhotoId;
//     String? phone;
//     String? gender;
//     int? countryId;
//     String? countryName;
//     dynamic stateId;
//     dynamic stateName;
//     dynamic cityId;
//     dynamic cityName;
//     dynamic customCityName;
//     bool? isActive;
//     String? customerCode;
//     bool? isPremiumCustomer;
//     bool? isOnline;
//     dynamic bioIntroText;
//     dynamic lastActiveAt;
//     DateTime? dateOfBirth;
//     int? nativeLanguageId;
//     String? nativeLanguageName;
//     String? profilePhotoUrl;
//     String? square100ProfilePhotoUrl;
//     String? square300ProfilePhotoUrl;
//     String? square500ProfilePhotoUrl;
//     int? age;

//     Attributes({
//         this.messageReceivedFromPartnerAt,
//         this.authUserId,
//         this.name,
//         this.username,
//         this.email,
//         this.profilePhotoPath,
//         this.profilePhotoId,
//         this.phone,
//         this.gender,
//         this.countryId,
//         this.countryName,
//         this.stateId,
//         this.stateName,
//         this.cityId,
//         this.cityName,
//         this.customCityName,
//         this.isActive,
//         this.customerCode,
//         this.isPremiumCustomer,
//         this.isOnline,
//         this.bioIntroText,
//         this.lastActiveAt,
//         this.dateOfBirth,
//         this.nativeLanguageId,
//         this.nativeLanguageName,
//         this.profilePhotoUrl,
//         this.square100ProfilePhotoUrl,
//         this.square300ProfilePhotoUrl,
//         this.square500ProfilePhotoUrl,
//         this.age,
//     });

//     factory Attributes.fromJson(Map<String, dynamic> json) => Attributes(
//         messageReceivedFromPartnerAt: json["message_received_from_partner_at"] == null ? null : DateTime.parse(json["message_received_from_partner_at"]),
//         authUserId: json["auth_user_id"],
//         name: json["name"],
//         username: json["username"],
//         email: json["email"],
//         profilePhotoPath: json["profile_photo_path"],
//         profilePhotoId: json["profile_photo_id"],
//         phone: json["phone"],
//         gender: json["gender"],
//         countryId: json["country_id"],
//         countryName: json["country_name"],
//         stateId: json["state_id"],
//         stateName: json["state_name"],
//         cityId: json["city_id"],
//         cityName: json["city_name"],
//         customCityName: json["custom_city_name"],
//         isActive: json["is_active"],
//         customerCode: json["customer_code"],
//         isPremiumCustomer: json["is_premium_customer"],
//         isOnline: json["is_online"],
//         bioIntroText: json["bio_intro_text"],
//         lastActiveAt: json["last_active_at"],
//         dateOfBirth: json["date_of_birth"] == null ? null : DateTime.parse(json["date_of_birth"]),
//         nativeLanguageId: json["native_language_id"],
//         nativeLanguageName: json["native_language_name"],
//         profilePhotoUrl: json["profile_photo_url"],
//         square100ProfilePhotoUrl: json["square100_profile_photo_url"],
//         square300ProfilePhotoUrl: json["square300_profile_photo_url"],
//         square500ProfilePhotoUrl: json["square500_profile_photo_url"],
//         age: json["age"],
//     );

//     Map<String, dynamic> toJson() => {
//         "message_received_from_partner_at": messageReceivedFromPartnerAt?.toIso8601String(),
//         "auth_user_id": authUserId,
//         "name": name,
//         "username": username,
//         "email": email,
//         "profile_photo_path": profilePhotoPath,
//         "profile_photo_id": profilePhotoId,
//         "phone": phone,
//         "gender": gender,
//         "country_id": countryId,
//         "country_name": countryName,
//         "state_id": stateId,
//         "state_name": stateName,
//         "city_id": cityId,
//         "city_name": cityName,
//         "custom_city_name": customCityName,
//         "is_active": isActive,
//         "customer_code": customerCode,
//         "is_premium_customer": isPremiumCustomer,
//         "is_online": isOnline,
//         "bio_intro_text": bioIntroText,
//         "last_active_at": lastActiveAt,
//         "date_of_birth": "${dateOfBirth!.year.toString().padLeft(4, '0')}-${dateOfBirth!.month.toString().padLeft(2, '0')}-${dateOfBirth!.day.toString().padLeft(2, '0')}",
//         "native_language_id": nativeLanguageId,
//         "native_language_name": nativeLanguageName,
//         "profile_photo_url": profilePhotoUrl,
//         "square100_profile_photo_url": square100ProfilePhotoUrl,
//         "square300_profile_photo_url": square300ProfilePhotoUrl,
//         "square500_profile_photo_url": square500ProfilePhotoUrl,
//         "age": age,
//     };
// }

// class Links {
//     String? self;
//     String? first;
//     String? last;

//     Links({
//         this.self,
//         this.first,
//         this.last,
//     });

//     factory Links.fromJson(Map<String, dynamic> json) => Links(
//         self: json["self"],
//         first: json["first"],
//         last: json["last"],
//     );

//     Map<String, dynamic> toJson() => {
//         "self": self,
//         "first": first,
//         "last": last,
//     };
// }

// class Meta {
//     Pagination? pagination;

//     Meta({
//         this.pagination,
//     });

//     factory Meta.fromJson(Map<String, dynamic> json) => Meta(
//         pagination: json["pagination"] == null ? null : Pagination.fromJson(json["pagination"]),
//     );

//     Map<String, dynamic> toJson() => {
//         "pagination": pagination?.toJson(),
//     };
// }

// class Pagination {
//     int? total;
//     int? count;
//     int? perPage;
//     int? currentPage;
//     int? totalPages;

//     Pagination({
//         this.total,
//         this.count,
//         this.perPage,
//         this.currentPage,
//         this.totalPages,
//     });

//     factory Pagination.fromJson(Map<String, dynamic> json) => Pagination(
//         total: json["total"],
//         count: json["count"],
//         perPage: json["per_page"],
//         currentPage: json["current_page"],
//         totalPages: json["total_pages"],
//     );

//     Map<String, dynamic> toJson() => {
//         "total": total,
//         "count": count,
//         "per_page": perPage,
//         "current_page": currentPage,
//         "total_pages": totalPages,
//     };
// }
