import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditDialog extends StatelessWidget {
  final String title;
  final TextEditingController sloganController;
  final TextEditingController descriptionController;
  final GlobalKey<FormState> formKey;
  final Function onSaveChanges;
  final String hintTextSlogan;
  final String hintTextDescription;
  EditDialog({
    required this.title,
    required this.sloganController,
    required this.descriptionController,
    required this.formKey,
    required this.onSaveChanges,
    required this.hintTextSlogan,
    required this.hintTextDescription
  });

  @override
  Widget build(BuildContext context) {
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
              key: formKey,
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
                            title,
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
                          "Slogan *",
                          style: GoogleFonts.poppins(
                            textStyle: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          child: TextField(
                            controller: sloganController,
                            maxLines: 4,
                            keyboardType: TextInputType.multiline,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                              hintText: hintTextSlogan,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              contentPadding: EdgeInsets.all(12),
                            ),
                          ),
                        ),

                        SizedBox(height: 16),

                        Text(
                          "Description",
                          style: GoogleFonts.poppins(
                              textStyle:
                              TextStyle(fontWeight: FontWeight.bold)),
                        ),
                        SizedBox(height: 8),
                        Container(
                          width: double.infinity,
                          child: TextField(
                            controller: descriptionController,
                            maxLines: 4,
                            decoration: InputDecoration(
                              hintStyle: TextStyle(color: Colors.grey, fontSize: 12),
                              hintText: hintTextDescription,
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
                            style: TextStyle(
                              color: Colors.black,
                            ),
                          ),
                        ),

                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: () => onSaveChanges(),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Theme.of(context).primaryColor,
                            padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
          ],
        ),
      ),
    );
  }
}
