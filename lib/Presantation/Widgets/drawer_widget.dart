import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:past_papers_app/Presantation/Components/drawer_tile.dart';
import 'package:past_papers_app/Routes/router_const.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void navigateToPage(String path) {
      GoRouter.of(context).pushNamed(path);
    }

    return Drawer(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Logo
            Column(
              children: [
                const DrawerHeader(
                  child: Center(
                    child: Text("L O G O"),
                  ),
                ),
                // list lites
                DrawerTile(
                  title: "Home",
                  icon: Icons.home_filled,
                  onTap: () {
                    GoRouter.of(context).pop();
                  },
                ),
                DrawerTile(
                  title: "All Subjects",
                  icon: Icons.book,
                  onTap: () {
                    navigateToPage(RouterConstants.allSubjectsRouteName);
                  },
                ),
              ],
            ),
            // greeting
            const Column(
              children: [
                Text("Made with Lov."),
                Divider(),
                DrawerTile(title: "L O G O U T", icon: Icons.logout_rounded)
              ],
            )
            // logout
          ],
        ),
      ),
    );
  }
}
