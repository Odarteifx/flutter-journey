
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Flutter',
      debugShowCheckedModeBanner: false,
      home: MyAppInterface(), 
    );
  }
}

class MyAppInterface extends StatefulWidget {
  const MyAppInterface({super.key});

  @override
  State<MyAppInterface> createState() => _MyAppInterfaceState();
}

class _MyAppInterfaceState extends State<MyAppInterface> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar( title: const Text('Exploore N.Y'),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.network('https://www.state.gov/wp-content/uploads/2022/01/shutterstock_248799484-scaled.jpg'),
            const TileSection(),
            const IconsTile(),
            const TextSection(),
          ],
        ),
      ),
    );
  }
}

class TileSection extends StatelessWidget {
  const TileSection({super.key});

  final name = 'Times Square';
  final location = 'New York City, USA';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 5.0),
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    ),
                ),
                  Text(
                    location,
                    style: TextStyle(
                      color: Colors.grey[500],
                    ),
                    )
              ],
            )
            ),

            const Icon(
              Icons.star,
              color: Colors.red,
              size: 40,
            ),
            const SizedBox(width: 10,),
            const Text(
              '45',
              
            ),
            const SizedBox(width: 10,),
        ],
      ),
    );
  }
}

class IconsTile extends StatelessWidget {
  const IconsTile({super.key});


  @override
  
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Icon(
              Icons.phone,
              color: color,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'CALL',
              style: TextStyle(color: color),
              ),
            ), 
          ],
        ),
         Column(
          children: [
            Icon(
              Icons.near_me,
              color: color,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                'ROUTE',
              style: TextStyle(color: color),
              ),
            ), 
          ],
        ),
         Column(
          children: [
            Icon(
              Icons.share,
              color: color,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text('SHARE',
              style: TextStyle(color: color),
              ),
            ), 
          ],
        )
      ],
    );
  }
}

class TextSection extends StatelessWidget {
  const TextSection({super.key});
final description = 
'Times Square is a major commercial intersection, tourist destination, entertainment hub, and neighborhood in Midtown Manhattan, New York City, United States. It is formed by the junction of Broadway, Seventh Avenue, and 42nd Street. '
'Together with adjacent Duffy Square, Times Square is a bowtie-shaped plaza five blocks long between 42nd and 47th Streets.'
'Times Square is brightly lit by numerous digital billboards and advertisements as well as businesses offering 24/7 service. One of the world\'s busiest pedestrian areas,[3] it is also the hub of the Broadway Theater District[4] and a major center of the world\'s entertainment industry.'

;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(32.0),
      child: Text(
        description,
        softWrap: true,
        style: const TextStyle(
        //  fontSize: 15,
        ),
      ),
    );
  }
}