import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:settings/services/login_controller.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final TextEditingController _emailcontroller = TextEditingController();
  final TextEditingController _passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final loginViewmodel = Provider.of<LoginViewModel>(context,listen: false);

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/bg_image.png'),
                    fit: BoxFit.cover)),
          ),
          SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(height: 80,),
                Center(
                  child: SizedBox(
                    height: 50,
                    width: 220,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            child: Image.asset('assets/images/piano_image.png')),
                        Expanded(
                            child: Image.asset('assets/images/logo_image.png'))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Login',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 100,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(children: [
                    TextFormField(
                      controller : _emailcontroller,
                      style:  const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                          hintText: 'Johndoepiano@gmail.com',
                          hintStyle: const TextStyle(color: Colors.grey),
                          filled: true,
                          fillColor: Colors.grey[850],
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: const BorderSide(width: 5))),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextFormField(
                      controller : _passwordcontroller,
                      obscureText: true,
                        style:  const TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            hintText: '● ● ● ● ● ● ● ● ●',
                            hintStyle: const TextStyle(color: Colors.grey),
                            filled: true,
                            fillColor: Colors.grey[850],
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20),
                                borderSide: const BorderSide(width: 5))),
                        ),
                    const SizedBox(
                      height: 40,
                    ),
                    ElevatedButton(
                        onPressed: () {
                          String deviceKey = 'hjghjghggjg';
                          loginViewmodel.login(
                            _emailcontroller.text,
                            _passwordcontroller.text,
                            deviceKey,
                            context
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            foregroundColor: Colors.black,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            minimumSize: const Size(double.infinity, 50)),
                        child: const Text(
                          'Login',
                          style: TextStyle(fontSize: 18),
                        ))
                  ]),
                ),
                const SizedBox(
                  height: 100,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Don’t have an account?',
                      style: TextStyle(fontSize: 14, color: Colors.white),
                    ),
                    TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                            padding: const EdgeInsets.only(left: 4)),
                        child: const Text('Create One',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                              decoration: TextDecoration.underline,
                              decorationColor: Colors.white
                                )))
                  ],
                ),
                const SizedBox(
                  height: 250,
                ),
              ],
            ),
          ),
          Positioned(
              bottom: 5,
              left: 0,
              right: 0,
              child: Row(
                mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'By continuing, you are agreeing to our ',
                style: TextStyle(fontSize: 14, color: Colors.white),),
              TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero
                  ),
                  child: const Text('Terms and Conditions.',
                      style: TextStyle(
                          fontSize: 14,
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          decorationColor: Colors.white
                      )))
            ],
          ))
        ],
      ),
    );
  }
}
