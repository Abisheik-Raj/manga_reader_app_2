import "package:flutter/material.dart";
import "package:manga_reader_app_2/resources/app_colors.dart";
import "package:manga_reader_app_2/resources/app_icons.dart";
import "package:manga_reader_app_2/widgets/book_vertical.dart";
import "package:manga_reader_app_2/widgets/infinite_dragable_slider.dart";
import "package:manga_reader_app_2/widgets/recent_cover_image.dart";

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

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
          body: CustomScrollView(
            slivers: [
              const SliverAppBar(
                // title: Image.asset(
                //   color: Colors.white,
                //   "assets/img/vice/vice-logo.png",
                //   width: screenSize.width * 0.2,
                // ),
                centerTitle: true,
                backgroundColor: Colors.transparent,
                actions: [
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
              const SliverToBoxAdapter(
                child: Padding(
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
              ),
              //RECENTS STARTS
              const SliverToBoxAdapter(
                child: Center(
                  child: Text(
                    "RECENTS",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "PoppinsSemibold",
                      fontSize: 12,
                    ),
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 50,
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: InfiniteDragableSlider(
                    iteamCount: ImageCoverArt.fakeImageCoverArtsValues.length,
                    itemBuilder: (context, index) => RecentCoverImage(
                        height: screenSize.height * 0.34,
                        imageUrl: ImageCoverArt
                            .fakeImageCoverArtsValues[index].assetImage),
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: screenSize.height * 0.1,
                ),
              ),
              // ALL BOOKS STARTS
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "ALL BOOKS",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PoppinsSemibold",
                          fontSize: 12,
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Scaffold()));
                        },
                        child: const Icon(
                          AppIcons.rightArrow,
                          color: Colors.white,
                          size: 15,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 20,
                ),
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.60,
                ),
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return const BookVertical();
                  },
                  childCount: 4,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

//For testing purposes only
class ImageCoverArt {
  const ImageCoverArt({
    required this.id,
    required this.assetImage,
    required this.description,
  });

  final String id;
  final String assetImage;
  final String description;
  static final List<ImageCoverArt> fakeImageCoverArtsValues = List.generate(
    5,
    (index) => ImageCoverArt(
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
