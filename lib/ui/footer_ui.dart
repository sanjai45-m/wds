import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class FooterUi extends StatefulWidget {
  const FooterUi({super.key});

  @override
  State<FooterUi> createState() => _FooterUiState();
}

class _FooterUiState extends State<FooterUi> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(15),
      width: double.infinity,
      decoration: BoxDecoration(color: Color(0xFFA02C5D)),
      child: Column(
        children: [
          Text(
            "Advik Wears",
            style: GoogleFonts.poppins(
                textStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white)),
          ),
          SizedBox(height: 10,),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(Icons.location_on, color: Colors.white),
              Text(
                "4th street, Kundrathur",
                style: GoogleFonts.poppins(
                    textStyle: TextStyle(color: Colors.white)),
              ),
            ],
          ),
          SizedBox(height: 10,),

          Container(
            padding: EdgeInsets.only(top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Container(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedInstagram,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedFacebook02,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedWhatsapp,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedNewTwitter,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
                Container(
                  height: 30,
                  width: 30,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: HugeIcon(
                      icon: HugeIcons.strokeRoundedYoutube,
                      color: Colors.red,
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 10,
              children: [
                Text("Home",style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),),
                Text("About",style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),),
                Text("Product",style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),),
                Text("Service",style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),),
                Text("Gallery",style: GoogleFonts.poppins(textStyle: TextStyle(color: Colors.white)),),
              ],
            ),
          )
        ],
      ),
    );
  }
}
