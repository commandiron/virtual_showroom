import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:virtual_showroom/configs/app_padding.dart';
import 'package:virtual_showroom/configs/app_space.dart';
import 'package:virtual_showroom/configs/app_text_style.dart';
import '../configs/app_config.dart';
import '../model/project.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {

    AppConfig.init(context);

    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.red
          )
        ),
        child: Column(
          children: [
            AppSpace.verticalL!,
            Container(
              height: 48,
              padding: AppPadding.horizontalL,
              child: Image.asset(Project.project1.companyImagePath)
            ),
            AppSpace.verticalM!,
            Container(
                height: 32,
                alignment: Alignment.center,
                child: FittedBox(child: Text(Project.project1.name, style: AppTextStyle.h3,),)
            ),
            AppSpace.verticalM!,
            CarouselSlider.builder(
                itemCount: Project.project1.imagePaths.length,
                itemBuilder: (context, index, realIndex) {
                  return CarouselItem(
                    imageUrl: Project.project1.imagePaths[index],
                  );
                },
                options: CarouselOptions(
                    height: MediaQuery.of(context).size.height / 1.6
                )
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    CategoryItem(title: "Görünüş",),
                    CategoryItem(title: "Planlar",),
                    CategoryItem(title: "Özellikler",),
                    CategoryItem(title: "İletişim",),
                  ],
                ),
              ),
            )
          ],
        ),
      )
    );
  }
}


class CarouselItem extends StatelessWidget {
  const CarouselItem({required this.imageUrl, Key? key}) : super(key: key);

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Theme.of(context).colorScheme.primaryContainer,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Image.asset(imageUrl, fit: BoxFit.cover),
      ),
    );
  }
}

class CategoryItem extends StatelessWidget {
  const CategoryItem({required this.title, Key? key}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AspectRatio(
        aspectRatio: 1,
        child: Card(
          color: Theme.of(context).colorScheme.primary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.account_box_outlined),
              Text(title)
            ],
          ),
        ),
      ),
    );
  }
}


