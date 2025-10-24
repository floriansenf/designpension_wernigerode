import 'dart:async';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// Wird nicht verwendet ??
class HomePage extends StatefulWidget {
   final String url;
  HomePage({
    Key key, @required this.url}) : super(key: key);
 
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final Completer<WebViewController> _controller = Completer<WebViewController>();
  PageController _pageController = PageController();
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).padding.top;
    String ur=widget.url;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: EdgeInsets.only(top: height),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children: <Widget>[
            
         WebViewKeepAlive(url: ur),
        
          const WebViewKeepAlive(url: "https://www.designpensionen-wernigerode.de/karte/"),
          const WebViewKeepAlive(url: "https://www.designpensionen-wernigerode.de/portfolio_page/designapartments-stadtidyll/"),
          ],
          onPageChanged: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.black,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.house),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.location_solid),
            label: 'Karte',
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.hotel),
            label: 'Designapartment',
          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Color.fromARGB(255, 255, 255, 255),
        selectedItemColor: Color(0xFFded6d1),
        onTap: (index) {
          if(index==0){
            Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyHomePage(title: "PKV"),
              ),
            );
          }else{
            setState(() => _selectedIndex = index);
            _pageController.jumpToPage(index);
          }
        
        },
      ),
    );
  }
}