import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_list_app/views/profile.dart';
import 'package:recipe_list_app/views/settings.dart';
import '../controllers/settings_controller.dart';
import 'home.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int index = 1;
  final pages = [const Profile(), const Home(), const Settings()];
  SettingsController controller = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.restaurant_menu,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              "Food Recipe",
            ),
          ],
        ),
      ),
      body: Container(
        child: pages[index],
      ),
      bottomNavigationBar: Obx(
        () => NavigationBarTheme(
          data: NavigationBarThemeData(
            indicatorColor: controller.isDark.value
                ? Colors.white.withOpacity(0.5)
                : Colors.amber.withOpacity(0.5),
          ),
          child: NavigationBar(
            height: 70.0,
            selectedIndex: index,
            backgroundColor:
                controller.isDark.value ? Colors.black : Colors.white,
            labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
            onDestinationSelected: (index) =>
                setState(() => this.index = index),
            destinations: const [
              NavigationDestination(
                  icon: Icon(Icons.person_outline),
                  label: 'Profile',
                  selectedIcon: Icon(Icons.person)),
              NavigationDestination(
                  icon: Icon(Icons.home_outlined),
                  label: 'Home',
                  selectedIcon: Icon(Icons.home)),
              NavigationDestination(
                  icon: Icon(Icons.settings_outlined),
                  label: 'Settings',
                  selectedIcon: Icon(Icons.settings)),
            ],
          ),
        ),
      ),
    );
  }

}
