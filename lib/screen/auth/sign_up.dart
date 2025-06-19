import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
// Hello
    bool _rememberme = false;
  @override
  Widget build(BuildContext context) {
    final _formKey =GlobalKey< FormState> ();
    final _emailController = TextEditingController();
    final _passwordController = TextEditingController();
    bool _Obscure = true;

    return Scaffold(
      body: Stack(
        children:  [
          Container(
            // decoration: BoxDecoration(
            //   color: Colors.lightBlueAccent
            // ),
            width: double.infinity,
            height: double.infinity,
            child: Image.asset('assets/newbenz1.png',
            fit: BoxFit.cover,),
          ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(' Sign Up ',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                    color: Colors.white),
                    ),
                  SizedBox(height: 30,),
                  Form(key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(
                            labelText: 'Email',labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (value)=>
                          value!.isEmpty ? ' Enter your Email' : null,
                        ),
                        SizedBox(height: 14,),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Password',labelStyle: TextStyle(color:Colors.white) ,
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          obscureText: true,
                         validator: (value) => 
                         value != null && value.length >= 8 ?null : 'Minimum 8 characters',
                          
                         
                            
                        ),
                        SizedBox(height: 14,),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Re-Enter your password',labelStyle: TextStyle(color: Colors.white),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          obscureText: true,
                         validator: (value) => 
                         value != null && value.length >= 8 ?null : 'Minimum 8 characters',
                          
                         
                            
                        ),
                      ],
                    ),
                    ),
                    SizedBox(height: 10,),
                  
            
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: OutlinedButton(
                        onPressed: (){}, 
                        style: OutlinedButton.styleFrom(),
                        child: Text('Sign Up',
                        style: TextStyle(color: Colors.white,
                        fontSize: 18,
                        ),
                        ),
                        ),

                    ),
                    SizedBox(height: 10,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account?",style: TextStyle(color: Colors.white),),
                        TextButton(
                          onPressed: (){}, 
                          child: Text('Log In')
                          ,),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
    );
    
}
}