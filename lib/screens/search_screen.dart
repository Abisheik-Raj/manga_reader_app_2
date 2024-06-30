import "package:flutter/material.dart";
import "package:manga_reader_app_2/resources/app_icons.dart";
import "package:manga_reader_app_2/resources/constants.dart";
import "package:manga_reader_app_2/widgets/book_horizontal.dart";

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen>
    with TickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animationOpacity;

  @override
  void initState() {
    super.initState();

    animationController = AnimationController(
        vsync: this,
        duration: const Duration(
          milliseconds: 1000,
        ));
    animationOpacity = Tween<double>(begin: 0.0, end: 1).animate(
      CurvedAnimation(parent: animationController, curve: Curves.linear),
    );

    animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

    return SafeArea(
      child: DecoratedBox(
        decoration: scaffoldDecoration,
        child: Scaffold(
          backgroundColor: Colors.transparent,
          body: CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: Column(
                  children: [
                    Hero(
                      tag: "search-field",
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Material(
                          color: Colors.transparent,
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
                    ),
                    Hero(
                      tag: "recent-tag",
                      child: Material(
                        color: Colors.transparent,
                        child: Text(
                          "RESULTS",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "PoppinsSemibold",
                            fontSize: 13.5,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: Hero(
                  tag: "body-tag",
                  child: Material(
                    color: Colors.transparent,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Container(
                        margin: const EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        height: screenSize.height * 1,
                        child: ListView.builder(
                            itemCount: 10,
                            itemBuilder: (context, index) {
                              return const BookHorizontal();
                            }),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
