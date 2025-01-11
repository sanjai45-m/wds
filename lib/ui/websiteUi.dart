import 'package:demo/ui/about_ui.dart';
import 'package:demo/ui/add_product_ui.dart';
import 'package:demo/ui/footer_ui.dart';
import 'package:demo/ui/gallery_slogan_ui.dart';
import 'package:demo/ui/get_in_touch.dart';
import 'package:demo/ui/service_slogan_ui.dart';
import 'package:demo/ui/upload_banner_image.dart';
import 'package:demo/ui/what_we_deliver_ui.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class WebsiteScreen extends StatelessWidget {
  const WebsiteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            Padding(
              padding: const EdgeInsets.only(
                  top: 18.0, right: 30.0, bottom: 18.0, left: 18),
              child: Row(
                children: [
                  SvgPicture.asset(
                    "assets/dashboard-assets/notification.svg",
                    width: 20,
                    height: 20,
                  ),
                  SizedBox(width: 20),
                  SvgPicture.asset(
                    width: 20,
                    height: 20,
                    "assets/dashboard-assets/profile.svg",
                  ),
                ],
              ),
            )
          ],
          title: Text(
            "Website",
            style: GoogleFonts.poppins(
              textStyle: TextStyle(),
            ),
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(0.5),
            child: Container(
              color: Colors.grey,
              height: 1.0,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, left: 30,right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    // First Button: View Website
                    Expanded(
                      child: SizedBox(
                        height: 50, // Set the fixed height
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/dashboard-assets/Eye.svg',
                            height: 15, // Adjust the size as needed
                            width: 15,
                          ),
                          label: Text(
                            "View Website",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white, // Adjust text color
                              ),
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black, // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), // Rounded corners
                            ),
                            elevation: 5, // Shadow elevation
                          ),
                        ),
                      ),
                    ),

                    // Second Button: Share
                    SizedBox(width: 20), // Add spacing between buttons
                    Expanded(
                      child: SizedBox(
                        height: 50, // Set the fixed height
                        child: TextButton.icon(
                          onPressed: () {},
                          icon: SvgPicture.asset(
                            'assets/dashboard-assets/share.svg',
                            height: 15, // Adjust the size as needed
                            width: 15,
                          ),
                          label: Text(
                            "Share",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                fontSize: 15, // Match the font size of other buttons
                                fontWeight: FontWeight.bold,
                                color: Colors.black, // Adjust text color
                              ),
                            ),
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor, // Background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5), // Rounded corners
                            ),
                            elevation: 5, // Shadow elevation
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              Row(
                crossAxisAlignment:
                    CrossAxisAlignment.start, // Align items at the top
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/website-assets/logo.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 25.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Advik Wears",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            Icon(Icons.mode_edit_outlined),
                          ],
                        ),
                      ),
                      SizedBox(height: 15),
                      Text(
                        "Change Theme",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: ElevatedButton.icon(
                  onPressed: () {},
                  icon: Icon(
                    Icons.file_upload_outlined,
                    size: 20,
                  ),
                  label: Text(
                    "Upload Logo",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Theme.of(context).primaryColor, // Background color
                    padding: EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15), // Button padding
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5), // Rounded corners
                    ),
                    elevation: 5, // Shadow elevation
                  ),
                ),
              ),
              BannerUi(),
              AboutUi(),
              WhatWeDeliverUi(),
              ServiceSloganUi(),
              GallerySloganUi(),
              GetInTouch(),
              FooterUi(),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(15.0),
                child: RichText(
                  text: TextSpan(
                    style: TextStyle(color: Colors.black), // Default color is black
                    children: <TextSpan>[
                      TextSpan(
                        text: "Copyright © 2025 Designed & Developed by ",
                      ),
                      TextSpan(
                        text: "Cozy Invite", // This part will be colored differently
                        style: TextStyle(color: Color(0xFF002F8D),fontSize: 10), // Apply the color here
                      ),
                      TextSpan(
                        text: ".",
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
