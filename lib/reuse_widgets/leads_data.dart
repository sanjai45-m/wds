import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LeadReUse {
  Widget leadsData(String serviceValue, int mobileNumberValue, String LeadsFrom,
      String statusValue, String receivedDate) {
    Color statusColor;

    // Determine the background color based on the status value
    switch (statusValue.toLowerCase()) {
      case "new":
        statusColor = Colors.blue;
        break;
      case "converted":
        statusColor = Color(0xFF28D8A1);
        break;
      case "rejected":
        statusColor = Colors.red;
        break;
      case "follow up":
        statusColor = Colors.yellow;
        break;
      default:
        statusColor = Colors.grey; // Default to grey if no match
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        return Container(
          width: constraints.maxWidth, // Use the full width of the screen
          child: SingleChildScrollView(
            child: Form(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  // Header Section
                  Container(
                    height: 60,
                    padding: EdgeInsets.all(20),
                    width: MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      border: Border(
                        bottom: BorderSide(
                          color: Colors.grey.withOpacity(0.3),
                        ),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Center(
                          child: Text(
                            "Michael",
                            style: GoogleFonts.poppins(
                              textStyle: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    width: double.infinity, // Ensures full width is used
                    padding: EdgeInsets.all(25),
                    child: Row(
                      children: [
                        Column(
                          spacing: 25,
                          key: Key("key-data"),
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment
                              .start, // Ensure this is set to start
                          children: [
                            Text(
                              "Service Name",
                              style: GoogleFonts.poppins(
                                  textStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Text(
                              "Mobile Number ",
                              style: GoogleFonts.poppins(
                                  textStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Text(
                              "Lead From",
                              style: GoogleFonts.poppins(
                                  textStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Text(
                              "Status",
                              style: GoogleFonts.poppins(
                                  textStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            Text(
                              "Received Date",
                              style: GoogleFonts.poppins(
                                  textStyle:
                                  TextStyle(fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Column(
                            spacing: 25,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Ensure this is set to start
                            children: [
                              Text(":"), // Colon separator
                              Text(":"), // Colon separator
                              Text(":"), // Colon separator
                              Text(":"), // Colon separator
                              Text(":"), // Colon separator
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 25.0),
                          child: Column(
                            key: Key("value-data"),
                            spacing: 25,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment
                                .start, // Ensure this is set to start
                            children: [
                              Text(
                                serviceValue,
                                style:
                                GoogleFonts.poppins(textStyle: TextStyle() ),
                              ),
                              Text(
                                mobileNumberValue.toString(),
                                style:
                                GoogleFonts.poppins(textStyle: TextStyle() ),
                              ),
                              Text(
                                LeadsFrom,
                                style:
                                GoogleFonts.poppins(textStyle: TextStyle() ),
                              ),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal:
                                    0.0), // Set left and right padding for the button
                                child: Container(
                                  decoration: BoxDecoration(
                                      color: statusColor,
                                      borderRadius: BorderRadius.circular(5)),
                                  padding: EdgeInsets.symmetric(
                                      horizontal:
                                      20), // Add horizontal padding to the button for space
                                  child: Text(
                                    statusValue,
                                    style: GoogleFonts.poppins(
                                      textStyle: TextStyle(
                                          color: Colors.black, fontSize: 15),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                receivedDate,
                                style:
                                GoogleFonts.poppins(textStyle: TextStyle() ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Color(0xFFEEEEEE),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(20),
                        bottomRight: Radius.circular(20),
                      ),
                    ),
                    child: Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            // Handle save changes action
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(
                              horizontal: 13,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            elevation: 5,
                          ),
                          child: Text(
                            "Update Status",
                            style: GoogleFonts.poppins(
                              textStyle:
                              TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        TextButton(
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.black,
                            padding: EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 10,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                            ),
                            side: BorderSide(
                              color: Colors.black,
                              width: 1,
                            ),
                            elevation: 5,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Add Note",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          "assets/website-assets/wapp.svg",
                          width: 40,
                          height: 40,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        SvgPicture.asset(
                          "assets/website-assets/call.svg",
                          width: 40,
                          height: 40,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
