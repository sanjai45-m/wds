import 'package:demo/reuse_widgets/reuse.dart';
import 'package:demo/reuse_widgets/theme_color.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AboutUi extends StatefulWidget {
  const AboutUi({super.key});

  @override
  State<AboutUi> createState() => _AboutUiState();
}

class _AboutUiState extends State<AboutUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 20,right: 20,left: 20),
      padding: EdgeInsets.only(bottom: 20),
      decoration: const BoxDecoration(
        border: DashedBorder.fromBorderSide(
          dashLength: 10,
          side: BorderSide(color: Colors.grey, width: 1),
        ),
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(20),
            height: 250,
            width: double.infinity,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage("assets/website-assets/logo.png"),
                    fit: BoxFit.contain)),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            child: ElevatedButton.icon(
              onPressed: () {},
              label: Text(
                "Upload About Image",
                style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black, // Adjust text color
                  ),
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor, // Background color
                padding: EdgeInsets.symmetric(
                    horizontal: 30, vertical: 15), // Button padding
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5), // Rounded corners
                ),
                elevation: 5, // Shadow elevation
              ),
              icon: SvgPicture.asset(
                "assets/website-assets/upload.svg",
                height: 20,
                width: 20,
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              ReUse().showEditYourAboutDialog(context);
            },
            child: Container(
              margin: EdgeInsets.only(top: 20),
              height: 40,
              width: 120,
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
                      "About Us",
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
            "About Us",
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
              "ELEGANCE, COMFORT, AND STYLE WITH ADHVIK WEARS.",
              style: GoogleFonts.besley(
                  textStyle: TextStyle(fontSize: 15, color: Colors.red)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Text(
              "At Adhvik Wears, we believe fashion is more than just clothing -it's a statement. Our name, Adhvik, symbolizes uniqueness and individuality, and that's precisely what we aim to bring to your style. With a commitment to quality craftsmanship and timeless designs, we cater to the modern trendsetter who values both fashion and functionality.",
              style: GoogleFonts.besley(
                  textStyle: TextStyle(
                fontSize: 16,
              )),
            ),
          )
        ],
      ),
    );
  }
}
