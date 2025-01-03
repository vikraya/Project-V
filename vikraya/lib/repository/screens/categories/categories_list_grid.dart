import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:vikraya/app_notification_screens.dart';
import 'package:vikraya/domain/constants/appcolors.dart';
import 'package:vikraya/repository/screens/cervices/cevices_page.dart';
import 'package:vikraya/repository/screens/foods/foodspage.dart';
import 'package:vikraya/repository/screens/LES/living_essentails_page.dart';
import 'package:vikraya/repository/screens/lgs/living_generals_page.dart';
import 'package:vikraya/repository/screens/categories/offerspage.dart';
import 'package:vikraya/repository/screens/Vonc_IE/voncIoscreens.dart';
import 'package:vikraya/repository/screens/home/homescreen.dart';
import 'package:vikraya/repository/widgets/uihelper.dart';

class CategoriesListGrid extends StatefulWidget {
  const CategoriesListGrid({super.key});

  @override
  State<CategoriesListGrid> createState() => _CategoriesListGridState();
}

class _CategoriesListGridState extends State<CategoriesListGrid> {
  int _CrossAxisCount = 2;
  double _aspectRatio = 1.5;

  ViewType _viewType = ViewType.grid;

  List<String> images = [
    "assets/img/main_page/vonc_main_banner.jpg",
    "assets/img/main_page/vonc food banner.png",
    "assets/img/main_page/Green And Gold Overlay Fresh Foods Email Header.png",
    "assets/img/main_page/Fashion Sale Landscape Banner.png",
    "assets/img/main_page/VOnc_Mechanic Shop Services Banner.png",
  ];

  List<String> imagesc = [
    "assets/icons/food .png",
    "assets/icons/grocerys.png",
    "assets/icons/fashion.png",
    "assets/icons/cervices.png",
  ];

  List<Color> colors = [
    Color(0xff5ce1e6),
    Color(0xff4ce305),
    Color(0xffe3a705),
    Color(0xff737373),
  ];

  List<String> Cnames = [
    "Foods",
    "Living_Essentails",
    "Living_Generals",
    "Cevices",
  ];

  List<String> FoodImages = [
    "assets/img/foods/vonc_m_f_1.png",
    "assets/img/foods/vonc_m_f_2.png",
    "assets/img/foods/vonc_m_f_3 .png",
    "assets/img/foods/vonc_m_f_4.png",
  ];
  List<String> LEImages = [
    "assets/img/living_essentials/rv 1.png",
    "assets/img/living_essentials/re 2.png",
    "assets/img/living_essentials/re 3.png",
    "assets/img/living_essentials/RE-4.png",
  ];

  List<String> LgImages = [
    "assets/img/living_generals/vonc clothes Fashion.png",
    "assets/img/living_generals/vonc_L-E_P.png",
    "assets/img/living_generals/vonc_l-e_s.png",
    "assets/img/living_generals/VONC_L-E.png",
  ];
  List<String> CervicesImages = [
    "assets/img/cevices/cervices ad-min.png",
    "assets/img/cevices/VONC D CERVICES-min.png",
    "assets/img/cevices/VONC MOTOR CERVICES-min.png",
    "assets/img/cevices/VONC CAR CERVICES-min.png",
  ];
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: AppColors.scaffoldBackground,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 150,
              child: CarouselSlider(
                  options: CarouselOptions(
                    height: 150,
                    aspectRatio: _aspectRatio,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    scrollDirection: Axis.horizontal,
                  ),
                  items: List.generate(
                    images.length,
                    (index) {
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => getPage(index),
                            ),
                          );
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            image: DecorationImage(
                              image: AssetImage(images[index]),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                      );
                    },
                  )),
            ),
            const SizedBox(height: 1),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 10),
                  child: const Text(
                    "Categories",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (_viewType == ViewType.list) {
                        _CrossAxisCount = 2;
                        _aspectRatio = 1.5;
                        _viewType = ViewType.grid;
                      } else {
                        _CrossAxisCount = 1;
                        _aspectRatio = 5;
                        _viewType = ViewType.list;
                      }
                    });
                  },
                  icon: _viewType == ViewType.grid
                      ? SizedBox(
                          width: 40,
                          height: 40,
                          child: Uihelper.CustomIcons(
                              img: 'cateogrie_icon-removebg-preview.png',
                              height: 40,
                              width: 40),
                        )
                      : const Icon(Icons.list, color: Colors.white, size: 40),
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.only(left: 10, right: 10),
              height: height * 0.28,
              child: Stack(
                children: [
                  _viewType == ViewType.grid
                      ? Stack(
                          children: [
                            GridView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                      crossAxisCount: _CrossAxisCount,
                                      childAspectRatio: _aspectRatio),
                              itemCount: imagesc.length,
                              itemBuilder: (context, index) {
                                return Stack(children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: InkWell(
                                      onTap: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) =>
                                                getPageMS(index),
                                          ),
                                        );
                                      },
                                      child: Center(
                                        child: Container(
                                          height: height * 0.140,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(imagesc[index]),
                                              fit: BoxFit.fill,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            border: Border.all(
                                              width: 3,
                                              color: colors[index],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Align(
                                    alignment: Alignment.bottomCenter,
                                    child: Padding(
                                      padding: const EdgeInsets.all(15.0),
                                      child: Text(
                                        Cnames[index],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 15,
                                        ),
                                      ),
                                    ),
                                  ),
                                ]);
                              },
                            ),
                            Center(
                              child: Align(
                                alignment: Alignment.center,
                                child: Container(
                                  decoration: const BoxDecoration(
                                    shape: BoxShape.circle,
                                  ),
                                  child: CircleAvatar(
                                    backgroundColor: AppColors.transparent,
                                    radius: 40,
                                    child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(builder: (context) {
                                            return const Voncioscreens();
                                          }),
                                        );
                                      },
                                      icon: Image.asset(
                                          "assets/icons/vonc_io_main-removebg-preview edited.png",
                                          fit: BoxFit.fill),
                                      iconSize: 80,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      : Stack(
                          children: [
                            ListView.builder(
                              itemCount: imagesc.length,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Stack(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    getPageMS(index),
                                              ),
                                            );
                                          },
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.vertical,
                                            child: Container(
                                              height: 180,
                                              margin:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 10),
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(
                                                    imagesc[index],
                                                  ),
                                                  fit: BoxFit.fill,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    Align(
                                      alignment: Alignment.bottomCenter,
                                      child: Text(
                                        Cnames[index],
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 15),
                                      ),
                                    )
                                  ],
                                );
                              },
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Voncioscreens(),
                                    ),
                                  );
                                },
                                child: CircleAvatar(
                                  radius: 40,
                                  backgroundColor: AppColors.transparent,
                                  child: Image.asset(
                                      "assets/icons/vonc_io_main-removebg-preview edited.png"),
                                ),
                              ),
                            ),
                          ],
                        ),
                ],
              ),
            ),
            //  foods offers
            const SizedBox(height: 1),
            SizedBox(
              height: 20,
              width: width,
              child: const Text(
                "Foods",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 1),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                    children: List.generate(
                        FoodImages.length,
                        (index) => InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => Foodspage(),
                                  ),
                                );
                              },
                              child: Container(
                                height: 150,
                                width: width - 50,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(FoodImages[index]),
                                    fit: BoxFit.fill,
                                  ),
                                  borderRadius: BorderRadius.circular(30),
                                ),
                              ),
                            )),
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Foodspage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Living Essentails offers
            const SizedBox(height: 1),
            SizedBox(
              height: 20,
              width: width,
              child: const Text(
                " Living Essentails",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 1),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                      children: List.generate(
                          LEImages.length,
                          (index) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          LivingEssentailsPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 150,
                                  width: width - 50,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(LEImages[index]),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ))),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LivingEssentailsPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Living Generals offers
            const SizedBox(height: 1),
            SizedBox(
              height: 20,
              width: width,
              child: const Text(
                "Living Generals",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 1),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                      children: List.generate(
                          LgImages.length,
                          (index) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          LivingGeneralsPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 150,
                                  width: width - 50,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(LgImages[index]),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ))),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LivingGeneralsPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // cervices offers
            const SizedBox(height: 1),
            SizedBox(
              height: 20,
              width: width,
              child: const Text(
                "Cervices",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 1),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Row(
                      children: List.generate(
                          CervicesImages.length,
                          (index) => InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CevicesPage(),
                                    ),
                                  );
                                },
                                child: Container(
                                  height: 150,
                                  width: width - 50,
                                  margin: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(CervicesImages[index]),
                                      fit: BoxFit.fill,
                                    ),
                                    borderRadius: BorderRadius.circular(30),
                                  ),
                                ),
                              ))),
                  Align(
                    alignment: Alignment.centerRight,
                    child: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CevicesPage(),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

enum ViewType { grid, list }

Widget getPage(int index) {
  switch (index) {
    case 0:
      return Offerspage();
    case 1:
      return Foodspage();
    case 2:
      return LivingEssentailsPage();
    case 3:
      return LivingGeneralsPage();
    case 4:
      return CevicesPage();
    default:
      return Homescreen();
  }
}

Widget getPageMS(int index) {
  switch (index) {
    case 0:
      return Foodspage();
    case 1:
      return LivingEssentailsPage();
    case 2:
      return LivingGeneralsPage();
    case 3:
      return CevicesPage();
    default:
      return Homescreen();
  }
}

Widget AppBarMS(BuildContext context) {
  double width = MediaQuery.of(context).size.width;
  return AppBar(
    toolbarHeight: 50,
    elevation: 0,
    automaticallyImplyLeading: false,
    backgroundColor: Colors.black,
    title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      SizedBox(
        height: 50,
        width: 50,
        child: Uihelper.CustomImagesMS(
            img: "V_O_n_C_Logo crop-min.png",
            height: 30,
            width: 50,
            fit: BoxFit.cover),
      ),
      const SizedBox(width: 2),
      Container(
          height: 40,
          width: width * 0.542,
          decoration: BoxDecoration(
            color: Colors.grey.shade900.withOpacity(0.5),
            borderRadius: BorderRadius.circular(30),
          ),
          child: TextFormField(
            cursorHeight: 25,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white, width: 2),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              hintText: '',
              hintStyle: const TextStyle(color: Colors.white, fontSize: 40),
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
      SizedBox(
        height: 25,
        width: 25,
        child: Uihelper.CustomIcons(
          img: "vonc wathsapp logo crop.png",
          height: 25,
          width: 25,
          fit: BoxFit.cover,
        ),
      ),
    ]),
    flexibleSpace: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(0),
        gradient: AppColors.AppBarColorMS,
      ),
    ),
  );
}
