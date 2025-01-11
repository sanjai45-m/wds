import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobkit_dashed_border/mobkit_dashed_border.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../reuse_widgets/reuse.dart';


class GallerySloganUi extends StatefulWidget {
  const GallerySloganUi({super.key});

  @override
  State<GallerySloganUi> createState() => _GallerySloganUiState();
}

class _GallerySloganUiState extends State<GallerySloganUi> {
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
              ReUse().showEditYourGalleryDialog(context);
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
                      "Gallery Slogan",
                      style: GoogleFonts.poppins(
                        textStyle: TextStyle(),
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
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Text(
              textAlign: TextAlign.center,
              "WE HAVE ALL YOUR EVENT NEEDS",
              style: GoogleFonts.besley(
                  textStyle: TextStyle(fontSize: 15, color: Colors.red)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 22.0),
            child: Text(
              textAlign: TextAlign.center,
              "The earth is art, the photographer is only a witness.",
              style: GoogleFonts.besley(
                  textStyle: TextStyle(
                fontSize: 16,
              )),
            ),
          ),
          Container(
            margin: EdgeInsets.all(22),
            height: 200,
            width: double.infinity,
            decoration: BoxDecoration(color: Color(0xFFEEEEEE)),
            child: Container(
                width: double.infinity,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.only(bottom: 20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: const DashedBorder.fromBorderSide(
                    dashLength: 10,
                    side: BorderSide(color: Colors.grey, width: 1),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/website-assets/cloud upload.svg",
                      height: 24,
                      width: 24,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      "Upload Gallery Image",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 12)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      textAlign: TextAlign.center,

                      "Please upload images smaller than 10MB",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Color(
                                0xFFF37B7B,
                              ),
                              fontSize: 12)),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      textAlign: TextAlign.center,
                      "(This is just a demo dropzone. Selected files are not actually uploaded)",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(fontSize: 12)),
                    ),
                  ],
                )),
          ),
          Image.asset("assets/website-assets/product.png"),
          Image.asset("assets/website-assets/product.png"),
          Image.asset("assets/website-assets/product.png")

        ],
      ),
    );
  }
}
