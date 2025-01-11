import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dismissible_page/dismissible_page.dart'; // Import the package

class ProductCard extends StatelessWidget {
  final String title;
  final String price;
  final List<String> imagePaths; // List of image paths for the carousel
  final bool isActive;
  final VoidCallback onEdit;
  final VoidCallback onDelete;
  final ValueChanged<bool> onSwitchToggle;

  ProductCard({
    required this.title,
    required this.price,
    required this.imagePaths,
    required this.isActive,
    required this.onEdit,
    required this.onDelete,
    required this.onSwitchToggle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(18),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        border: Border.all(
          color: Colors.grey.withOpacity(0.5),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 2,
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
        color: Colors.white,
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  isActive ? 'Active' : 'Inactive',
                  style: TextStyle(
                    color: isActive ? Colors.green : Colors.grey,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Transform.scale(
                  scale: 0.8,
                  child: Switch(
                    activeColor: Theme.of(context).primaryColor,
                    value: isActive,
                    onChanged: (bool value) {
                      onSwitchToggle(value);
                    },
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: CarouselSlider(
                items: imagePaths.map((path) {
                  return GestureDetector(
                    onTap: () {
                      // Navigate to the full-screen image view
                      context.pushTransparentRoute(
                        DismissiblePage(
                          onDismissed: () => Navigator.of(context).pop(),
                          child: Scaffold(
                            body: Center(
                              child: Image.asset(
                                path,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                          image: AssetImage(path),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                }).toList(),
                options: CarouselOptions(
                  height: 200,
                  autoPlay: true,
                  enlargeCenterPage: true,
                  aspectRatio: 16 / 9,
                  viewportFraction: 0.8,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: onDelete,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Delete",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 3),
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3),
                            color: Colors.red,
                          ),
                          child: SvgPicture.asset(
                            "assets/website-assets/delete.svg",
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: onEdit,
                  child: Container(
                    margin: EdgeInsets.all(8),
                    height: 30,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.grey.withOpacity(0.5),
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Text(
                            "Edit",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(color: Colors.grey),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(right: 1, top: 1, bottom: 1),
                          padding: EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Theme.of(context).primaryColor,
                          ),
                          child: Icon(Icons.edit_outlined),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, top: 10.0, bottom: 5.0),
              child: Text(
                title,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                price,
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                "View Details",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(color: Colors.grey),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
