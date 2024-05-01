import 'package:flutter/material.dart';
import '../../global/color.dart';

class NavBar extends StatefulWidget {
  final int idx;
  final Function change;
  const NavBar({
    Key? key,
    required this.idx,
    required this.change,
  }) : super(key: key);

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 10,
                offset: Offset(2, -4),
                color: Colors.black12,
              ),
            ],
          ),
          width: width,
          padding: const EdgeInsets.fromLTRB(0, 4, 0, 8),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () => widget.change(0),
                icon: Icon(
                  Icons.home_rounded,
                  size: 30,
                  color: widget.idx == 0
                      ? kdarkBlueMuted
                      : kblackSubHeading.withOpacity(0.3),
                ),
              ),
              IconButton(
                onPressed: () => widget.change(1),
                icon: Icon(
                  Icons.quiz_rounded,
                  size: 30,
                  color: widget.idx == 1
                      ? kdarkBlueMuted
                      : kblackSubHeading.withOpacity(0.3),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}