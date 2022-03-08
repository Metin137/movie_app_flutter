import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_app/constants/sizes.dart';
import 'package:movie_app/models/movie_model.dart';
import 'package:movie_app/models/theme_model.dart';
import 'package:movie_app/themes/themes_provider.dart';
import 'package:provider/provider.dart';

class BackdropRating extends StatelessWidget {
  const BackdropRating({
    Key? key,
    required this.movie,
  }) : super(key: key);

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    ThemeColors themeColors = context.watch<ThemesProvider>().getColors;
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height * 0.4,
      child: Stack(
        children: [
          Container(
            height: (size.height * 0.4) - 50,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(50),
              ),
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(movie.backdrop!),
              ),
            ),
          ),
          Positioned(
            right: 0,
            bottom: 0,
            child: Container(
              width: size.width * 0.9,
              padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2, horizontal: kDefaultPadding / 2),
              decoration: BoxDecoration(
                  color: themeColors.primary,
                  borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(50), topLeft: Radius.circular(50)),
                  boxShadow: [
                    BoxShadow(
                      offset: const Offset(0, 5),
                      blurRadius: 50,
                      color: themeColors.gray!.withOpacity(0.2),
                    )
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  //Rating
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset("assets/icons/star_fill.svg", width: 20, height: 20),
                      const SizedBox(height: kDefaultPadding / 4),
                      Text(
                        '${movie.rating}/10',
                        style: TextStyle(color: themeColors.textColor, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: kDefaultPadding / 4),
                      Text(
                        '150,212',
                        style: TextStyle(color: themeColors.gray2, fontSize: 14, fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                  //Rate This
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset('assets/icons/star.svg', width: 20, height: 20),
                      const SizedBox(height: kDefaultPadding / 4),
                      Text('Rate This', style: TextStyle(fontSize: 15, color: themeColors.accent))
                    ],
                  ),
                  //Metascore
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(5),
                        decoration: const BoxDecoration(
                          color: Color(0xFF51CF66),
                          borderRadius: BorderRadius.all(
                            Radius.circular(2),
                          ),
                        ),
                        child: Text('${movie.metascoreRating}', style: TextStyle(color: themeColors.white)),
                      ),
                      const SizedBox(height: kDefaultPadding / 4),
                      Text(
                        'Metascore',
                        style: TextStyle(color: themeColors.textColor, fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      const SizedBox(height: kDefaultPadding / 4),
                      Text(
                        '150,212',
                        style: TextStyle(
                          fontSize: 14,
                          color: themeColors.gray2,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: MediaQuery.of(context).viewInsets.top + 20,
            left: 0,
            child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: themeColors.white,
                size: 20,
              ),
              // tooltip: 'Back',  // this cause the overlay
            ),
          )
        ],
      ),
    );
  }
}
