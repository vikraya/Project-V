import 'package:flutter/material.dart';
import 'package:vikraya/app_notification_screens.dart';
import 'package:vikraya/repository/widgets/uihelper.dart';

class AppbarH extends StatefulWidget {
  const AppbarH({super.key});

  @override
  State<AppbarH> createState() => _AppbarHState();
}

class _AppbarHState extends State<AppbarH> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        height: 100,
      ),
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Uihelper.CustomImagesMS(
            img: "V_O_n_C_Logo crop-min.png", height: 30, width: 50),
        const SizedBox(width: 2),
        Container(
            height: 60,
            width: MediaQuery.of(context).size.width * 0.542,
            decoration: BoxDecoration(
              color: Colors.grey.shade900.withOpacity(0.5),
              borderRadius: BorderRadius.circular(30),
            ),
            child: TextFormField(
              cursorHeight: 25,
              onChanged: (value) {
                //search
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.white, width: 2),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                hintText: '',
                hintStyle: const TextStyle(color: Colors.white),
                prefixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
                suffixIcon: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.mic,
                      color: Colors.white,
                    )),
              ),
              style: const TextStyle(color: Colors.white, fontSize: 20),
            )),
        InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => AppNotificationScreens()));
          },
          child: const Icon(Icons.notifications, color: Colors.white, size: 30),
        ),
        const SizedBox(width: 2),
        Uihelper.CustomIcons(
            img: "vonc wathsapp logo crop.png",
            height: 30,
            width: 50,
            fit: BoxFit.contain),
      ]),
    );
  }
}
