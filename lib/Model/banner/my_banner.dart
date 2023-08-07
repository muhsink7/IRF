import 'package:flutter/material.dart';

class MyBanner extends StatelessWidget {
  MyBanner({required this.banners});

  final List<Map<String, String>> banners;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {
          // Handle banner tap here
          // You can open the corresponding URL using the url_launcher package
        },
        child: Banner(
          message: 'Advertisement',
          location: BannerLocation.topStart,
          color: Colors.blue,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for (var bannerData in banners)
                GestureDetector(
                  onTap: () {
                    // Handle banner tap here
                    // You can open the corresponding URL using the url_launcher package
                  },
                  child: Container(
                    width: 350,
                    height: 80,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(bannerData['image']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
