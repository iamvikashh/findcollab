class CampaignDetail {
  final String id;
  final String userName;
  final String projectTitle;
  final String country;
  final String brandName;
  final String campaignType;
  final String? productValue;
  final String? budgetMin;
  final String? budgetMax;
  final String briefs;
  final String doanddont;
  final String startDate;
  final String endDate;
  final String ageMin;
  final String ageMax;
  final String influencerFollowers;
  final String gender;
  final String companyName;
  final String companyEmail;
  final int campaignViews;
  final List<CampaignImage> campaignImages;
  final String? instagramDetails;
  final String? youtubeDetails;
  final String budgetTandc;
  final String language;

  CampaignDetail({
    required this.id,
    required this.userName,
    required this.projectTitle,
    required this.country,
    required this.brandName,
    required this.campaignType,
    this.productValue,
    this.budgetMin,
    this.budgetMax,
    required this.briefs,
    required this.doanddont,
    required this.startDate,
    required this.endDate,
    required this.ageMin,
    required this.ageMax,
    required this.influencerFollowers,
    required this.gender,
    required this.companyName,
    required this.companyEmail,
    required this.campaignViews,
    required this.campaignImages,
    this.instagramDetails,
    this.youtubeDetails,
    required this.budgetTandc,
    required this.language,
  });

  factory CampaignDetail.fromJson(Map<String, dynamic> json) {
    return CampaignDetail(
      id: json['id'] ?? '',
      userName: json['user_name'] ?? '',
      projectTitle: json['project_title'] ?? '',
      country: json['country'] ?? '',
      brandName: json['brand_name'] ?? '',
      campaignType: json['campaign_type'] ?? '',
      productValue: json['product_value'],
      budgetMin: json['budget_min'],
      budgetMax: json['budget_max'],
      briefs: json['briefs'] ?? '',
      doanddont: json['doanddont'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      ageMin: json['age_min'] ?? '0',
      ageMax: json['age_max'] ?? '0',
      influencerFollowers: json['influencer_followers'] ?? '',
      gender: json['gender'] ?? '',
      companyName: json['company_name'] ?? '',
      companyEmail: json['company_email'] ?? '',
      campaignViews:
          int.tryParse(json['campaignViews']?.toString() ?? '0') ?? 0,
      campaignImages: (json['campaignImages'] as List<dynamic>?)
              ?.map((image) => CampaignImage.fromJson(image))
              .toList() ??
          [],
      instagramDetails: json['instagram_details'],
      youtubeDetails: json['youtube_details'],
      budgetTandc: json['budget_tandc'] ?? '',
      language: json['language'] ?? '',
    );
  }
}

class CampaignImage {
  final String id;
  final String projectId;
  final String file;
  final String dateAdded;

  CampaignImage({
    required this.id,
    required this.projectId,
    required this.file,
    required this.dateAdded,
  });

  factory CampaignImage.fromJson(Map<String, dynamic> json) {
    return CampaignImage(
      id: json['id'] ?? '',
      projectId: json['project_id'] ?? '',
      file: json['file'] ?? '',
      dateAdded: json['date_added'] ?? '',
    );
  }
}

class CampaignDetailResponse {
  final bool status;
  final CampaignDetail campaign;

  CampaignDetailResponse({
    required this.status,
    required this.campaign,
  });

  factory CampaignDetailResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return CampaignDetailResponse(
      status: data['status'] ?? false,
      campaign: CampaignDetail.fromJson(data['campaign']),
    );
  }
}
