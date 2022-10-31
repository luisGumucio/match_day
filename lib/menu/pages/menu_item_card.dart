import 'package:flutter/material.dart';

import '../../../models/menu_item_setting.dart';

class MenuItemCard extends StatelessWidget {
  final MenuItemSetting menuItemSetting;
  const MenuItemCard({Key? key, required this.menuItemSetting})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(10),
      elevation: 8,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return menuItemSetting.page;
          }));
        },
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: menuItemSetting.color,
            child: Icon(menuItemSetting.icon, size: 35),
          ),
          title: Text(
            menuItemSetting.title,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          subtitle: Text(
            menuItemSetting.subtitle,
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w100),
          ),
        ),
      ),
    );
  }
}
