import 'package:flutter/material.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
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
            decoration: BoxDecoration(
              color: Colors.lightBlueAccent
            ),
            width: double.infinity,
            height: double.infinity,
            // child: Image.asset('assets/intro_image1.jpg',
            // fit: BoxFit.cover,),
          ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(mainAxisAlignment: MainAxisAlignment.center,
                             crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(' Log In ',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                  SizedBox(height: 30,),
                  Form(key: _formKey,
                    child: Column(
                      children: [
                        TextFormField(
                          controller: _passwordController,
                          decoration: InputDecoration(labelText: 'Email',
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                          ),
                          validator: (value)=>
                          value!.isEmpty ? ' Enter your Email' : null,
                        ),
                        SizedBox(height: 14,),
                        TextFormField(
                          controller: _emailController,
                          decoration: InputDecoration(labelText: 'Password',
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
                    Row(
                      children: [
                        Checkbox(
                          value: _rememberme, 
                          onChanged: (value) {
                            setState(() {
                              _rememberme = value!;
                            });
                            
                          },),
                          Text('Remember Me'),
                      ],
                    ),
                    SizedBox(height: 10,),
            
                    SizedBox(
                      width: double.infinity,
                      height: 40,
                      child: OutlinedButton(
                        onPressed: (){}, 
                        style: OutlinedButton.styleFrom(),
                        child: Text('Log In',
                        style: TextStyle(color: Colors.black,
                        fontSize: 18),
                        ),
                        ),
                    ),
                    SizedBox(height: 10,),
                    Row(mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Don't have an account?"),
                        TextButton(
                          onPressed: (){}, 
                          child: Text('Sign Up')
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