import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:recipe_list_app/controllers/settings_controller.dart';

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SettingsController controller = Get.put(SettingsController());

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Icon(
              controller.isDark.value
                  ? CupertinoIcons.sun_min_fill
                  : CupertinoIcons.moon_stars_fill,
              size: 200,
              color: controller.isDark.value ? Colors.amber[300] : Colors.grey,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Obx(
            () => Container(
              height: 50,
              width: 150,
              decoration: BoxDecoration(
                color: controller.isDark.value ? Colors.grey : Colors.amber[300],
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: MaterialButton(
                onPressed: () {
                  if (Get.isDarkMode) {
                    Get.changeThemeMode(ThemeMode.light);
                    controller.isDark.value = false;
                  } else {
                    Get.changeThemeMode(ThemeMode.dark);
                    controller.isDark.value = true;
                  }
                },
                child: Text(controller.isDark.value ? 'Light Mode' : 'Dark Mode',
                    style: TextStyle(
                      color: (controller.isDark.value ? Colors.white : Colors.black),
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
