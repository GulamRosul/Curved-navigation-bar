import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';

void main() => runApp(
  MaterialApp(
    home: BottomNavBar(),
    debugShowCheckedModeBanner: false, // ✅ Hide debug banner
  ),
);

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  int _page = 0;

  final List<Widget> _pages = [
    const PageContent(
      title: 'Alarm Page',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/5948/5948565.png',
      backgroundColor: Color(0xFFB3E5FC), // Light Blue
    ),
    const PageContent(
      title: 'AC Page',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/2933/2933186.png',
      backgroundColor: Color(0xFFC8E6C9), // Light Green
    ),
    const PageContent(
      title: 'Accessibility Page',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/535/535234.png',
      backgroundColor: Color(0xFFFFE0B2), // Light Orange
    ),
    const PageContent(
      title: 'Call Page',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/724/724664.png',
      backgroundColor: Color(0xFFE1BEE7), // Light Purple
    ),
    const PageContent(
      title: 'Favorites Page',
      imageUrl: 'https://cdn-icons-png.flaticon.com/512/833/833472.png',
      backgroundColor: Color(0xFFFFCDD2), // Light Red
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        index: _page,
        color: Colors.white,
        buttonBackgroundColor: Colors.white,
        backgroundColor: Colors.blue,
        animationCurve: Curves.easeInOut,
        animationDuration: const Duration(milliseconds: 600),
        onTap: (index) {
          setState(() {
            _page = index;
          });
        },
        items: const [
          Icon(Icons.access_alarm),
          Icon(Icons.ac_unit),
          Icon(Icons.accessible),
          Icon(Icons.add_call),
          Icon(Icons.favorite),
        ],
      ),
      body: _pages[_page],
    );
  }
}

class PageContent extends StatelessWidget {
  final String title;
  final String imageUrl;
  final Color backgroundColor;

  const PageContent({
    Key? key,
    required this.title,
    required this.imageUrl,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: backgroundColor,
      width: double.infinity,
      height: double.infinity,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Image.network(imageUrl, height: 120, width: 120),
          ],
        ),
      ),
    );
  }
}
