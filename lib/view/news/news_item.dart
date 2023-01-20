import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news_app/view/news/news_details.dart';

import '../../core/model/News.dart';

class NewsItem extends StatelessWidget {
  News news;

  NewsItem(this.news);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, NewsDetails.routeName, arguments: news);
      },
      child: Container(
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
            Text(
              news.title ?? '',
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(fontWeight: FontWeight.w500),
            ),
            Text(
              news.publishedAt ?? '',
              textAlign: TextAlign.right,
              style: Theme.of(context)
                  .textTheme
                  .headline3
                  ?.copyWith(fontSize: 16, fontWeight: FontWeight.w400),
            ),
          ],
        ),
      ),
    );
  }
}
