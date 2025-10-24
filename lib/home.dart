import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'homepage.dart';

class Home extends StatelessWidget{

  const Home({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return 
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(top: 40),
              child: const Image(
                image: AssetImage("assets/foto2.png"),width: 240,)),
            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
                primary: false,
                
                padding: const EdgeInsets.only(top: 30,left: 10,right: 10),
                children: <Widget> [
              
                  Card(
                    elevation: 2,
                    shape: const RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage( url: 'https://rrraumfahrtzentrum.de/',)),
                        );
                      },
                      child: Container(
                        color: Color.fromARGB(255, 0, 0, 0),
                          child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                            Icon(CupertinoIcons.house,size: 40,color: Colors.white,),
                            Text("Home",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ],),
                       
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    shape: const RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage( url: 'https://www.designpensionen-wernigerode.de/portfolio_page/esignapartments-traumschloss/',)),
                        );
                      },
                      child: Container(
                        color: Color.fromARGB(255, 0, 0, 0),
                          child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                            Icon(Icons.star_border,size: 40,color: Colors.white,),
                            Text("Traumschloss",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ],),
                       
                      ),
                    ),
                  ),
                  Card(
                    elevation: 2,
                    shape: const RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage( url: 'https://www.designpensionen-wernigerode.de/portfolio_page/smart-flex-idyll/',)),
                        );
                      },
                      child: Container(
                        color: Color.fromARGB(255, 0, 0, 0),
                          child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                            Icon(Icons.hotel_class_outlined,size: 40,color: Colors.white,),
                            Text("Flex Idyll",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ],),
                       
                      ),
                    ),
                  ),
                   Card(
                    elevation: 2,
                    shape: const RoundedRectangleBorder(
                     borderRadius: BorderRadius.all(Radius.circular(15))
                    ),
                    child: InkWell(
                      splashColor: Colors.blue.withAlpha(30),
                      onTap: () {
                       Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => HomePage( url: 'https://www.designpensionen-wernigerode.de/portfolio_page/households/',)),
                        );
                      },
                      child: Container(
                        color: Color.fromARGB(255, 0, 0, 0),
                          child: Column(
                             mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
                            children: const [
                            Icon(Icons.hotel_class,size: 40,color: Colors.white,),
                            Text("Berg Idyll",style: TextStyle(color: Colors.white,fontSize: 20),),
                          ],),
                       
                      ),
                    ),
                  ),
                ],),
            ),
          ],
        );
  }
}