import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProductPage extends StatefulWidget {
  const EditProductPage({super.key});

  @override
  State<EditProductPage> createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  final _formKey = GlobalKey<FormState>();
  List<TextEditingController> _controllers = [TextEditingController()];
  final TextEditingController _productAmountController =
  TextEditingController();
  final TextEditingController _productNameController = TextEditingController();

  @override
  void dispose() {
    // Dispose controllers to avoid memory leaks
    for (var controller in _controllers) {
      controller.dispose();
    }
    _productAmountController.dispose();
    _productNameController.dispose();
    super.dispose();
  }

  void _addField() {
    setState(() {
      _controllers.add(TextEditingController());
    });
  }

  void _removeField(int index) {
    setState(() {
      _controllers[index].dispose();
      _controllers.removeAt(index);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Padding(
            padding:
            const EdgeInsets.symmetric(vertical: 18.0, horizontal: 30.0),
            child: Row(
              children: [
                SvgPicture.asset(
                  "assets/dashboard-assets/notification.svg",
                  width: 20,
                  height: 20,
                ),
                const SizedBox(width: 20),
                SvgPicture.asset(
                  "assets/dashboard-assets/profile.svg",
                  width: 20,
                  height: 20,
                ),
              ],
            ),
          ),
        ],
        title: Text(
          "Edit Product",
          style: GoogleFonts.poppins(),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Divider(color: Colors.grey, height: 1.0),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center along Y-axis
          children: [
            Align(
              alignment: Alignment.center,  // Center horizontally
              child: Container(
                margin:EdgeInsets.only(top:20),
                alignment: Alignment.center,
                height: 250,
                width: 250,
                decoration: BoxDecoration(
                  // border: Border.all(
                  //   color: Colors.grey.withOpacity(0.5),
                  //   width: 1,
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                  color: Colors.white,
                  image: DecorationImage(
                    image: AssetImage(
                      "assets/website-assets/product.png",
                    ),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: ElevatedButton.icon(
                onPressed: () {},
                label: Text(
                  "Upload Product Image",
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Theme.of(context).primaryColor,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                icon: const Icon(Icons.file_upload_outlined, size: 20),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Product Name *",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: _productNameController,
                      decoration: InputDecoration(
                        labelText: 'Product Name',
                        hintText: 'e.g. Shirt',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a product name';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Product Amount *",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: TextFormField(
                      controller: _productAmountController,
                      decoration: InputDecoration(
                        labelText: 'Product Amount',
                        hintText: 'e.g. 10000',
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(
                            color: Colors.grey.withOpacity(0.5),
                            width: 1.0,
                          ),
                        ),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a product amount';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Product Details *",
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                    ),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: _controllers.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child:Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: _controllers[index],
                                decoration: InputDecoration(
                                  labelText: 'Product Details',
                                  hintText: 'e.g. Description',
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(5),
                                    borderSide: BorderSide(
                                      color: Colors.grey.withOpacity(0.5),
                                      width: 1.0,
                                    ),
                                  ),
                                ),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter product details';
                                  }
                                  return null;
                                },
                              ),
                            ),
                            const SizedBox(width: 5),
                            GestureDetector(
                              onTap: () {
                                if (index == _controllers.length - 1) {
                                  _addField();
                                } else {
                                  _removeField(index);
                                }
                              },
                              child: Container(
                                height: 56, // Matches the height of the TextFormField
                                width: 56, // Keep the width consistent for the icon container
                                decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black,width: 1),
                                  color: index == _controllers.length - 1
                                      ?Theme.of(context).primaryColor
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Icon(
                                  index == _controllers.length - 1
                                      ? Icons.add
                                      : Icons.remove,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          ],
                        ),


                      );
                    },
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          // Handle form submission
                          print("Form Submitted!");
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Text(
                        "Submit",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                          fontSize: 15,
                        ),
                      ),
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
