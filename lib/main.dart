import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:webview_flutter/webview_flutter.dart';

import 'package:connectivity_plus/connectivity_plus.dart';

import 'home.dart';
void main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.black,
  ));
  WidgetsFlutterBinding.ensureInitialized();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Designpensionen Wernigerode',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(title: 'Designpensionen Wernigerode'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key, @required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final Completer<WebViewController> _controller =
      Completer<WebViewController>();
  PageController _pageController = PageController();
  int _selectedIndex = 0;
  @override
  void initState() {
  
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).padding.top;
  const u="https://www.designpensionen-wernigerode.de/";
  const e= "";
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: Container(
        margin: EdgeInsets.only(top: height),
        child: PageView(
          physics: NeverScrollableScrollPhysics(),
          controller: _pageController,
          children:const <Widget>[
           Home(),
           WebViewKeepAlive(url: "https://www.designpensionen-wernigerode.de/karte/"),
           WebViewKeepAlive(url: "https://www.designpensionen-wernigerode.de/portfolio_page/designapartments-stadtidyll/"),
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
          setState(() => _selectedIndex = index);
          _pageController.jumpToPage(index);
        },
      ),
    );
  }

}

class WebViewKeepAlive extends StatefulWidget {
  final String url;

  const WebViewKeepAlive({Key key, @required this.url}) : super(key: key);

  @override
  _WebViewKeepAlive createState() => _WebViewKeepAlive();
}

class _WebViewKeepAlive extends State<WebViewKeepAlive>
    with AutomaticKeepAliveClientMixin {
  Future<String> _future; //late 

  @override
  bool get wantKeepAlive => true;

  Future<String> _getUrl(String url) async {
    await Future.delayed(Duration(milliseconds: 500), () {});
    return Future.value(url);
  }

  var subscription;
  @override
  void initState() {

    _future = _getUrl(widget.url);

    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      setState(() {
        // _future = _getUrl(widget.url);
      });
    });

    super.initState();
  }

  @override
  dispose() {
    super.dispose();
    subscription.cancel();
  }

  Future<ConnectivityResult> getconnectivity() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    return connectivityResult;
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
  
    return FutureBuilder(
      future: _future,
      builder: (context, AsyncSnapshot<String> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return Text('none');
          case ConnectionState.waiting:
            return const Center(
                child: CircularProgressIndicator(
              color: Colors.black,
            ));
          case ConnectionState.active:
            return Container();
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text(
                '${snapshot.error}',
                style: TextStyle(color: Colors.red),
              );
            } else {
              return FutureBuilder(
                  future: Connectivity().checkConnectivity(),
                  builder: (context, AsyncSnapshot<ConnectivityResult> result) {
                    if (result.data == ConnectivityResult.wifi || result.data == ConnectivityResult.mobile ) {
                      return WebView(
                          initialUrl: snapshot.data,
                          javascriptMode: JavascriptMode.unrestricted);
                    } else {
                      return const Center(
                        child: Text(
                          "Verbindung verloren",
                          style: TextStyle(fontSize: 18),
                        ),
                      );
                    }
                  });
            }
        }
      //  default: return Container();
      },
    );
  }
}