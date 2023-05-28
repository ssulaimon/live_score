import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:live_score_ui/api/api_calls.dart';
import 'package:live_score_ui/const/colors.dart';
import 'package:live_score_ui/const/images_path.dart';
import 'package:live_score_ui/models/news_model.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Sport News',
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Expanded(
                child: FutureBuilder(
                    future: ApiCall.getLatestNews(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: TextAnimator(
                            'Getting latest news',
                            atRestEffect: WidgetRestingEffects.wave(),
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text(
                            'Something Went Wrong',
                            style: GoogleFonts.roboto(
                              fontSize: 20,
                            ),
                          ),
                        );
                      } else {
                        List<NewsModel> news = snapshot.data as List<NewsModel>;
                        return ListView.builder(
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.symmetric(vertical: 5.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(
                                    3.0,
                                  ),
                                  color: AppColors.grey.withOpacity(0.2),
                                  border: Border.all(
                                      color: AppColors.black.withOpacity(0.2))),
                              child: ListTile(
                                onTap: () async {
                                  var uri = Uri.parse(news[index].url);
                                  if (await canLaunchUrl(uri)) {
                                    await launchUrl(
                                      uri,
                                      mode: LaunchMode.inAppWebView,
                                    );
                                  }
                                },
                                leading: Image.asset(
                                  ImagesPath.newsImage,
                                ),
                                subtitle: Text(
                                  news[index].publishDate,
                                ),
                                title: Text(news[index].title),
                              ),
                            );
                          },
                          itemCount: news.length,
                        );
                      }
                    }))
          ],
        ),
      ),
    );
  }
}
