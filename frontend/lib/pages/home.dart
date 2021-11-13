import 'package:flutter/material.dart';
import 'package:jjdev/pages/first.dart';
import 'package:jjdev/pages/settings.dart';
import 'package:jjdev/pages/upload.dart';
import 'package:jjdev/widgets/appbar.dart';

var selectGloball = 0;

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final Color orangeColor = const Color(0xffFF8527);
  final List<StatelessWidget> pages = [First(), Upload(), Settings()];
  int selectIndex = 0;
  final Color bgColor = Colors.black;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        elevation: 0,
        color: bgColor,
        child: SizedBox(
          height: 56,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.only(left: 25.0, right: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconBottomBar(
                    text: "Home",
                    icon: Icons.home_outlined,
                    selected: selectIndex == 0,
                    onPressed: () {
                      setState(() {
                        selectIndex = 0;
                      });
                    }),
                IconBottomBar2(
                    text: "Add",
                    icon: Icons.add_outlined,
                    selected: selectIndex == 1,
                    onPressed: () {
                      setState(() {
                        selectIndex = 1;
                      });
                    }),
                IconBottomBar(
                    text: "Settings",
                    icon: Icons.settings,
                    selected: selectIndex == 2,
                    onPressed: () {
                      setState(() {
                        selectIndex = 2;
                      });
                    })
              ],
            ),
          ),
        ),
      ),
      body: pages[selectIndex],
      appBar: MainAppBar(
        name: "Jay",
        role: "Owner",
      ),
    );
  }
}

class IconBottomBar extends StatelessWidget {
  const IconBottomBar(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;

  final orangeColor = const Color(0xFFbF8B2A);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            icon,
            size: 25,
            color: selected ? orangeColor : Colors.white54,
          ),
        ),
      ],
    );
  }
}

class IconBottomBar2 extends StatelessWidget {
  const IconBottomBar2(
      {Key? key,
      required this.text,
      required this.icon,
      required this.selected,
      required this.onPressed})
      : super(key: key);
  final String text;
  final IconData icon;
  final bool selected;
  final Function() onPressed;
  final orangeColor = const Color(0xFFbF8B2A);
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: orangeColor,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: 25,
          color: Colors.white,
        ),
      ),
    );
  }
}
