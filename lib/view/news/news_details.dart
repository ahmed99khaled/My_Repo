import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:news_app/core/model/News.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = 'news details screen';

  @override
  Widget build(BuildContext context) {
    var news = ModalRoute.of(context)?.settings.arguments as News;
    var datePublishedAt = DateTime.parse(news.publishedAt ?? '');
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: double.infinity,
          color: Colors.white,
          child: Image.asset(
            'assets/images/pattern.png',
            fit: BoxFit.fill,
          ),
        ),
        Scaffold(
          appBar: AppBar(
            title: Text('News Details'),
            centerTitle: true,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomRight: Radius.circular(30),
                    bottomLeft: Radius.circular(30))),
          ),
          body: Container(
            margin: EdgeInsets.all(12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: CachedNetworkImage(
                    height: 200,
                    width: double.infinity,
                    imageUrl: news.urlToImage ?? '',
                    placeholder: (context, url) =>
                        Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                ),
                Text(
                  news.author ?? '',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey.shade700),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(news.title ?? '',
                    style: Theme.of(context)
                        .textTheme
                        .headline3
                        ?.copyWith(fontWeight: FontWeight.w500)),
                SizedBox(
                  height: 10,
                ),
                Text(
                  showPublishedAt(datePublishedAt, news),
                  textAlign: TextAlign.right,
                  style: Theme.of(context).textTheme.headline3?.copyWith(
                      color: Colors.grey.shade600,
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
                Container(
                  margin: EdgeInsets.all(12),
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade200,
                      )),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        news.description ?? '',
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            fontSize: 18, fontWeight: FontWeight.w400),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      InkWell(
                        onTap: () {
                          _launchUrl(Uri.parse(news.url ?? ''));
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text('View Full Article',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline3
                                    ?.copyWith(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 19)),
                            SizedBox(
                              width: 6,
                            ),
                            Icon(
                              Icons.arrow_right_outlined,
                              size: 38,
                            )
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
      ],
    );
  }

  showPublishedAt(DateTime publishedAt, News news) {
    publishedAt = DateTime.now();
    var difference = publishedAt
        .difference(DateTime.parse(news.publishedAt ?? ''))
        .inMinutes;
    if (difference < 0) {
      difference = publishedAt
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inSeconds;
      return '$difference seconds ago';
    } else if (difference > 0 && difference < 60) {
      difference = publishedAt
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inMinutes;
      return '$difference minutes ago';
    } else if (difference > 60 && difference < 1440) {
      difference = publishedAt
          .difference(DateTime.parse(news.publishedAt ?? ''))
          .inHours;
      return '$difference hours ago';
    } else if (difference > 1440 && difference < 43200) {
      difference =
          publishedAt.difference(DateTime.parse(news.publishedAt ?? '')).inDays;
      return '$difference days ago';
    } else {
      return DateFormat.yMMMd().format(DateTime.parse(news.publishedAt ?? ''));
    }
  }

  Future<void> _launchUrl(Uri url) async {
    if (!await launchUrl(url)) {
      throw 'Could not launch $url';
    }
  }
}
