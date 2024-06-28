import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data={};

  @override
  Widget build(BuildContext context) {

    data = data.isNotEmpty ? data : ModalRoute.of(context)?.settings.arguments as Map? ?? {};
    print(data);
    //Set The Background
    String bgImg=data['isDayTime']? 'Day.jpg':'Night.jpg';
    Color? bgColor=data['isDayTime']? Colors.blue : Colors.indigo[700];


    return Scaffold(
      backgroundColor: bgColor,
      body:Container(
        decoration: BoxDecoration(
          image: DecorationImage(
          image:AssetImage('assets/$bgImg'),
            fit: BoxFit.cover,
        ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0.0, 120.0, 0.0, 0.0),
          child: SafeArea(
            child: Column(
              children: [
                TextButton.icon(
                    onPressed: () async {
                      dynamic loc = await Navigator.pushNamed(context, '/location');
                      setState(() {
                        data = {
                          'time' : loc['time'],
                          'location' : loc['location'],
                          'isDayTime' : loc['isDayTime'],
                          'flag' : loc['flag'],
                        };
                      });
                    },
                    icon: Icon(
                      Icons.edit_location,
                      color: Colors.grey[300],
                    ),
                  label:Text(
                      'Choose Location',
                       style: TextStyle(
                         color: Colors.white,
                       ),
                  ),
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                        data['location'],
                        style: TextStyle(
                          fontSize: 20.0,
                          letterSpacing: 1.0,
                        ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Text(
                  data['time'],
                  style: TextStyle(
                    fontSize: 66.0,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
