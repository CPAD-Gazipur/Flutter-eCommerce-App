import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.title, this.isWishList = false});

  final String title;
  final bool isWishList;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,
      title: Container(
        color: Colors.black,
        margin: const EdgeInsets.only(top: 5),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .displayMedium!
              .copyWith(color: Colors.white),
        ),
      ),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      actions: [
        isWishList
            ? const SizedBox()
            : IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/wishlist');
                },
                icon: const Icon(Icons.favorite),
              ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(50);
}
