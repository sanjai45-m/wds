import 'package:demo/ui/websiteUi.dart';
import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'dashboardui.dart';

import 'package:share_plus/share_plus.dart';

import 'leads_ui.dart'; // Import share_plus package

class BottomNavigationExample extends StatefulWidget {
  final String id;

  const BottomNavigationExample({Key? key, required this.id}) : super(key: key);

  @override
  _BottomNavigationExampleState createState() => _BottomNavigationExampleState();
}

class _BottomNavigationExampleState extends State<BottomNavigationExample> {
  int _currentIndex = 0;
  final PageController _pageController = PageController();

  final List<Widget> _mainScreens = [
    DashboardScreen(),
    const WebsiteScreen(),
    LeadsPage(),
    // Removed ShareScreen from here
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        children: _mainScreens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        selectedLabelStyle: const TextStyle(fontSize: 12),
        unselectedLabelStyle: const TextStyle(fontSize: 10),
        currentIndex: _currentIndex,
        onTap: (index) {
          if (index == 3) {
            _shareContent(); // Directly share content when share icon is tapped
          } else {
            setState(() {
              _currentIndex = index;
              _pageController.animateToPage(
                index,
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            });
          }
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.globe),
            label: 'Website',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.leaderboard_outlined),
            label: 'Leads',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.share),
            label: 'Share',
          ),
        ],
      ),
    );
  }

  // Share content using share_plus
  void _shareContent() {
    final String contentToShare = "Check out this amazing content!";
    Share.share(contentToShare);
  }
}




class ContactFormScreen extends StatelessWidget {
  const ContactFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Contact Form',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class ServiceLeadsScreen extends StatelessWidget {
  const ServiceLeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Service Leads',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class ProductLeadsScreen extends StatelessWidget {
  const ProductLeadsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Product Leads',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}

class ShareScreen extends StatelessWidget {
  const ShareScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Share Screen',
        style: TextStyle(fontSize: 18),
      ),
    );
  }
}
