class UserProfileModel {
  final String id;
  final String userName;
  final String email;
  final String mobile;
  final String? website;
  final String? country;
  final String? city;
  final String? address;
  final String? instagramUrl;
  final String? youtubeUrl;
  final String? twitterUrl;
  final String? introduction;
  final List<String> languages;
  final List<String> categories;
  final String? imagePath;

  UserProfileModel({
    required this.id,
    required this.userName,
    required this.email,
    required this.mobile,
    this.website,
    this.country,
    this.city,
    this.address,
    this.instagramUrl,
    this.youtubeUrl,
    this.twitterUrl,
    this.introduction,
    required this.languages,
    required this.categories,
    this.imagePath,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    final userDetail = json['data']['userDetail'];
    final languages = (json['data']['userLanguages'] as List)
        .map((lang) => lang['language'] as String)
        .toList();
    final categories = (json['data']['userCategories'] as List)
        .map((cat) => cat['Interested_in_industry'] as String)
        .toList();

    return UserProfileModel(
      id: userDetail['user_login_id'],
      userName: userDetail['user_name'],
      email: userDetail['email'],
      mobile: userDetail['mobile'],
      website: userDetail['website'],
      country: userDetail['country'],
      city: userDetail['city'],
      address: userDetail['address'],
      instagramUrl: userDetail['insta_url'],
      youtubeUrl: userDetail['youtube_url'],
      twitterUrl: userDetail['twitter_url'],
      introduction: userDetail['introduction'],
      languages: languages,
      categories: categories,
      imagePath: userDetail['img_path'],
    );
  }
}
