import 'package:demo/reuse_widgets/leads_data.dart';
import 'package:demo/reuse_widgets/reuse.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hugeicons/hugeicons.dart';

class LeadsPage extends StatefulWidget {
  const LeadsPage({Key? key}) : super(key: key);

  @override
  _LeadsPageState createState() => _LeadsPageState();
}



class _LeadsPageState extends State<LeadsPage> {
  String selectedFilter = "all"; // Default filter

  final List<String> filterOptions = [
    "all",
    "Contact",
    "Services",
    "Product"
  ]; // List of filter options

  // Dummy leads data
  final List<Map<String, dynamic>> leadsList = [
    {
      "serviceName": "Kids dress",
      "mobileNumber": 8190800914,
      "leadsFrom": "Services",
      "status": "New",
      "receivedDate": "30-02-2025 10:40",
    },
    {
      "serviceName": "Kids dress",
      "mobileNumber": 8190800914,
      "leadsFrom": "Contact",
      "status": "Follow up",
      "receivedDate": "30-02-2025 10:40",
    },
    {
      "serviceName": "Kids dress",
      "mobileNumber": 8190800914,
      "leadsFrom": "Product",
      "status": "Converted",
      "receivedDate": "30-02-2025 10:40",
    },
    {
      "serviceName": "Kids dress",
      "mobileNumber": 8190800914,
      "leadsFrom": "Contact",
      "status": "Rejected",
      "receivedDate": "30-02-2025 10:40",
    },
  ];

  @override
  Widget build(BuildContext context) {
    // Filter leads based on selectedFilter
    List<Map<String, dynamic>> filteredLeads = selectedFilter == "all"
        ? leadsList
        : leadsList.where((lead) => lead["leadsFrom"] == selectedFilter).toList();

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
          "Leads",
          style: GoogleFonts.poppins(),
        ),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(0.5),
          child: Divider(color: Colors.grey, height: 1.0),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Filter Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: filterOptions.map((filter) {
                  return FilterButton(
                    label: filter[0].toUpperCase() +
                        filter.substring(1), // Capitalize first letter
                    isSelected: selectedFilter == filter,
                    onTap: () {
                      setState(() {
                        selectedFilter = filter;
                      });
                    },
                  );
                }).toList(),
              ),
              const SizedBox(height: 20),
              Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton.icon(
                    onPressed: () {
                      ReUse().showSortByDialog(context);
                    },
                    label: Text(
                      "Sort",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    icon: HugeIcon(
                      icon: HugeIcons.strokeRoundedSortByDown02,
                      color: Colors.black,
                    ),
                  ),
                  Text("|"),
                  TextButton.icon(
                    onPressed: () {
                      ReUse().showFilterDialog(context);
                    },
                    label: Text(
                      "Filter",
                      style: GoogleFonts.poppins(
                          textStyle: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold)),
                    ),
                    icon: HugeIcon(
                      icon: HugeIcons.strokeRoundedPreferenceHorizontal,
                      color: Colors.black,
                    ),
                  )
                ],
              ),
              Divider(),
              const SizedBox(height: 20),

              // Display filtered leads
              Column(
                children: filteredLeads.map((lead) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 20.0),
                    child: LeadReUse().leadsData(
                      lead["serviceName"],
                      lead["mobileNumber"],
                      lead["leadsFrom"],
                      lead["status"],
                      lead["receivedDate"],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onTap;

  const FilterButton({
    Key? key,
    required this.label,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 5,
              offset: Offset(0, 3),
            ),
          ],
          color: isSelected ? Theme.of(context).primaryColor : Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Text(label,
            style: GoogleFonts.poppins(
              textStyle: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            )),
      ),
    );
  }}