// Campaign card model
import 'package:ecommerce_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Campaign {
  final String title;
  final String location;
  final String daysAgo;
  final int applications;
  final String description;
  final double minPay;
  final double maxPay;
  final String imageUrl;

  Campaign({
    required this.title,
    required this.location,
    required this.daysAgo,
    required this.applications,
    required this.description,
    required this.minPay,
    required this.maxPay,
    required this.imageUrl,
  });
}

// Campaign controller using GetX
class CampaignController extends GetxController {
  var campaigns = <Campaign>[
    Campaign(
      title: 'Vikash Review',
      location: 'India',
      daysAgo: '5 days ago',
      applications: 25,
      description:
          'The UGC content can be a reel and to be posted in collaboration with...',
      minPay: 5000,
      maxPay: 10000,
      imageUrl: 'assets/campaign_image.png',
    )
  ].obs;
  var filteredCampaigns = <Campaign>[].obs;
  var searchQuery = ''.obs;

  @override
  void onInit() {
    super.onInit();
    // Add sample data
    campaigns.add(
      Campaign(
        title: 'Saukhyam Review Campaign',
        location: 'India',
        daysAgo: '3 days ago',
        applications: 15,
        description:
            'The UGC content can be a reel and to be posted in collaboration with...',
        minPay: 2000,
        maxPay: 5000,
        imageUrl: 'assets/campaign_image.png',
      ),
    );
    filteredCampaigns.value = campaigns;
  }

  void search(String query) {
    searchQuery.value = query;
    if (query.isEmpty) {
      filteredCampaigns.value = campaigns;
    } else {
      filteredCampaigns.value = campaigns
          .where((campaign) =>
              campaign.title.toLowerCase().contains(query.toLowerCase()) ||
              campaign.description.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }
  }
}

// Search screen
class CampaignSearchScreen extends StatelessWidget {
  final controller = Get.put(CampaignController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 16, vertical: 8), // Adjust padding
            child: SizedBox(
              height: 40, // Set a fixed height for the search bar
              child: TextField(
                style: const TextStyle(fontSize: 14), // Reduce font size
                onChanged: controller.search,
                decoration: InputDecoration(
                  hintText: 'Search campaigns...',
                  prefixIcon: Icon(Icons.search, size: 20), // Adjust icon size
                  contentPadding: EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12), // Adjust padding inside the field
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: Obx(
              () => ListView.builder(
                padding: EdgeInsets.fromLTRB(
                    16, 16, 16, 80), // Adjust bottom padding
                itemCount: controller.filteredCampaigns.length,
                itemBuilder: (context, index) {
                  final campaign = controller.filteredCampaigns[index];
                  return CampaignCard(campaign: campaign);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Campaign card widget
class CampaignCard extends StatelessWidget {
  final Campaign campaign;

  const CampaignCard({
    Key? key,
    required this.campaign,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: 16),
      child: Container(
        margin: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const CircleAvatar(
                  radius: 40,
                  backgroundImage: NetworkImage(
                    'https://picsum.photos/id/237/200/300',
                  ),
                ),
                12.horizontalSpace,
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(Icons.location_on_outlined, size: 16),
                          SizedBox(width: 4),
                          Text(campaign.location),
                          Spacer(),
                          Text(
                            campaign.daysAgo,
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.description_outlined, size: 16),
                          SizedBox(width: 4),
                          Text('${campaign.applications} Application'),
                          Spacer(),
                          Chip(
                            backgroundColor: Colors.grey,
                            label: Text(
                              'Paid',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Text(
              campaign.title,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            4.verticalSpace,
            Text(
              campaign.description,
              style: TextStyle(color: Colors.grey[600]),
            ),
            4.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '₹ ${campaign.minPay.toInt()} - ₹ ${campaign.maxPay.toInt()}',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
            4.verticalSpace,
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Text('Apply'),
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  child: OutlinedButton(
                    onPressed: () {},
                    child: Text('Share'),
                    // style: OutlinedButton.styleFrom(
                    //   // shape: RoundedRectangleBorder(
                    //   //   borderRadius: BorderRadius.circular(8),
                    //   // ),
                    // ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
