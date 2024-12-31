import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../components/custom_app_bar.dart';
import '../controllers/campaign_detail_controller.dart';

class CampaignDetailView extends GetView<CampaignDetailController> {
  const CampaignDetailView({Key? key}) : super(key: key);

  Widget _buildLoadingView() {
    return const Center(child: CircularProgressIndicator());
  }

  Widget _buildErrorView(String message) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.error_outline, size: 48, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            message,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[600]),
          ),
          SizedBox(height: 16),
          ElevatedButton(
            onPressed: () {
              final String? campaignId = Get.arguments?['campaignId'];
              if (campaignId != null) {
                controller.fetchCampaignDetail(campaignId);
              }
            },
            child: Text('Try Again'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.background,
      appBar: CustomAppBar(
        title: 'Campaign Detail',
        showBackButton: true,
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return _buildLoadingView();
        }

        if (controller.error.value != null) {
          return _buildErrorView(controller.error.value!);
        }

        final campaign = controller.campaignDetail.value;
        if (campaign == null) {
          return _buildErrorView('Campaign details not found');
        }

        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Campaign Header Card
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Color(0xFFFFF0E7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              campaign.projectTitle,
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Padding(
                              padding: const EdgeInsets.only(right: 8),
                              child: Row(
                                children: [
                                  Icon(Icons.location_on_outlined, size: 16),
                                  SizedBox(width: 4),
                                  Text(
                                    campaign.country,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Spacer(),
                                  Text(
                                    '${campaign.campaignViews} views',
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (campaign.campaignImages.isNotEmpty)
                        Container(
                          height: 80,
                          width: 80,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.network(
                              campaign.campaignImages.first.file,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Image.asset(
                                    'assets/images/campaign_bg.png',
                                    fit: BoxFit.cover,
                                  ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 20),

                // Campaign Info Grid
                GridView.count(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisCount: 2,
                  childAspectRatio: 1.5,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  children: [
                    _buildInfoCard('Campaign Type',
                        campaign.campaignType.capitalize ?? ''),
                    _buildInfoCard('Age (years)',
                        '${campaign.ageMin} - ${campaign.ageMax}'),
                    _buildInfoCard('Category', 'Health & Wellness'),
                    _buildInfoCard('Languages',
                        campaign.language.isEmpty ? 'NA' : campaign.language),
                    _buildInfoCard('Followers', campaign.influencerFollowers),
                    _buildInfoCard('Gender',
                        campaign.gender.isEmpty ? 'NA' : campaign.gender),
                  ],
                ),

                // Description and other info cards
                _buildInfoSectionCard('Description', campaign.briefs),
                _buildInfoSectionCard('Do\'s & Don\'t\'s',
                    campaign.doanddont.isEmpty ? 'NA' : campaign.doanddont),
                _buildInfoSectionCard('Budget T&C', campaign.budgetTandc),

                10.verticalSpace,

                // Deliverables Section
                if (campaign.instagramDetails != null ||
                    campaign.youtubeDetails != null)
                  Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Deliverables',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          if (campaign.instagramDetails != null)
                            _buildDeliverable(Icons.camera_alt_outlined,
                                'Instagram', 'Required'),
                          if (campaign.youtubeDetails != null)
                            _buildDeliverable(Icons.youtube_searched_for,
                                'Youtube', 'Required'),
                        ],
                      ),
                    ),
                  ),

                const SizedBox(height: 20),

                // Attachments Section
                if (campaign.campaignImages.isNotEmpty)
                  Card(
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Attachments',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: Row(
                              children: campaign.campaignImages
                                  .map((image) => Padding(
                                        padding:
                                            const EdgeInsets.only(right: 8.0),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Image.network(
                                            image.file,
                                            width: 80,
                                            height: 80,
                                            fit: BoxFit.cover,
                                            errorBuilder:
                                                (context, error, stackTrace) =>
                                                    Container(
                                              width: 80,
                                              height: 80,
                                              color: Colors.grey[300],
                                              child: Icon(Icons.error),
                                            ),
                                          ),
                                        ),
                                      ))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                const SizedBox(height: 20),

                // About Section
                Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'About',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 12),
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          leading: CircleAvatar(
                            backgroundImage: campaign.campaignImages.isNotEmpty
                                ? NetworkImage(
                                    campaign.campaignImages.first.file)
                                : AssetImage('assets/images/campaign_bg.png')
                                    as ImageProvider,
                          ),
                          title: Text(campaign.companyName),
                          subtitle: Text(campaign.userName),
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: _buildCompanyInfo(
                                    'Location', campaign.country)),
                            Expanded(
                                child: _buildCompanyInfo(
                                    'Brand', campaign.brandName)),
                            Expanded(
                                child: _buildCompanyInfo(
                                    'Email', campaign.companyEmail)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 20),

                // Apply Proposal Section
                Card(
                  margin: const EdgeInsets.only(bottom: 16),
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Apply Proposal',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Your Quote',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 8),
                          child: Row(
                            children: [
                              const Icon(Icons.currency_rupee, size: 18),
                              const SizedBox(width: 4),
                              Text(campaign.productValue ?? '0'),
                              const SizedBox(width: 8),
                              Text(
                                campaign.campaignType.capitalize ?? '',
                                style: TextStyle(color: Colors.grey[600]),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 16),
                        const Text(
                          'Delivery Time (Days)',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        TextField(
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                            hintText: '4',
                          ),
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(height: 24),
                        SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: controller.onApplyTap,
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.pink,
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            child: const Text(
                              'APPLY',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget _buildInfoCard(String title, String value) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey.shade200),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Colors.grey[600],
              fontSize: 12,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            value,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoSectionCard(String title, String content) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(content),
          ],
        ),
      ),
    );
  }

  Widget _buildDeliverable(IconData icon, String platform, String requirement) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20),
          const SizedBox(width: 8),
          Text(platform),
          const Spacer(),
          Text(requirement),
        ],
      ),
    );
  }

  Widget _buildCompanyInfo(String title, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Colors.grey[600],
            fontSize: 12,
          ),
        ),
        const SizedBox(height: 4),
        Text(value),
      ],
    );
  }
}
