import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../campaign_detail/views/campaign_detail_view.dart';
import '../controllers/campaign_controller.dart';
import '../widgets/campaign_card.dart';

class CampaignSearchView extends GetView<CampaignController> {
  final scrollController = ScrollController();

  CampaignSearchView({super.key}) {
    scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      controller.fetchCampaigns();
    }
  }

  Widget _buildErrorWidget(String message) {
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
            onPressed: controller.refreshCampaigns,
            child: Text('Try Again'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: SizedBox(
              height: 40,
              child: TextField(
                style: const TextStyle(fontSize: 14),
                onChanged: controller.search,
                decoration: InputDecoration(
                  hintText: 'Search campaigns...',
                  prefixIcon: Icon(Icons.search, size: 20),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => RefreshIndicator(
                onRefresh: controller.refreshCampaigns,
                child: controller.isLoading.value &&
                        controller.campaigns.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : controller.error.value != null &&
                            controller.campaigns.isEmpty
                        ? _buildErrorWidget(controller.error.value!)
                        : ListView.builder(
                            controller: scrollController,
                            padding: EdgeInsets.fromLTRB(16, 16, 16, 80),
                            itemCount: controller.filteredCampaigns.length + 1,
                            itemBuilder: (context, index) {
                              if (index ==
                                  controller.filteredCampaigns.length) {
                                return Obx(() {
                                  if (controller.isLoading.value) {
                                    return const Center(
                                      child: Padding(
                                        padding: EdgeInsets.all(16.0),
                                        child: CircularProgressIndicator(),
                                      ),
                                    );
                                  }
                                  if (controller.error.value != null) {
                                    return Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: _buildErrorWidget(
                                          controller.error.value!),
                                    );
                                  }
                                  return const SizedBox();
                                });
                              }

                              final campaign =
                                  controller.filteredCampaigns[index];
                              return GestureDetector(
                                onTap: () {
                                  Get.toNamed(
                                    '/campaign-detail',
                                    arguments: {'campaignId': campaign.id},
                                  );
                                },
                                child: CampaignCard(campaign: campaign),
                              );
                            },
                          ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
