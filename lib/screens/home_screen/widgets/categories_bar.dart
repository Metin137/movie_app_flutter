import 'package:flutter/material.dart';
import 'package:movie_app/models/theme_model.dart';
import 'package:movie_app/themes/themes_provider.dart';
import 'package:movie_app/utilities/responsive_layout.dart';
import 'package:provider/provider.dart';

class CategoriesBar extends StatefulWidget {
  const CategoriesBar({Key? key}) : super(key: key);

  @override
  State<CategoriesBar> createState() => _CategoriesBarState();
}

class _CategoriesBarState extends State<CategoriesBar> {
  List<String> categories = ['In Theater', 'Box Office', 'Coming Soon'];
  int selectedCategory = 0;

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = context.watch<ThemesProvider>().getColors;

    return SizedBox(
      height: 60,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) =>
            buildCategories(index, context, themeColors),
      ),
    );
  }

  Padding buildCategories(
      int index, BuildContext context, ThemeColors themeColors) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () => setState(() {
          selectedCategory = index;
        }),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: Theme.of(context).textTheme.headline6!.copyWith(
                    fontWeight: FontWeight.w400,
                    color: index == selectedCategory
                        ? themeColors.secondary
                        : Colors.black.withOpacity(0.4),
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              height: 6,
              width: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index == selectedCategory
                    ? themeColors.thirth
                    : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
