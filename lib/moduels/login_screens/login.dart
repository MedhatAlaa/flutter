import 'package:flutter/material.dart';

var emailController=TextEditingController();
var passwordController=TextEditingController();
var formKey=GlobalKey<FormState>();

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title:const Text(
          'Login Screen',
        ),
        actions:
        [
          IconButton(
            onPressed: (){},
            icon:const Icon(
                Icons.notification_important
            ),
          ),
          IconButton(
            onPressed: (){},
            icon:const Icon(
                Icons.search,
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children:
                [
                  const Image(
                      image: NetworkImage('https://image.freepik.com/free-vector/twofactor-authentication-isometric-landing-page_107791-6423.jpg') ,
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    'Login Now',
                    style: TextStyle(
                      fontSize: 30.0,
                      color: Colors.deepPurple,
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    color:Colors.deepPurple ,
                    child: TextFormField(
                      controller: emailController,
                      validator: (value)
                      {
                        if(value!.isEmpty)
                          {
                            return 'Email must not be empty';
                          }
                        return null;
                      },
                      keyboardType:TextInputType.emailAddress,
                      decoration:const InputDecoration(
                        hintText: 'Email Address ',
                        hintStyle:TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                            Icons.email,
                          color:Colors.white ,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    color:Colors.deepPurple,
                    child: TextFormField(
                      controller: passwordController,
                      keyboardType:TextInputType.visiblePassword,
                      validator: (value)
                      {
                        if(value!.isEmpty)
                        {
                          return 'Password is too short';
                        }
                        return null;
                      },
                      obscureText: true,
                      decoration:const InputDecoration(
                        hintText: 'Password',
                        hintStyle:TextStyle(
                          color: Colors.white,
                        ),
                        prefixIcon: Icon(
                          Icons.lock,
                          color:Colors.white ,
                        ),
                        suffixIcon: Icon(
                          Icons.remove_red_eye_rounded,
                          color:Colors.white ,
                        ),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  Container(
                    color: Colors.deepPurple,
                    width: double.infinity,
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
                          'LOGIN',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text (
                        'Don\'t have an account?'
                      ),
                      TextButton(
                          onPressed:(){},
                            child: const Text(
                              'register now',
                              style: TextStyle(
                                 color: Colors.deepPurple,
                              ),
                            ),
                          ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:const
                    [
                      CircleAvatar(
                        radius: 30.0,
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.facebook,
                          size: 50.0,
                          color: Colors.deepPurple,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
