import 'package:flutter/material.dart';

class MainAppBar extends StatelessWidget with PreferredSizeWidget {
  const MainAppBar({Key? key, required this.name, required this.role})
      : super(key: key);
  final String name;
  final String role;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.black,
      leading: Padding(
        padding: const EdgeInsets.fromLTRB(15.0, 13.0, 0.0, 13.0),
        child: Text(
          this.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 24,
          ),
        ),
      ),
      leadingWidth: 100,
      title: Image.asset(
        'assets/black.png',
        width: 160,
      ),
      toolbarHeight: 75,
      actions: [
        Padding(
            padding: const EdgeInsets.fromLTRB(0.0, 13.0, 15.0, 13.0),
            child: Text(
              this.role,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontStyle: FontStyle.italic,
              ),
            ))
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(70.0);
}
