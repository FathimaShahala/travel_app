import 'package:flutter/material.dart';
import 'package:travel_app/Screens/bottom_navigation.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 125, 138, 184),
      appBar:AppBar(
      backgroundColor: const Color.fromARGB(255, 42, 81, 224),
        title: GestureDetector(
          onTap: (){
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (_) => BottomNavigationScreen(),
              )
            );
          },
          child: const Center(
            child: Column(
              children: [
                SizedBox(height: 10,),
                Row(
                  children: [
                    Icon(Icons.arrow_back_ios_new_outlined,
                    color: Colors.white,
                    size: 20,
                    ),
                    SizedBox(width: 10,),
                    Text(
                      'Back',
                      style: TextStyle(
                        fontStyle: FontStyle.normal,
                        fontSize: 20,
                        color: Colors.white,
                    ),
                    )
                  ],
                ),
                
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:const EdgeInsets.only(top: 20) ,
          child: Column(
            children: [
              const Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundImage:AssetImage("assets/avatar.jpg"),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('Gilbert Jones',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),textAlign: TextAlign.center),
                      Text('Glbertjones001@gmail.com',style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w400),),
                      Text('121-224-7890',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight:FontWeight.w400 ) ,),
                    ],
                  ),

                ],
              ),
              SizedBox(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Icon(Icons.facebook),
                  Image.asset("assets/instagram.png",width: 21,height: 21,),
                  Container(
                    padding: EdgeInsets.only(left: 30,right: 30),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30.0),
                      child: Container(
                        color: const Color.fromARGB(255, 63, 69, 174),
                        height: 30,
                        width: 75,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text('Edit',style: TextStyle(color: Colors.white,fontSize: 12,fontWeight: FontWeight.w700,),textAlign: TextAlign.center,),
                        ),
                      ),
                    ),
                  ),  
                ],
              ),
              
              const SizedBox(height: 30,), 
              Column(
                children: [
                  SizedBox(height: 30,),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15,right: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text("My Albums",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                              Row(
                                children: [
                                  Text("View All"),
                                  Icon(Icons.arrow_right)
                                ],
                              ),
                          ],
                        ),
                      ),
                        SizedBox(height: 10,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 180,
                              height: 200,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1),
                                    blurRadius: 0.1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 180,
                              height: 200,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1),
                                    blurRadius: 0.1,
                                  ),
                                ],
                              ),
                            ),     
                          ],
                        ),
                      ],
                    ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("Favourite Place",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                        Row(
                          children: [
                            Text("View All"),
                            Icon(Icons.arrow_right)
                          ],
                        ),
                      ],
                    ),
                  ),
                   
                    SizedBox(height: 10,),
                    Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 180,
                              height: 200,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1),
                                    blurRadius: 0.1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 180,
                              height: 200,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1),
                                    blurRadius: 0.1,
                                  ),
                                ],
                              ),
                            ),     
                          ],
                        ),
                       SizedBox(height: 30,),
                   Padding(
                    padding: const EdgeInsets.only(left: 15,right: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text("My Journeys",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
                        Row(
                          children: [
                            Text("View All"),
                            Icon(Icons.arrow_right)
                          ],
                        ),
                      ],
                    ),
                  ),
                    SizedBox(height: 10,),
                    Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 180,
                              height: 200,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1),
                                    blurRadius: 0.1,
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 180,
                              height: 200,
                              decoration: const BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10),
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10),
                                ),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0, 1),
                                    blurRadius: 0.1,
                                  ),
                                ],
                              ),
                            ),     
                          ],
                        ),
                ],
              ),
              SizedBox(height: 15,),
              
            ],
          ),
        ),
      ),
    );
  }
}
