import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travelling_app/customWidgets/destinationWidget.dart';
import 'package:travelling_app/customWidgets/hotelsWidget.dart';
class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}


class _HomeScreenState extends State<Homepage> {
  int _selectedIndex = 0;
  int _currentTab = 0;
  List<IconData>  _icons = [
    FontAwesomeIcons.moneyBill,
    FontAwesomeIcons.recycle,
    FontAwesomeIcons.swimmingPool,
    FontAwesomeIcons.biking,
  ];

  Widget _buildIcon(int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Container(
        height: 50.0,
        width: 80.0,
        decoration: BoxDecoration(
          color: _selectedIndex == index
              ?const Color(0xffff0062)
              :const Color(0xffdddddd),
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Icon(
          _icons[index],
          size: 25.0,
          color: _selectedIndex == index
              ?const Color(0xffffffff)
              :const Color(0xFF000000),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        body: SafeArea(
            child: ListView(
                children: <Widget>[
                 const Padding(
                    padding: EdgeInsets.only(left: 20.0, right: 120.0),
                    child: Text(
                      'What would you like to find?',
                      style: TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold,),
                    ),
                  ),
                 const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: _icons.asMap().entries.map(
                          (MapEntry map) => _buildIcon(map.key),
                    ).toList(),
                  ),
                  const SizedBox(height: 20.0),
                  DestinationWidget(),
                  const SizedBox(height: 20.0),
                  HotelWidget(),
                ]
        ),
    ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int value) {
          setState(() {
            _currentTab = value;
          });
        },
        items:const [
          BottomNavigationBarItem
            (
            icon: Icon(
              Icons.find_in_page,
              size: 30.0,
            ),
            label: 'search',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.food_bank,
              size: 30.0,
            ),
            label: 'Food Delivery',
          ),
          BottomNavigationBarItem(
            icon: CircleAvatar(
              radius: 15.0,
              backgroundImage: NetworkImage('http://i.imgur.com/zL4Krbz.jpg'),
            ),
            label: 'Account',
          )
        ],
      ),
    );
  }
}