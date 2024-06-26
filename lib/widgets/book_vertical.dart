import "package:flutter/material.dart";

class BookVertical extends StatelessWidget {
  const BookVertical({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: screenSize.height * 0.28,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/recents/recent1.png"),
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "ONE PIECE",
                maxLines: 1,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "PoppinsSemibold",
                    fontSize: 15,
                    overflow: TextOverflow.ellipsis),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "SHOUNEN",
                maxLines: 2,
                style: TextStyle(
                    color: Colors.white,
                    fontFamily: "PoppinsSemibold",
                    fontSize: 12,
                    overflow: TextOverflow.ellipsis),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
