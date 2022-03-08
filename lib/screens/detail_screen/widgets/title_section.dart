import 'package:flutter/material.dart';
import 'package:movie_app/constants/sizes.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/theme_model.dart';
import 'package:movie_app/themes/themes_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TitleSection extends StatelessWidget {
  const TitleSection({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = context.watch<ThemesProvider>().getColors;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${movie.title}',
                  style: Theme.of(context).textTheme.headline5!.copyWith(color: themeColors.textColor),
                ),
                const SizedBox(height: kDefaultPadding / 3),
                Row(
                  children: [
                    Text(
                      '2020',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(width: kDefaultPadding / 4),
                    Text(
                      'PG-13',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                    const SizedBox(width: kDefaultPadding / 4),
                    Text(
                      '2h 32min',
                      style: Theme.of(context).textTheme.bodyText2,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Container(
            width: 0.1.sw,
            height: 0.1.sw,
            decoration: BoxDecoration(
              color: themeColors.accent,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
            child: Icon(
              Icons.add,
              size: 30.0,
              color: themeColors.white,
            ),
          )
        ],
      ),
    );
  }
}
