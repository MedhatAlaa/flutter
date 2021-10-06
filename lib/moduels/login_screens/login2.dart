import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
var emailController=TextEditingController();
var passwordController=TextEditingController();
var formKey=GlobalKey<FormState>();
class LoginScreen2 extends StatelessWidget {
  const LoginScreen2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.white ,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              children:
              [
                const Image(
                  image: NetworkImage('https://image.freepik.com/free-vector/mobile-login-concept-illustration_114360-83.jpg'),
                  height: 200.0,
                  width: double.infinity,
                ),
                const Text(
                  'Welcome back!',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Login now to your existant account of Q Allure',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  keyboardType:TextInputType.emailAddress,
                  controller:emailController,
                  validator:(value)
                  {
                    if(value!.isEmpty)
                      {
                        return 'Email must not be empty';
                      }
                    return null;
                  } ,
                  decoration: InputDecoration(
                    labelText: 'Email Address',
                    prefixIcon:const Icon(
                      Icons.person_outline_outlined,
                    ),
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                TextFormField(
                  keyboardType:TextInputType.visiblePassword,
                  obscureText: true,
                  controller:passwordController,
                  validator:(value)
                  {
                    if(value!.isEmpty)
                    {
                      return 'Password is too short';
                    }
                    return null;
                  } ,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    prefixIcon:const Icon(
                      Icons.lock_outline,
                    ),
                    border: OutlineInputBorder(
                      borderRadius:BorderRadius.circular(20.0),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 5.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const
                  [
                    Text(
                      'Forgot Password?',
                      textAlign: TextAlign.right,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Container(
                  width: 200.0,
                  decoration:BoxDecoration(
                    color: Colors.blue[900],
                    borderRadius:BorderRadius.circular(20.0),
                  ),
                  child: MaterialButton(
                      onPressed:()
                      {
                        if(formKey.currentState!.validate())
                          {
                            print(emailController.text);
                            print(passwordController.text);
                          }
                      },
                    child:const Text(
                      'LOG IN',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                    'Or connect using ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  children:
                  [
                    Expanded(
                      child: Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.blue[900],
                        ) ,
                        child: MaterialButton(
                            onPressed:(){},
                          child:Row(
                            children: const
                            [
                              Icon(
                                Icons.facebook_outlined,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                  'Facebock',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20.0,
                    ),
                    Expanded(
                      child: Container(
                        decoration:BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.red,
                        ) ,
                        child: MaterialButton(
                            onPressed:(){},
                          child:Row(
                            children: const
                            [
                              Icon(
                                Icons.copyright,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                  'Google',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:
                  [
                    const Text(
                        'Don\'t have an account?',
                    ),
                    TextButton(
                        onPressed:(){},
                        child:const Text(
                            'Sign up',
                        ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
