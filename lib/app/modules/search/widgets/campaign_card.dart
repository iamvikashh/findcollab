import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../models/campaign_model.dart';

class CampaignCard extends StatelessWidget {
  final Campaign campaign;

  const CampaignCard({
    Key? key,
    required this.campaign,
  }) : super(key: key);

  String _getTimeAgo(String startDate) {
    final start = DateTime.tryParse(startDate);
    if (start == null) return '';

    final difference = DateTime.now().difference(start);
    if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else {
      return '${difference.inMinutes} minutes ago';
    }
  }

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
                CircleAvatar(
                  radius: 40,
                  backgroundImage: campaign.campaignImages.isNotEmpty
                      ? NetworkImage(campaign.campaignImages.first.file)
                      : const NetworkImage(
                          'https://picsum.photos/id/237/200/300'),
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
                          Text(campaign.country),
                          Spacer(),
                          Text(
                            _getTimeAgo(campaign.startDate),
                            style: TextStyle(color: Colors.grey),
                          ),
                        ],
                      ),
                      SizedBox(height: 4),
                      Row(
                        children: [
                          Icon(Icons.remove_red_eye_outlined, size: 16),
                          SizedBox(width: 4),
                          Text('${campaign.campaignViews} Views'),
                          Spacer(),
                          Chip(
                            backgroundColor: campaign.campaignType == 'paid'
                                ? Colors.green[100]
                                : Colors.orange[100],
                            label: Text(
                              campaign.campaignType.toUpperCase(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: campaign.campaignType == 'paid'
                                    ? Colors.green
                                    : Colors.orange,
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
              campaign.projectTitle,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            4.verticalSpace,
            Text(
              campaign.briefs,
              style: TextStyle(color: Colors.grey[600]),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            4.verticalSpace,
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (campaign.campaignType == 'paid')
                  Text(
                    '₹ ${campaign.budgetMin ?? 0} - ₹ ${campaign.budgetMax ?? 0}',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                else if (campaign.productValue != null)
                  Text(
                    'Product Value: ₹ ${campaign.productValue}',
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
