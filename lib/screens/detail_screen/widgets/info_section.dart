import 'package:flutter/material.dart';
import 'package:movie_app/constants/sizes.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/theme_model.dart';
import 'package:movie_app/themes/themes_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class InfoSection extends StatelessWidget {
  const InfoSection({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = context.watch<ThemesProvider>().getColors;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding, vertical: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Açıklama',
              style: Theme.of(context).textTheme.headline5!.copyWith(color: themeColors.textColor),
            ),
            const SizedBox(height: kDefaultPadding / 2),
            Text(
              '${movie.plot}',
              style: Theme.of(context).textTheme.bodyText1!.copyWith(color: themeColors.gray2),
              maxLines: 4,
            ),
          ],
        ),
      ),
    );
  }
}
