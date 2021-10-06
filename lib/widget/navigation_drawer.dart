import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:jsonproject/controller/portfolio_data_controller.dart';
import 'package:jsonproject/models/navigation_drawer_model.dart';
import 'package:jsonproject/main.dart';
import 'package:get/get.dart';
import 'package:jsonproject/ui/login_screen.dart';


class DrawerWidget extends StatefulWidget {
  @override
  _DrawerWidgetState createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  late var _firstName;
  late var _email;
  final DataController controller = Get.find();
  final pages = [
    Center(
      child: Text('Index'),
    ),
    Center(
      child: Text('Portfolio'),
    ),
    Center(
      child: Text('Live Market'),
    ),
    Center(
      child: Text('Todays Price'),
    ),
    Center(
      child: Flexible(child: Text('Top Gainers/Losers')),
    ),
    Center(
      child: Flexible(child: Text('Search')),
    ),
    Center(
      child: Flexible(child: Text('Calculator')),
    ),
    Center(
      child: Flexible(child: Text('Chart')),
    ),
    // Center(
    //   child: Text('Logout'),
    // ),
  ];

  Function updateState(int index) {
    return () {
      setState(() {
        indexClicked = index;

      });
      Navigator.pop(context);
    };
  }
@override
  void initState() {
  _firstName = controller.userProfileData['firstName'];
  _email = controller.userProfileData['email'];
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: AssetImage('assets/images/drawer.jpg'),
                  ),
                ),
                padding: EdgeInsets.all(0),
                child: Container(
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 30,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Container(
                         child:
                         Text(
                          _firstName,
                           // '${controller.userProfileData['firstName']}',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        _email,
                        // '${controller.userProfileData['email']}',
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      ElevatedButton(onPressed: (){
                            Navigator.pop(context);
                            logout(context);
                      }, child: Text("Login/Loutgout")),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  color: Color(0xFF181D2A),
                  child: ListView(
                    padding: EdgeInsets.zero,
                    children: [
                      AppDrawerTile(
                        index: 0,
                        onTap: updateState(0),
                      ),
                      AppDrawerTile(
                        index: 1,
                        onTap: updateState(1),
                      ),
                      AppDrawerTile(
                        index: 2,
                        onTap: updateState(2),
                      ),
                      AppDrawerTile(
                        index: 3,
                        onTap: updateState(3),
                      ),
                      AppDrawerTile(
                        index: 4,
                        onTap: updateState(4),
                      ),
                      AppDrawerTile(
                        index: 5,
                        onTap: updateState(5),
                      ),
                      AppDrawerTile(
                        index: 6,
                        onTap: updateState(6),
                      ),
                      AppDrawerTile(
                        index: 7,
                        onTap: updateState(7),
                      ),
                      // AppDrawerTile(
                      //   index: 8,
                      //   onTap: updateState(8),
                      // ),
                      const SizedBox(
                        height: 30,
                      ),
                      const AppDrawerDivider(),
                      Center(
                        child: Text(
                          'Stock Market App',
                          style: TextStyle(fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            fontSize: 20,
                            color: Defaults.drawerItemSelectedColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Center(
                        child: Text(
                          'Version 1.0.0',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                            color: Defaults.drawerItemColor,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const AppDrawerDivider(),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
  }
  Future<void> logout(BuildContext context) async {
    await FirebaseAuth.instance.signOut();
    Phoenix.rebirth(context);
    Get.offAll(() => LoginScreen());

  }
}

class AppDrawerDivider extends StatelessWidget {
  const AppDrawerDivider({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: Defaults.drawerItemColor,
      indent: 3,
      endIndent: 3,
    );
  }
}

class AppDrawerTile extends StatelessWidget {
  const AppDrawerTile({
    Key? key,
    required this.index,
    required this.onTap,
  }) : super(key: key);

  final int index;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: ListTile(
        onTap: () {
          // Respond to item press.
           var _currentIndex = index;
          switch (_currentIndex) {
            case 0:
              {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/firstScreen');
              }
              break;
            case 1:
              {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/secondScreen');
              }
              break;
            case 2:
              {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/thirdScreen');
              }
              break;
            case 3:
              {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/fourthScreen');
              }
              break;
            case 4:
              {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/fifthScreen');

              }
              break;
            case 5:
              {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/sixthScreen');
              }
              break;
            case 6:
              {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/seventhScreen');
              }
              break;
            case 7:
              {
                Navigator.pop(context);
                Navigator.pushNamed(context, '/eighthScreen');
              }
              break;
            // case 8:
            //   {
            //     Navigator.pop(context);
            //     logout(context);
            //   }
            //   break;
          }
        },
        selected: indexClicked == index,
        selectedTileColor: Defaults.drawerSelectedTileColor,
        leading: Icon(
          Defaults.drawerItemIcon[index],
          size: 35,
          color: indexClicked == index
              ? Defaults.drawerItemSelectedColor
              : Defaults.drawerItemColor,
        ),
        title: Text(
          Defaults.drawerItemText[index],
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: indexClicked == index
                ? Defaults.drawerItemSelectedColor
                : Defaults.drawerItemColor,
          ),
        ),
      ),
    );
  }


}

