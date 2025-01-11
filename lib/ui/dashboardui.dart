import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:badges/badges.dart' as badges;
List<String> imageSvg = [
  "assets/dashboard-assets/new lead.svg",
  "assets/dashboard-assets/Follow Up.svg",
  "assets/dashboard-assets/Pending.svg",
  "assets/dashboard-assets/Converted.svg",
];

List<String> values = ["25", "02", "19", "02"];

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity, // Ensure it takes up the entire screen
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/Dashboard bg.png'),
            fit: BoxFit.cover, // This ensures the image covers the whole screen
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SvgPicture.asset(
                    "assets/dashboard-assets/logo.svg",
                    height: 50,
                    width: 100,
                  ),
                  Row(
                    children: [
                      badges.Badge(
                        badgeStyle: badges.BadgeStyle(
                          badgeColor: Colors.white,
                          borderSide: BorderSide(color:Theme.of(context).primaryColor),
                          padding: EdgeInsets.all(5),
                        ),
                        position: badges.BadgePosition.topEnd(top: -5, end: -5),
                        badgeContent: Text(
                          '3',
                          style: TextStyle( fontSize: 12),
                        ),
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          maxRadius: 25,
                          child: SvgPicture.asset(
                            "assets/dashboard-assets/notification.svg",
                            height: 30,
                            width: 30,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        maxRadius: 25,
                        child: SvgPicture.asset(
                          "assets/dashboard-assets/profile.svg",
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 18.0, top: 15, bottom: 18),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Hi, welcome back!',
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                  ),
                  Text(
                    "Your Business dashboard",
                    style: GoogleFonts.poppins(
                      textStyle: TextStyle(fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
            // First Container (Fixed height)
            Expanded(
              child: Container(
                key: Key("1st container"),
                height: double.infinity, // Ensure it takes up the entire screen
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/white bg.png"),
                    fit: BoxFit
                        .cover, // This ensures the image covers the whole screen
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50),
                  ),
                ),
                width: double.infinity,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // View Website Button
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/dashboard-assets/Eye.svg',
                                height: 12,
                                width: 12,
                              ),
                              label: Text(
                                "View Website",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.black,
                                padding: EdgeInsets.symmetric(vertical: 15), // Consistent vertical padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                              ),
                            ),
                          ),
                          SizedBox(width: 10), // Optional space between buttons
                          // Share Button
                          Expanded(
                            child: ElevatedButton.icon(
                              onPressed: () {},
                              icon: SvgPicture.asset(
                                'assets/dashboard-assets/share.svg',
                                height: 12,
                                width: 12,
                              ),
                              label: Text(
                                "Share",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                padding: EdgeInsets.symmetric(vertical: 15), // Consistent vertical padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      key: Key('second'),
                      height: MediaQuery.of(context).size.height * 0.492,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(50),
                          topLeft: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 38.0, top: 20),
                            child: Text(
                              "Leads",
                              style: GoogleFonts.poppins(
                                textStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 22,
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: GridView.builder(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 25, vertical: 8),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0,
                                childAspectRatio:
                                    1, // Adjusted aspect ratio for better layout
                              ),
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(color: Colors.black),
                                  ),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                SvgPicture.asset(
                                                  imageSvg[index],
                                                  height: 40,
                                                  width: 40,
                                                ),
                                                SizedBox(width: 8),
                                                Text(
                                                  values[index],
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize:
                                                        40, // Reduced font size
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.only(
                                            bottomRight: Radius.circular(20),
                                            bottomLeft: Radius.circular(20),
                                          ),
                                        ),
                                        alignment: Alignment.center,
                                        height: 40,
                                        width: double.infinity,
                                        child: Text(
                                          "New Lead",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14, // Reduced font size
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
