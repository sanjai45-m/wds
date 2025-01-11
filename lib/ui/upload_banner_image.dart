import 'package:demo/reuse_widgets/reuse.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hugeicons/hugeicons.dart';

class BannerUi extends StatefulWidget {
  const BannerUi({super.key});

  @override
  State<BannerUi> createState() => _BannerUiState();
}

class _BannerUiState extends State<BannerUi> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        "assets/website-assets/product.png",
                      ),
                      fit: BoxFit.cover)
                  // image: DecorationImage(image: )
                  ),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Discover the Perfect blend of elegance, comfort and style with Adhvik wears.",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 17)),
                    ),
                    Text(
                      "Our mission is to premium-quality personality elevates your everyday wardrobe.",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                        color: Colors.white,
                      )),
                    ),
                    GestureDetector(
                      onTap: (){
                        ReUse().showEditIntroDialog(context);
                      },
                      child: Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            height: 40,
                            width: 120,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                    "Edit Intro",
                                    style: GoogleFonts.poppins(
                                        textStyle: TextStyle()),
                                  ),
                                ),
                                Container(
                                    margin: EdgeInsets.only(right: 5),
                                    padding: EdgeInsets.all(4),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        color: Color(0xFF28D8A1)),
                                    child: Icon(Icons.edit_outlined)),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: (){
                              ReUse().showEditQuickLinksDialog(context);
                            },
                            child: Container(

                              margin: EdgeInsets.only(top: 10,right: 10),

                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 8.0),
                                    child: Text(
                                      "Edit Quick Links",
                                      style: GoogleFonts.poppins(
                                          textStyle: TextStyle()),
                                    ),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(right: 5),
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: Theme.of(context).primaryColor
                                      ),
                                      child: Icon(Icons.edit_outlined)),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 10),
                      child: Row(
                        spacing: 5,
                        children: [
                          Container(
                            height: 30,
                            width: 30,
                            child: CircleAvatar(backgroundColor: Colors.white,
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
                            child: CircleAvatar(backgroundColor: Colors.white,
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
                            child: CircleAvatar(backgroundColor: Colors.white,
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
                            child: CircleAvatar(backgroundColor: Colors.white,
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
                            child: CircleAvatar(backgroundColor: Colors.white,
                              child: HugeIcon(
                                icon: HugeIcons.strokeRoundedYoutube,
                                color: Colors.red,
                                size: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Text(
                  "Upload Banner Image",
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
                      horizontal: 39, vertical: 15), // Button padding
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5), // Rounded corners
                  ),
                  elevation: 5, // Shadow elevation
                ),
                icon: Icon(
                  Icons.file_upload_outlined,
                  size: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
