import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../components/product_item.dart';
import '../../../components/screen_title.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Get.theme.colorScheme.surface,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        forceMaterialTransparency: true,
        title: const Row(
          children: [
            //  Image.asset('assets/findcollab_logo.png', height: 30),
            SizedBox(width: 8),
            Text(
              'FINDCOLLAB',
              style: TextStyle(color: Color(0xFFFF4081)),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Social Stats Row
              // Replace the existing Row widget with this code
              SizedBox(
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0),
                        child: _buildSocialStat('Instagram Followers', '25M',
                            Colors.pink[100]!, Icons.camera_alt),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: _buildSocialStat('YouTube', '25M', Colors.white,
                            Icons.play_circle_fill),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: _buildSocialStat('Blog Average Visit', '25M',
                            Colors.white, Icons.rss_feed),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: _buildSocialStat('Instagram', '25M',
                            Colors.white, Icons.photo_camera),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Profile Info Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          const CircleAvatar(
                            radius: 40,
                            backgroundImage: NetworkImage(
                              'https://picsum.photos/id/237/200/300',
                            ),
                          ),
                          const SizedBox(width: 16),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Row(
                                  children: [
                                    Text(
                                      'boatxaman',
                                      style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(width: 8),
                                    Icon(
                                      Icons.verified,
                                      color: Colors.blue,
                                      size: 20,
                                    ),
                                  ],
                                ),
                                const Text('@boatxaman'),
                                const Text('AG the OG.'),
                                RichText(
                                  text: TextSpan(
                                    style: DefaultTextStyle.of(context).style,
                                    children: const [
                                      TextSpan(text: 'Shark '),
                                      TextSpan(
                                        text: '@sharktank.india',
                                        style: TextStyle(color: Colors.blue),
                                      ),
                                      TextSpan(text: ' S1, S2 and S3'),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _buildProfileStat('231', 'posts'),
                          _buildProfileStat('1.4M', 'followers'),
                          _buildProfileStat('853', 'following'),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Engagement Card
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Profile Engagement',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 16),
                            _buildEngagementRow('Average Likes', '286K'),
                            _buildEngagementRow('Reels Views', '12K'),
                            _buildEngagementRow('Story Views', '663K'),
                            _buildEngagementRow('Comments', '363K'),
                          ],
                        ),
                      ),
                      Expanded(
                        child: CustomPaint(
                          size: const Size(double.infinity, 100),
                          painter: EngagementGaugePainter(percentage: 80),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Campaign History
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Campaign History',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '182',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      _buildCampaignRow(
                        'Boat Nirvana',
                        'Smart watch brand - Boat',
                        4.5,
                      ),
                      _buildCampaignRow(
                        'Sunburn',
                        'Smart watch brand - Boat',
                        4.5,
                      ),
                      _buildCampaignRow(
                        'Nike',
                        'Smart watch brand - Boat',
                        4.5,
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Commercials
              Card(
                child: Column(
                  children: [
                    Card(
                      color: Get.theme.primaryColor,
                      child: Container(
                        margin: EdgeInsets.all(4),
                        width: double.infinity,
                        child: const Text(
                          'My Commercials',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildCommercialRow(
                            'Rate Per Reel',
                            'Comment demo content for this creative',
                            'Rs.10,000',
                          ),
                          _buildCommercialRow(
                            'Rate Per Static Story',
                            'Comment demo content for this creative',
                            'Rs.10,000',
                          ),
                          _buildCommercialRow(
                            'Rate Per Static Post',
                            'Comment demo content for this creative',
                            'Rs.10,000',
                          ),
                          _buildCommercialRow(
                            'Rate Per Video Story',
                            'Comment demo content for this creative',
                            'Rs.10,000',
                          ),
                          _buildCommercialRow(
                            'Rate Per Carousel',
                            'Comment demo content for this creative',
                            'Rs.10,000',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSocialStat(
      String title, String value, Color color, IconData icon) {
    return Container(
      width: 120,
      height: 75,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.pinkAccent.withOpacity(0.5),
                Colors.red.withOpacity(0.9),
              ],
            ),
        boxShadow: [
          BoxShadow(
            
            color: Colors.grey.withOpacity(0.1),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(value),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 12, overflow: TextOverflow.ellipsis),
                  textAlign: TextAlign.start,
                  maxLines: 2,
                ),
              ],
            ),
          ),
          Icon(icon, color: Colors.white,)
        ],
      ),
    );
  }

  Widget _buildProfileStat(String value, String label) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(label),
      ],
    );
  }

  Widget _buildEngagementRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label),
          Text(
            value,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  Widget _buildCampaignRow(String brand, String campaign, double rating) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Text(brand),
          ),
          Expanded(
            flex: 3,
            child: Text(campaign),
          ),
          Row(
            children: List.generate(
              5,
              (index) => Icon(
                index < rating.floor() ? Icons.star : Icons.star_border,
                size: 16,
                color: Colors.amber,
              ),
            ),
          ),
          Text(rating.toString()),
        ],
      ),
    );
  }

  Widget _buildCommercialRow(String title, String description, String price) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  description,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
              ],
            ),
          ),
          Text(
            price,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

class EngagementGaugePainter extends CustomPainter {
  final double percentage;

  EngagementGaugePainter({required this.percentage});

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height - 20);
    final radius = size.width * 0.3;

    // Draw background arc
    final backgroundPaint = Paint()
      ..color = Colors.grey[200]!
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      3.14, // Start from 180 degrees (half-circle)
      3.14, // Draw a half-circle
      false,
      backgroundPaint,
    );

    final rect = Rect.fromCircle(center: center, radius: radius);

    // Adjust the startAngle and endAngle to match the half-circle arc
    final gradient = SweepGradient(
      startAngle:
          3.14, // Start the gradient from 180 degrees (where the arc starts)
      endAngle:
          3.14 + (percentage / 100) * 3.14, // End it based on the percentage
      colors: [Colors.blue, Colors.green, Colors.yellow], // Gradient colors
      stops: [0.0, 0.5, 1.0], // Define where colors change
    );

    final progressPaint = Paint()
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 10;

    // Draw progress arc with gradient
    canvas.drawArc(
      rect,
      3.14, // Start from 180 degrees (half-circle)
      (percentage / 100) * 3.14, // Sweep angle based on percentage
      false,
      progressPaint,
    );

    // Draw percentage text
    final textPainter = TextPainter(
      text: TextSpan(
        text: '${percentage.toStringAsFixed(0)}%',
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(
      canvas,
      Offset(
        center.dx - textPainter.width / 2,
        center.dy - textPainter.height / 2,
      ),
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
