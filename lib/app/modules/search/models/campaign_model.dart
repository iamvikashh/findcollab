class Campaign {
  final String id;
  final String projectTitle;
  final String userName;
  final String country;
  final String brandName;
  final String campaignType;
  final String? productValue;
  final String? budgetMin;
  final String? budgetMax;
  final String briefs;
  final String startDate;
  final String endDate;
  final List<CampaignImage> campaignImages;
  final int campaignViews;

  Campaign({
    required this.id,
    required this.projectTitle,
    required this.userName,
    required this.country,
    required this.brandName,
    required this.campaignType,
    this.productValue,
    this.budgetMin,
    this.budgetMax,
    required this.briefs,
    required this.startDate,
    required this.endDate,
    required this.campaignImages,
    required this.campaignViews,
  });

  factory Campaign.fromJson(Map<String, dynamic> json) {
    return Campaign(
      id: json['id'] ?? '',
      projectTitle: json['project_title'] ?? '',
      userName: json['user_name'] ?? '',
      country: json['country'] ?? '',
      brandName: json['brand_name'] ?? '',
      campaignType: json['campaign_type'] ?? '',
      productValue: json['product_value'],
      budgetMin: json['budget_min'],
      budgetMax: json['budget_max'],
      briefs: json['briefs'] ?? '',
      startDate: json['start_date'] ?? '',
      endDate: json['end_date'] ?? '',
      campaignViews:
          int.tryParse(json['campaignViews']?.toString() ?? '0') ?? 0,
      campaignImages: (json['campaignImages'] as List<dynamic>?)
              ?.map((image) => CampaignImage.fromJson(image))
              .toList() ??
          [],
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

class CampaignResponse {
  final bool status;
  final int totalRecord;
  final List<Campaign> result;

  CampaignResponse({
    required this.status,
    required this.totalRecord,
    required this.result,
  });

  factory CampaignResponse.fromJson(Map<String, dynamic> json) {
    final data = json['data'] as Map<String, dynamic>;
    return CampaignResponse(
      status: data['status'] ?? false,
      totalRecord: int.tryParse(data['Total_Record']?.toString() ?? '0') ?? 0,
      result: (data['result'] as List<dynamic>?)
              ?.map((campaign) => Campaign.fromJson(campaign))
              .toList() ??
          [],
    );
  }
}
