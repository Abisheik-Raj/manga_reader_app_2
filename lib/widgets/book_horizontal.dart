import "package:flutter/material.dart";

class BookHorizontal extends StatelessWidget {
  const BookHorizontal({super.key});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
      child: SizedBox(
        width: double.infinity,
        height: screenSize.height * 0.22,
        child: Row(
          children: [
            Container(
              width: screenSize.width * 0.32,
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage("assets/images/recents/recent1.png"),
                ),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            const SizedBox(
              width: 15,
            ),
            const Expanded(
              child: Column(
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
                    height: 15,
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
                  SizedBox(
                    height: 15,
                  ),
                  Expanded(
                    child: Text(
                      "Excepteur sit excepteur exercitation dolor. Aute voluptate id nulla cillum nisi dolor veniam ea quis dolore elit anim ipsum ea. Reprehenderit ut excepteur mollit laborum eiusmod proident excepteur elit pariatur adipisicing sint. Sint cillum proident deserunt proident tempor mollit laborum officia ullamco incididunt. Proident culpa Lorem cupidatat aliqua sint exercitation laboris veniam aliqua non.",
                      maxLines: 6,
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: "PoppinsSemibold",
                          fontSize: 12,
                          overflow: TextOverflow.ellipsis),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
