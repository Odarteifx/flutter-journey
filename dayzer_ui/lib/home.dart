import 'package:flutter/material.dart';

class MyAppInterface extends StatefulWidget {
  const MyAppInterface({super.key});

  @override
  State<MyAppInterface> createState() => _MyAppInterfaceState();
}

int _selectedPage = 0;

class _MyAppInterfaceState extends State<MyAppInterface> {
  @override
  
  Widget build(BuildContext context) {
    
    return Scaffold( 
      bottomNavigationBar: NavigationBar(
        selectedIndex: _selectedPage,
        destinations: const [
          NavigationDestination(icon: Icon(Icons.home), label: '',),
           NavigationDestination(icon: Icon(Icons.folder_open), label: '',),
           NavigationDestination(icon: Icon(Icons.inbox), label: '',),
          NavigationDestination(icon: Icon(Icons.calendar_today), label: '' ),
        ],
        onDestinationSelected:(value) {
          setState(() {
            _selectedPage = value;
          });
        },
        ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(20,60,20,0),
              // Row for Dayzer_Ui
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      CircleAvatar(radius: 25, backgroundImage: NetworkImage('https://images.pexels.com/photos/9869646/pexels-photo-9869646.jpeg?'),),
                       SizedBox(width: 10,),
                       Text('Hi, Odartei!',style: TextStyle(fontWeight: FontWeight.w300, fontSize: 13),),
                    ],
                  ),
                  Badge(child: Icon(Icons.notifications_sharp))
                ],
              ),
            ),
            const SizedBox(height: 30,),
            const Padding(
                 padding: EdgeInsets.symmetric(horizontal: 20),
                 child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Tasks for today:', style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),),
                    Row(
                      children: [
                        Icon(Icons.star, size: 18, color: Colors.amber,),
                        SizedBox(width: 5,),
                        Text('5 available', style: TextStyle(color: Colors.grey),),
                      ],
                    )
                  ],
                             ),
               ),
        
              const SizedBox(height: 30,),
        
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.search),
                    labelText: 'Search',
                    border: OutlineInputBorder( 
                      borderRadius: BorderRadius.all(Radius.circular(5)),
                      )
                    ),
                  textInputAction: TextInputAction.search, 
                  keyboardType: TextInputType.text,
                  ),
              ),
              const SizedBox(height: 30,),
        
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Last connections', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18 ),),
                        Text('See all', style: TextStyle( color: Colors.grey, fontSize: 13),)
                      ],
                    ),
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CircleAvatar( radius: 30, backgroundImage: NetworkImage('https://images.pexels.com/photos/11555718/pexels-photo-11555718.jpeg?'),),
                        SizedBox(width: 10,),
                        CircleAvatar(radius: 30, backgroundImage: NetworkImage('https://images.pexels.com/photos/8864283/pexels-photo-8864283.jpeg?'),),
                        SizedBox(width: 10,),
                        CircleAvatar(radius: 30, backgroundImage: NetworkImage('https://images.pexels.com/photos/15901955/pexels-photo-15901955/free-photo-of-a-man-standing-in-front-of-a-green-mountain.jpeg?'),),
                        SizedBox(width: 10,),
                        CircleAvatar(radius: 30, backgroundImage: NetworkImage('https://images.pexels.com/photos/20108517/pexels-photo-20108517/free-photo-of-landscape-fashion-man-love.jpeg?'),),
                        SizedBox(width: 10,),
                         CircleAvatar( radius: 30, child: Text('+5',), ),
                      ],
                    ),
                  ],
                ),
              ),
               const SizedBox(height: 30,),
        
              Container(
               padding:const EdgeInsets.all(20),
               height: 400,
               decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                 color: Colors.white,
               ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text('Active Projects', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),),
                        Text('See all', style: TextStyle(color: Colors.grey, fontSize: 13),)
                      ],
                    ),
                    const SizedBox(height: 20,),
                    Container(
                      
                      padding: const EdgeInsets.all(20),
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.orange[50],
                      ),
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Numero 10', style: TextStyle(color: Colors.grey),),
                              Text('4h', style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text('Blog and social posts', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            ],
                          ),
                          SizedBox(height: 30,),
        
                          Row(
                            children: [
                              Icon(Icons.error_outline, size: 18,),
                              SizedBox(width: 5,),
                              Text('Deadline is today',style: TextStyle(fontWeight: FontWeight.w300,) ),
                            ],
                          )
                        ],
                      ),
                     
                    ),
                    const SizedBox(height: 10,),
                     Container(
                      
                      padding: const EdgeInsets.all(20),
                      height: 150,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.orange[50],
                      ),
                      child: const Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Grace Aroma', style: TextStyle(color: Colors.grey),),
                              Text('7d', style: TextStyle(color: Colors.grey),),
                            ],
                          ),
                          SizedBox(height: 10,),
                          Row(
                            children: [
                              Text('December Blues', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),),
                            ],
                          ),
                          SizedBox(height: 30,),
        
                          Row(
                            children: [
                              Icon(Icons.done_all_outlined, size: 18,),
                              SizedBox(width: 5,),
                              Text('Task Completed',style: TextStyle(fontWeight: FontWeight.w300,) ),
                            ],
                          )
                        ],
                      ),
                     
                    ),
                   
                  ],
                ),
              )
            ],
            ),
      ),
    );
  }
}