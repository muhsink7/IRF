import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../ui/screens/home_screen/home_controller.dart'; // Import the home_controller.dart file

class ImageBanner extends StatelessWidget {
  ImageBanner({Key? key, required this.imageList});

  final List imageList;

  final CarouselController carouselController = CarouselController();
  @override
  Widget build(BuildContext context) {


    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: GetBuilder<HomeController>(
        builder: (controller) {
          return Stack(
            children: [
              Column(
                children: [
                  InkWell(
                    onTap: () {
                      carouselController.nextPage();
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: CarouselSlider(
                        carouselController: carouselController,
                        options: CarouselOptions(
                          height: 80,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          pauseAutoPlayOnTouch: true,
                          aspectRatio: 2.0,
                          enlargeCenterPage: true,
                          scrollDirection: Axis.horizontal,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            // Update the currentBannerIndex using the HomeController
                            Get.find<HomeController>().currentBannerIndex.value = index;
                          },
                        ),
                        items: imageList
                            .map(
                              (item) => Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8),
                                  image: DecorationImage(
                                    image: AssetImage(item['image']!),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ],
              ),
              // Positioned(
              //   bottom: 0,
              //   left: 0,
              //   right: 0,
              //   child:  Row(
              //         mainAxisAlignment: MainAxisAlignment.center,
              //         children: imageList.asMap().entries.map((entry) {
              //           return GestureDetector(
              //             onTap: () {
              //               carouselController.animateToPage(entry.key);
              //             },
              //             child: Container(
              //               width: controller.currentBannerIndex.value == entry.key ? 22.0 : 8.0,
              //               height: 9.0,
              //               margin: const EdgeInsets.symmetric(horizontal: 3.0),
              //               decoration: BoxDecoration(
              //                 borderRadius: BorderRadius.circular(10),
              //                 color: controller.currentBannerIndex.value == entry.key
              //                     ? secondaryColor
              //                     : primaryColor,
              //               ),
              //             ),
              //           );
              //         }).toList(),
                    
              //   ),
              // ),
            ],
          );
        }
      ),
    );
  }
}
