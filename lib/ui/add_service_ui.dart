import 'package:demo/reuse_widgets/service_card.dart';
import 'package:demo/ui/add_service_page.dart';
import 'package:demo/ui/edit_service_page.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';

import '../reuse_widgets/product_card.dart';
import '../reuse_widgets/reuse.dart';
import '../reuse_widgets/theme_color.dart';

class AddServiceUi extends StatefulWidget {
  const AddServiceUi({super.key});

  @override
  State<AddServiceUi> createState() => _AddServiceUiState();
}

class _AddServiceUiState extends State<AddServiceUi> {
  bool isActive = true; // Initial state

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddServicePage(),));
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
                    "Add Service",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(color: ThemeColor().headingButtonTextColor),

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
        ServiceCard(
          title: "Clothing Hanging on a Clothing",
          price: "Rs. 15,000",
          imagePath: "assets/website-assets/product.png",
          isActive: isActive,
          onEdit: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditServicePage(),
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
        ServiceCard(
          title: "Clothing Hanging on a Clothing",
          price: "Rs. 15,000",
          imagePath: "assets/website-assets/product.png",
          isActive: isActive,
          onEdit: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => EditServicePage(),
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
