import 'package:demo/reuse_widgets/reuse.dart';
import 'package:demo/ui/add_product_page.dart';
import 'package:demo/ui/edit_product_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import '../reuse_widgets/product_card.dart';
import '../reuse_widgets/theme_color.dart';

class AddProductUi extends StatefulWidget {
  const AddProductUi({super.key});

  @override
  State<AddProductUi> createState() => _AddProductUiState();
}

class _AddProductUiState extends State<AddProductUi> {
  bool isActive = true; // Initial state

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddProductPage(),
            ));
          },
          child: Container(
            margin: EdgeInsets.only(top: 20),
            height: 40,
            width: 150,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(5),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5), // Shadow color
                  spreadRadius: 2, // Spread radius
                  blurRadius: 5, // Blur radius
                  offset: Offset(0, 3), // Offset for shadow (x, y)
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "Add Product",
                    style: GoogleFonts.poppins(
                      textStyle:
                          TextStyle(color: ThemeColor().headingButtonTextColor),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(right: 5),
                  padding: EdgeInsets.all(4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Theme.of(context).primaryColor,
                  ),
                  child: Icon(Icons.add),
                ),
              ],
            ),
          ),
        ),
        ProductCard(
          title: "Clothing Hanging on a Clothing",
          price: "Rs. 15,000",
          imagePaths:[ "assets/website-assets/product.png",
            "assets/website-assets/product.png",
            "assets/website-assets/product.png"],
          isActive: isActive,
          onEdit: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditProductPage(),
            ));
          },
          onDelete: () {
            ReUse().showDeleteDialog(context);
          },
          onSwitchToggle: (bool value) {
            setState(() {
              isActive = value; // Update the state
            });
            if (kDebugMode) {
              print("Switch toggled: $value");
            }
          },
        ),
        ProductCard(
          title: "Clothing Hanging on a Clothing",
          price: "Rs. 15,000",
          imagePaths:[ "assets/website-assets/product.png",
            "assets/website-assets/product.png",
            "assets/website-assets/product.png"],
          isActive: isActive,
          onEdit: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditProductPage(),
            ));
          },
          onDelete: () {
           ReUse().showDeleteDialog(context);
          },
          onSwitchToggle: (bool value) {
            setState(() {
              isActive = value; // Update the state
            });
            if (kDebugMode) {
              print("Switch toggled: $value");
            }
          },
        ),
      ],
    );
  }
}
