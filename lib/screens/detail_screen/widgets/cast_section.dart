import 'package:flutter/material.dart';
import 'package:movie_app/constants/sizes.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/theme_model.dart';
import 'package:movie_app/themes/themes_provider.dart';
import 'package:provider/provider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CastSection extends StatelessWidget {
  const CastSection({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = context.watch<ThemesProvider>().getColors;

    return SizedBox(
      height: 0.25.sh,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
            child: Text('Oyuncular', style: Theme.of(context).textTheme.headline5!.copyWith(color: themeColors.textColor)),
          ),
          const SizedBox(height: kDefaultPadding / 2),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemCount: movie.cast?.length ?? 0,
              itemBuilder: ((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: kDefaultPadding),
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage(movie.cast![index]['image']),
                      ),
                      const SizedBox(height: kDefaultPadding / 4),
                      Text(movie.cast![index]['orginalName'], style: Theme.of(context).textTheme.bodyText1),
                      const SizedBox(height: kDefaultPadding / 4),
                      Text(movie.cast![index]['movieName'], style: Theme.of(context).textTheme.bodyText2),
                    ],
                  ),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
