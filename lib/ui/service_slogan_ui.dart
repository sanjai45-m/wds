import 'package:demo/ui/add_product_ui.dart';
import 'package:demo/ui/add_service_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../reuse_widgets/dash_divider.dart';
import '../reuse_widgets/reuse.dart';
import '../reuse_widgets/theme_color.dart';

class ServiceSloganUi extends StatefulWidget {
  const ServiceSloganUi({super.key});

  @override
  State<ServiceSloganUi> createState() => _ServiceSloganUiUiState();
}

class _ServiceSloganUiUiState extends State<ServiceSloganUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        border: DashedBorder.fromBorderSide(
          dashLength: 10,
          side: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Column(
        children: [
          GestureDetector(
            onTap: (){
              ReUse().showEditYourServiceDialog(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 40,
                  width: 180,            decoration: BoxDecoration(
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
                      "Service Slogan",
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
                    child: Icon(Icons.edit_outlined),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "What We Deliver",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    decoration: TextDecoration.underline)),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              textAlign: TextAlign.center,
              "FOR THE FASHIONABLY BOLD AND BEAUTIFUL.",
              style: GoogleFonts.besley(
                  textStyle: TextStyle(fontSize: 15, color: Colors.red)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Text(
              textAlign: TextAlign.center,
              "Curated fashion for unique, timeless style. Elevate your everyday look.",
              style: GoogleFonts.besley(
                  textStyle: TextStyle(
                    fontSize: 16,
                  )),
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15.0,horizontal: 10),
            child: DashedDivider(color: Colors.grey),
          ),
          AddServiceUi()
        ],
      ),
    );
  }
}
