import 'package:travelling_app/models/modelsInistances.dart';
import 'package:travelling_app/pages/homePage.dart';
import 'package:travelling_app/models/myModelsStructures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HotelWidget extends StatelessWidget {


  Widget SeeAllText()
  {
    return  GestureDetector(
      onTap: () => print('See All'),
      child:const Text(
        'See All',
        style: TextStyle(
          color:Color(0xffff0062),
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          letterSpacing: 1.0,
        ),
      ),
    );

  }
  Widget topDest_text() {
    return const Text(
      'Execlusive Hotels',
      style: TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.bold,
        letterSpacing: 1.5,
      ),
    )
    ;
  }
  Widget destImageContainer(Hotel dest)
  {
    return Container(
      height: 150,
      width: 180,
      decoration:BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: const[
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0.0, 2.0),
            blurRadius: 6.0,
          ),

        ],
      ),

      child:  ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Stack(
          children: <Widget>[
            Image(
              height: 180.0,
              width: 180.0,
              image: AssetImage(dest.imageUrl),
              fit: BoxFit.cover,

            ),
            Positioned(
              left: 10.0,
              bottom: 10.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    dest.name,
                    style:const TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1.0,
                    ),
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        FontAwesomeIcons.locationArrow,
                        size: 10.0,
                        color: Colors.white,
                      ),
                      const SizedBox(width: 5.0),
                      Text(
                        dest.address,
                        style:const TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),

      ),
    );
  }
  Widget destinationInfoContainer(Hotel des)
  {
    return  Container(
      height: 130,
      width: 180,
      //color: Colors.white,
      decoration: BoxDecoration(
        color: const Color(0xff2d2e2d),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Padding(
        padding: EdgeInsets.all(5.0),
        child:  Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              '${des.name} activities',
              style:const TextStyle(
                fontSize: 8.0,
                fontWeight: FontWeight.w600,
                letterSpacing: 0.8,
              ),
            ),
            Text(
              des.address,
              style:const TextStyle(
                color: Colors.white,
              ),
            ),
            SizedBox(height: 2.0),
            Text(
              '\$${des.price} / night',
              style:const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget destinationLV()
  {
    return Container(
      height: 250,
      // color: Color,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: destinations.length,
        itemBuilder:(BuildContext context, int index) {
          Hotel destination = hotels[index];
          return Container(
            margin:const EdgeInsets.all(10.0),
            width: 180,
            height :200,
            // color:const Color(0xff2d2e2d),
            child: Stack(
              alignment: Alignment.topCenter,
              children: <Widget>[
                //information container
                Positioned(
                  bottom: 10,
                  child:  destinationInfoContainer(destination),
                ) ,
                // image container
                destImageContainer(destination),
              ],
            ),
          );
        },
      ),

    );
  }
  @override
  Widget build(BuildContext context) {

    return Column(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                topDest_text(),
                SeeAllText(),
              ],
            ),
          ),
          destinationLV(),
        ]
    );
  }

}
