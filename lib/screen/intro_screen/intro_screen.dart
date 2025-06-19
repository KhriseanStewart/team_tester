import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(width: double.infinity,
            color: Colors.blue,
            child: Image.asset("assets/intro_image1.jpg", fit: BoxFit.cover),
           ),
          Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Velocity CarWash',
                          style: TextStyle(fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          ),
                          ),
            
                            SizedBox(height: 22,),
            ElevatedButton(style:ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
              backgroundColor: Colors.white,
            ),
                         onPressed: () {
              
            }, 
            child: Text('SIGN UP'),
            ),
            SizedBox(height: 12,),
                      ElevatedButton(style:ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),
                        backgroundColor: Colors.white,
                      ),
                     onPressed: () {
                        
                      }, 
                      child: Text('LOG IN'),
                      ),
              ],
            ),
          ),
        
          
          
        ],
      ),
    );
  }
}
// hello world
