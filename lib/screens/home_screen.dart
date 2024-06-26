import "package:flutter/cupertino.dart";
import "package:flutter/material.dart";
import "package:flutter/widgets.dart";
import "package:manga_reader_app_2/resources/app_colors.dart";
import "package:manga_reader_app_2/resources/app_icons.dart";
import "package:manga_reader_app_2/widgets/infinite_dragable_slider.dart";
import "package:manga_reader_app_2/widgets/recent_cover_image.dart";

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: const [0.1, 0.3, 0.6, 0.9],
          colors: AppColors.scaffoldColors,
        )),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            // title: Image.asset(
            //   color: Colors.white,
            //   "assets/img/vice/vice-logo.png",
            //   width: screenSize.width * 0.2,
            // ),
            centerTitle: true,
            backgroundColor: Colors.transparent,
            actions: const [
              Icon(
                AppIcons.menu,
                color: Colors.white,
                size: 23,
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
          body: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                child: TextField(
                  cursorColor: Colors.white,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(10),
                    fillColor: Colors.white12,
                    filled: true,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(10),
                      ),
                      borderSide: BorderSide.none,
                    ),
                    prefixIcon: Icon(
                      AppIcons.search,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const Text(
                "RECENTS",
                style: TextStyle(
                  color: Colors.white,
                  fontFamily: "PoppinsSemibold",
                  fontSize: 12,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              InfiniteDragableSlider(
                iteamCount: Magazine.fakeMagazinesValues.length,
                itemBuilder: (context, index) => RecentCoverImage(
                    height: screenSize.height * 0.34,
                    imageUrl: Magazine.fakeMagazinesValues[index].assetImage),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Magazine {
  const Magazine({
    required this.id,
    required this.assetImage,
    required this.description,
  });

  final String id;
  final String assetImage;
  final String description;
  static final List<Magazine> fakeMagazinesValues = List.generate(
    5,
    (index) => Magazine(
      id: '$index',
      assetImage: 'assets/images/recents/recent${index + 1}.png',
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting '
          "industry. Lorem Ipsum has been the industry's standard dummy "
          'text ever since the 1500s, when an unknown printer took a galley '
          'of type and scrambled it to make a type specimen book. It has '
          'survived not only five centuries, but also the leap into '
          'electronic typesetting, remaining essentially unchanged. It was '
          'popularised in the 1960s with the release of word set sheets '
          'containing Lorem Ipsum passages, and more recently with desktop'
          ' publishing software like Aldus PageMaker including versions of '
          'Lorem Ipsum',
    ),
  );
}
