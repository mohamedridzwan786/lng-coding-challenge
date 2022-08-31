import 'package:flutter/material.dart';
import 'package:sidebarx/sidebarx.dart';
import 'dart:ui';
import 'package:lng/screens/home.dart';

class IntialSidebarX extends StatelessWidget {
  const IntialSidebarX({
    Key? key,
    required SidebarXController controller,
  })  : _controller = controller,
        super(key: key);

  final SidebarXController _controller;

  @override
  Widget build(BuildContext context) {
    return SidebarX(
      controller: _controller,
      theme: SidebarXTheme(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: canvasColor,
          borderRadius: BorderRadius.circular(20),
        ),
        hoverColor: scaffoldBackgroundColor,
        textStyle: TextStyle(color: Colors.black),
        selectedTextStyle: const TextStyle(color: Colors.red),
        itemTextPadding: const EdgeInsets.only(left: 30),
        selectedItemTextPadding: const EdgeInsets.only(left: 30),
        itemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: canvasColor),
        ),
        selectedItemDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: actionColor.withOpacity(0.37),
          ),
          gradient: const LinearGradient(
            colors: [accentCanvasColor, canvasColor],
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.28),
              blurRadius: 30,
            )
          ],
        ),
        iconTheme: IconThemeData(
          color: Colors.black,
          size: 20,
        ),
        selectedIconTheme: const IconThemeData(
          color: Colors.black,
          size: 20,
        ),
      ),
      extendedTheme: const SidebarXTheme(
        width: 200,
        decoration: BoxDecoration(
          color: canvasColor,
        ),
      ),
      // footerDivider: divider,
      headerBuilder: (context, extended) {
        return Column(
          children: [
            SizedBox(height: 6),
            Text("LnG",
                style: TextStyle(color: Color(0xFF00BFA5), fontSize: 20)),
            SizedBox(
              height: 100,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset('assets/images/avatar.png'),
              ),
            ),
          ],
        );
      },
      // footerBuilder: (context, extended) {
      //   return Column(
      //     children: [
      //       SizedBox(height: 20),
      //
      //
      //       Row(
      //         children: [
      //           IconButton(
      //               onPressed: () {},
      //               icon: const Icon(Icons.settings),
      //               color: Colors.black,
      //               iconSize: 20),
      //           Text("Settings",
      //               style: TextStyle(color: Color(0xFF00BFA5), fontSize: 15)),
      //         ],
      //       ),
      //       Row(
      //         children: [
      //           IconButton(
      //               onPressed: () {},
      //               icon: const Icon(Icons.login_outlined),
      //               color: Colors.black,
      //               iconSize: 20),
      //           Text("Log Out",
      //               style: TextStyle(color: Color(0xFF00BFA5), fontSize: 15)),
      //         ],
      //       )
      //     ],
      //   );
      // },
      // footerBuilder: _footer,
      items: [
        SidebarXItem(
          iconWidget: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.dashboard_outlined),
              color: Colors.black,
              iconSize: 20),
          label: 'Dashboard',
          onTap: () {
            debugPrint('Dashboard');
          },
        ),
        SidebarXItem(
          iconWidget: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_tree_outlined),
              color: Colors.black,
              iconSize: 20),
          label: 'Network',
        ),
        SidebarXItem(
          iconWidget: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.people),
              color: Colors.black,
              iconSize: 20),
          label: 'People',
        ),
        SidebarXItem(
          iconWidget: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.local_shipping_outlined),
              color: Colors.black,
              iconSize: 20),
          label: 'Transport',
        ),
        SidebarXItem(
          iconWidget: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.home_outlined),
              color: Colors.black,
              iconSize: 20),
          label: 'Home',
        ),
        SidebarXItem(
          iconWidget: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.local_mall_outlined),
              color: Colors.black,
              iconSize: 20),
          label: 'Task',
        ),
        SidebarXItem(
          iconWidget: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.settings),
              color: Colors.black,
              iconSize: 20),
          label: 'Settings',
        ),
        SidebarXItem(
          iconWidget: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.login_outlined),
              color: Colors.black,
              iconSize: 20),
          label: 'Log Out',
        ),
      ],
    );
  }
}

class Screens extends StatelessWidget {
  const Screens({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final SidebarXController controller;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final pageTitle = getTitleByIndex(controller.selectedIndex);
        switch (controller.selectedIndex) {
          case 0:
            return Container(child: Home());
          case 1:
            return Container(child: Home());
          case 2:
            return Container(child: Home());
          case 3:
            return Container(child: Home());
          case 4:
            return Container(child: Home());
          case 5:
            return Container(child: Home());
          default:
            return Text(
              pageTitle,
              style: theme.textTheme.headline5,
            );
        }
      },
    );
  }
}

String getTitleByIndex(int index) {
  switch (index) {
    case 0:
      return 'Home';
    case 1:
      return 'Search';
    case 2:
      return 'People';
    case 3:
      return 'Favorites';
    case 4:
      return 'Custom iconWidget';
    case 5:
      return 'Custom iconWidget';

    default:
      return 'Not found page';
  }
}

const primaryColor = Color(0xFF685BFF);
const canvasColor = Colors.white;
const scaffoldBackgroundColor = Colors.white38;
const accentCanvasColor = Colors.white;
const white = Colors.white;
final actionColor = const Color(0xFF5F5FA7).withOpacity(0.6);
final divider = Divider(color: white.withOpacity(0.3), height: 1);
