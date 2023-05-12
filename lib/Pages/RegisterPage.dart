import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'LoginPage.dart';


class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  bool password = true;
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: ListView(
          padding: const EdgeInsets.all(20),
          scrollDirection: Axis.vertical,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                    onPressed: () {
                      // balik ke awal
                      Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const Login(), 
                        )
                      );
                    },
                    icon: const Icon(Icons.arrow_back_rounded)),

                // Hero Image
                const SizedBox(
                  height: 15,
                ),
                Center(
                    child: Lottie.asset(
                  'lottie/register.json',
                  width: 270,
                  height: 270,
                )),
                const SizedBox(
                  height: 15,
                ),

                // Sign Up
                const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Input Start
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Icon(Icons.alternate_email_rounded),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          // contentPadding: EdgeInsets.symmetric(horizontal: 10), ini buat ngasih jarak text
                          border: UnderlineInputBorder(),
                          labelText: 'Email',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                const Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Icon(Icons.person),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'No. Ktp',
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: 12),
                      child: Icon(Icons.lock_rounded),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          labelText: 'Password',
                          suffixIcon: IconButton(onPressed: (){
                            setState(() {
                              password = !password;
                            });
                          }, icon: Icon(password == false ? Icons.visibility : Icons.visibility_off))
                        ),
                        obscureText: password,
                      ),
                    ),
                  ],
                ),
                // Input End

                // Text Privacy Policy
                Container(
                  margin: const EdgeInsets.only(left: 0, top: 20),
                  child: Row(
                    children: [
                      const Text(
                        'By signing up, you’re agree to our',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w200,
                            fontSize: 13
                            ),
                            
                      ),
                      Container(
                        child: const Text(
                          ' Terms & Conditions ',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.w200,
                            fontSize: 13
                              ),
                              
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(left: 0, bottom: 20),
                  child: const Row(
                    children: [
                      Text(
                        'and ',
                        style: TextStyle(
                            color: Colors.black, fontWeight: FontWeight.w200,
                            fontSize: 13
                            ),
                      ),
                      Text(
                        'Privacy Policy',
                        style: TextStyle(
                            color: Colors.blue, fontWeight: FontWeight.w200,
                            fontSize: 13
                            ),
                      )
                    ],
                  ),
                ),

                // Button Start
                Center(
                  child: Container(
                      width: 320,
                      height: 50,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.resolveWith<Color>(
                                  (Set<MaterialState> states) {
                            if (states.contains(MaterialState.pressed)) {
                              // return Colors
                              //     .red; // Mengatur warna latar belakang saat tombol ditekan menjadi merah
                            }
                            return const Color(
                                0xFF0065FF); // Mengatur warna latar belakang saat tombol tidak ditekan menjadi biru
                          }),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context, 
                            MaterialPageRoute(
                              builder: (context) => const Login(),
                            )
                          );
                        },
                        child: const Text('Continue'),
                      )),
                )
              ],
            ),
          ],
        ),
        // icon
      ),
      backgroundColor: Colors.white,
    );
  }
}
