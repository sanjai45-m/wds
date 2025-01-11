import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart'; // For date formatting

import 'edit_dialog.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ReUse {
  Widget TextFieldLogin(
    TextEditingController controller,
    String hintText,
    IconData icon,
    String? Function(String?)? validator, {
    bool isPassword = false,
  }) {
    bool isObscured = isPassword;
    String passwordHintText = hintText;

    return StatefulBuilder(
      builder: (context, setState) {
        return SizedBox(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                controller: controller,
                textInputAction: TextInputAction.next,
                obscureText: isObscured,
                decoration: InputDecoration(
                  hintText: passwordHintText,
                  hintStyle: GoogleFonts.poppins(textStyle: TextStyle()),
                  filled: true,
                  labelStyle: TextStyle(
                    color: Colors.black.withOpacity(0.6),
                    fontSize: 16,
                  ),
                  border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  prefixIcon: Container(
                    margin:
                        EdgeInsets.only(left: 2, right: 5, top: 2, bottom: 2),
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 14),
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    child: Icon(icon, color: Colors.white),
                  ),
                  suffixIcon: isPassword
                      ? IconButton(
                          icon: Icon(
                            isObscured
                                ? Icons.visibility_off
                                : Icons.visibility,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            setState(() {
                              isObscured = !isObscured;
                              passwordHintText =
                                  isObscured ? hintText : "Password";
                            });
                          },
                        )
                      : null,
                  errorText: null,
                ),
                validator: (value) {
                  return validator!(value);
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        );
      },
    );
  }

  Widget texts(String content, double fontSize, Color color) {
    return Text(
      content,
      style: GoogleFonts.poppins(
        fontSize: fontSize,
        color: color,
      ),
    );
  }

  void showEditIntroDialog(BuildContext context) {
    TextEditingController googleMapsUrlController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Container(

                width: constraints.maxWidth, // Use the full width of the screen
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
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
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Center(
                                child: Text(
                                  "Edit Your Intro",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                              InkResponse(
                                onTap: () {
                                  Navigator.of(context).pop();
                                },
                                child: CircleAvatar(
                                  radius: 12,
                                  child: Icon(Icons.close, size: 18),
                                  backgroundColor: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Main Content
                        Container(

                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Main Content *",
                                style: GoogleFonts.poppins(
                                  textStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                width: double.infinity,
                                child: TextField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                    hintText:
                                    "Discover the perfect blend of elegance",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    contentPadding: EdgeInsets.all(12),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),

                              // Sub Content
                              Text(
                                "Sub Content *",
                                style: GoogleFonts.poppins(
                                  textStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                width: double.infinity,
                                child: TextField(
                                  controller: passwordController,
                                  decoration: InputDecoration(
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                    hintText:
                                    "Our mission is to premium-quality person",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    contentPadding: EdgeInsets.all(12),
                                  ),
                                ),
                              ),
                              SizedBox(height: 16),

                              // Location for Google Maps Link
                              Text(
                                "Location for Google Maps Link",
                                style: GoogleFonts.poppins(
                                  textStyle:
                                  TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                              SizedBox(height: 8),
                              Container(
                                width: double.infinity,
                                child: TextField(
                                  controller: googleMapsUrlController,
                                  decoration: InputDecoration(
                                    hintText: "e.g. https://maps.app.goo.gl/",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 12),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    contentPadding: EdgeInsets.all(12),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Action buttons row
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
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              OutlinedButton(
                                style: OutlinedButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
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
                                  "Close",
                                  style: TextStyle(
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  // Handle save changes action
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Theme.of(context).primaryColor,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  elevation: 5,
                                ),
                                child: Text(
                                  "Save Changes",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(),
                                  ),
                                ),
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
          ),
        );
      },
    );
  }

  void showEditQuickLinksDialog(BuildContext context) {
    TextEditingController googleMapsUrlController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    final _formKey = GlobalKey<FormState>(); // Define _formKey here

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Container(
            padding: EdgeInsets.zero,
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Form(
                  key: _formKey, // Use _formKey here
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
                            bottom:
                                BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Text(
                                "Edit Your Quick Links",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            InkResponse(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: CircleAvatar(
                                radius: 12,
                                child: Icon(Icons.close, size: 18),
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Main Content
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Facebook",
                              style: GoogleFonts.poppins(
                                  textStyle:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              child: TextField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  hintText: "https://www.facebook.com/",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: EdgeInsets.all(12),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),

                            // Sub Content
                            Text(
                              "Twitter",
                              style: GoogleFonts.poppins(
                                  textStyle:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              child: TextField(
                                controller: passwordController,
                                decoration: InputDecoration(
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  hintText: "https://twitter.com/",
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: EdgeInsets.all(12),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),

                            // Location for Google Maps Link
                            Text(
                              "Instagram",
                              style: GoogleFonts.poppins(
                                  textStyle:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              child: TextField(
                                controller: googleMapsUrlController,
                                decoration: InputDecoration(
                                  hintText: "https://www.instagram.com/",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: EdgeInsets.all(12),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),

                            Text(
                              "Youtube",
                              style: GoogleFonts.poppins(
                                  textStyle:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              child: TextField(
                                controller: googleMapsUrlController,
                                decoration: InputDecoration(
                                  hintText: "https://www.youtube.com/",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: EdgeInsets.all(12),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                            Text(
                              "Whatsapp No",
                              style: GoogleFonts.poppins(
                                  textStyle:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 8),
                            Container(
                              width: double.infinity,
                              child: TextField(
                                controller: googleMapsUrlController,
                                decoration: InputDecoration(
                                  hintText: "8190800914",
                                  hintStyle: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  contentPadding: EdgeInsets.all(12),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),

                      // Action buttons row
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10), // Button padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded corners
                                ),
                                side: BorderSide(
                                    color: Colors.black,
                                    width: 1), // Border color and width
                                elevation: 5, // Shadow elevation (if needed)
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Close",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Handle save changes action
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context)
                                    .primaryColor, // Background color
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15,
                                    vertical: 10), // Button padding
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(
                                      10), // Rounded corners
                                ),
                                elevation: 5, // Shadow elevation
                              ),
                              child: Text("Save Changes",
                                  style: GoogleFonts.poppins(
                                    textStyle: TextStyle(),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void showEditYourAboutDialog(BuildContext context) {
    TextEditingController sloganController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditDialog(
          hintTextSlogan: "Elegance, comfort, and style with Adhvik Wears.",
          hintTextDescription: "Enter Your Description",
          title: "Edit Your About",
          sloganController: sloganController,
          descriptionController: descriptionController,
          formKey: _formKey,
          onSaveChanges: () {
            // Handle save changes action
            if (_formKey.currentState?.validate() ?? false) {
              // Your save logic here
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }

  void showEditYourProductDialog(BuildContext context) {
    TextEditingController sloganController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditDialog(
          hintTextSlogan: "Your Product Slogan.",
          hintTextDescription: "Enter Your Description",
          title: "Edit Your Product",
          sloganController: sloganController,
          descriptionController: descriptionController,
          formKey: _formKey,
          onSaveChanges: () {
            // Handle save changes action
            if (_formKey.currentState?.validate() ?? false) {
              // Your save logic here
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }

  void showEditYourServiceDialog(BuildContext context) {
    TextEditingController sloganController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditDialog(
          hintTextSlogan: "Your Service Slogan.",
          hintTextDescription: "Enter Your Description",
          title: "Edit Your Service",
          sloganController: sloganController,
          descriptionController: descriptionController,
          formKey: _formKey,
          onSaveChanges: () {
            // Handle save changes action
            if (_formKey.currentState?.validate() ?? false) {
              // Your save logic here
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }

  void showEditYourGalleryDialog(BuildContext context) {
    TextEditingController sloganController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    final _formKey = GlobalKey<FormState>();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return EditDialog(
          hintTextSlogan: "Your Gallery Slogan.",
          hintTextDescription: "Enter Your Description",
          title: "Edit Your Gallery",
          sloganController: sloganController,
          descriptionController: descriptionController,
          formKey: _formKey,
          onSaveChanges: () {
            // Handle save changes action
            if (_formKey.currentState?.validate() ?? false) {
              // Your save logic here
              Navigator.of(context).pop();
            }
          },
        );
      },
    );
  }

  void showDeleteDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Container(
            padding: EdgeInsets.zero,
            width: MediaQuery.of(context).size.width * 0.8, // Adjust width to 80% of the screen
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                // Header Section
                Container(
                  height: 60,
                  padding: EdgeInsets.all(20),
                  width: MediaQuery.of(context).size.width * 0.8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      topLeft: Radius.circular(20),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkResponse(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: CircleAvatar(
                          radius: 12,
                          child: Icon(Icons.close, size: 18),
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
                // Content Section
                Container(
                  padding: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      SvgPicture.asset(
                        "assets/website-assets/delete round.svg",
                        height: 50,
                        width: 50,
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Confirm Delete",
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Are you sure you want to delete your Product? This action cannot be undone",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                            fontSize: 13,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      // Action Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          OutlinedButton(
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                            style: OutlinedButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 45, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              side: BorderSide(color: Colors.black, width: 1),
                            ),
                            child: Text("Close", style: TextStyle(color: Colors.black)),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              // Handle save changes action
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              elevation: 5,
                            ),
                            child: Text("Save Changes", style: GoogleFonts.poppins()),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }



  void showFilterDialog(BuildContext context) {
    TextEditingController fromDateController = TextEditingController();
    TextEditingController toDateController = TextEditingController();
    TextEditingController leadCategoryController = TextEditingController();
    TextEditingController statusController = TextEditingController();

    final _formKey = GlobalKey<FormState>();

    // Date picker function
    Future<void> _selectDate(BuildContext context, TextEditingController controller) async {
      DateTime initialDate = DateTime.now();
      DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: DateTime(1900),
        lastDate: DateTime(2100),
      );

      if (pickedDate != null) {
        controller.text = DateFormat('yyyy-MM-dd').format(pickedDate);
      }
    }

    // Sample categories and statuses for dropdowns
    List<String> categories = ["Lead 1", "Lead 2", "Lead 3"];
    List<String> statuses = ["Active", "Inactive", "Pending"];

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: Container(
            padding: EdgeInsets.zero,
            child: Stack(
              clipBehavior: Clip.none,
              children: <Widget>[
                Form(
                  key: _formKey,
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
                            bottom: BorderSide(color: Colors.grey.withOpacity(0.3)),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Center(
                              child: Text(
                                "Lead Filter",
                                style: GoogleFonts.poppins(
                                  textStyle: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                            ),
                            InkResponse(
                              onTap: () {
                                Navigator.of(context).pop();
                              },
                              child: CircleAvatar(
                                radius: 12,
                                child: Icon(Icons.close, size: 18),
                                backgroundColor: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Main Content
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // From Date
                            Text(
                              "From Date",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 8),
                            GestureDetector(
                              onTap: () => _selectDate(context, fromDateController),
                              child: AbsorbPointer(
                                child: TextField(

                                  controller: fromDateController,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.calendar_month),
                                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                                    hintText: "Select From Date",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    contentPadding: EdgeInsets.all(12),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),

                            // To Date
                            Text(
                              "To Date",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 8),
                            GestureDetector(
                              onTap: () => _selectDate(context, toDateController),
                              child: AbsorbPointer(
                                child: TextField(
                                  controller: toDateController,
                                  decoration: InputDecoration(
                                    suffixIcon: Icon(Icons.calendar_month),

                                    hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                                    hintText: "Select To Date",
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    contentPadding: EdgeInsets.all(12),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: 16),

                            // Lead Category Dropdown
                            Text(
                              "Lead Category",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 8),
                            DropdownButtonFormField<String>(
                              value: leadCategoryController.text.isEmpty
                                  ? null
                                  : leadCategoryController.text,
                              onChanged: (value) {
                                leadCategoryController.text = value!;
                              },
                              items: categories.map((category) {
                                return DropdownMenuItem<String>(
                                  value: category,
                                  child: Text(category),
                                );
                              }).toList(),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                                hintText: "All Lead",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                contentPadding: EdgeInsets.all(12),
                              ),
                            ),
                            SizedBox(height: 16),

                            // Status Dropdown
                            Text(
                              "Status",
                              style: GoogleFonts.poppins(
                                  textStyle: TextStyle(fontWeight: FontWeight.bold)),
                            ),
                            SizedBox(height: 8),
                            DropdownButtonFormField<String>(
                              value: statusController.text.isEmpty
                                  ? null
                                  : statusController.text,
                              onChanged: (value) {
                                statusController.text = value!;
                              },
                              items: statuses.map((status) {
                                return DropdownMenuItem<String>(
                                  value: status,
                                  child: Text(status),
                                );
                              }).toList(),
                              decoration: InputDecoration(
                                hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                                hintText: "Select Status",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                contentPadding: EdgeInsets.all(12),
                              ),
                            ),
                            SizedBox(height: 16),
                          ],
                        ),
                      ),

                      // Action buttons row
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
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            OutlinedButton(
                              style: OutlinedButton.styleFrom(
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                side: BorderSide(color: Colors.black, width: 1),
                                elevation: 5,
                              ),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                "Close",
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                            SizedBox(width: 10),
                            ElevatedButton(
                              onPressed: () {
                                // Handle save changes action
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Theme.of(context).primaryColor,
                                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                elevation: 5,
                              ),
                              child: Text("Apply Filter",
                                  style: GoogleFonts.poppins(textStyle: TextStyle(fontWeight: FontWeight.bold))),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void showSortByDialog(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    String _selectedOption = "Newest"; // Default selected option

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(20),
            ),
          ),
          child: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Container(
                padding: EdgeInsets.zero,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: <Widget>[
                    Form(
                      key: _formKey,
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Center(
                                  child: Text(
                                    "Lead Sort",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                InkResponse(
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: CircleAvatar(
                                    radius: 12,
                                    child: Icon(Icons.close, size: 18),
                                    backgroundColor: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // Main Content
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ListTile(
                                  title:  Text("Newest",style: GoogleFonts.poppins(textStyle: TextStyle()),),
                                  leading: Radio<String>(
                                    value: "Newest",
                                    groupValue: _selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedOption = value!;
                                      });
                                    },
                                  ),
                                ),
                                ListTile(
                                  title: Text("Oldest",style: GoogleFonts.poppins(textStyle: TextStyle()),),
                                  leading: Radio<String>(
                                    value: "Oldest",
                                    groupValue: _selectedOption,
                                    onChanged: (value) {
                                      setState(() {
                                        _selectedOption = value!;
                                      });
                                    },
                                  ),
                                ),

                              ],
                            ),
                          ),

                          // Action Buttons
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
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    side: BorderSide(color: Colors.black),
                                    elevation: 5,
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Close",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    // Handle save changes action
                                    Navigator.of(context).pop();
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor:
                                    Theme.of(context).primaryColor,
                                    padding: EdgeInsets.symmetric(
                                      horizontal: 15,
                                      vertical: 10,
                                    ),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    elevation: 5,
                                  ),
                                  child: Text("Apply Sort"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}
