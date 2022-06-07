import 'package:exam/generator.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);
  

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<Numbers> numbers;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    numbers= getNumbers();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height:20),
            FutureBuilder<Numbers>(
              future:numbers ,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Text(snapshot.data!.random.toString());
                }
                else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
                },
            ),

            const SizedBox(height:20),



            Container(
              padding: const EdgeInsets.all(20),
              decoration: const BoxDecoration(color: Colors.blue),
              child: TextButton(

                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
                ),

                onPressed: () {
                  setState(() {
                    numbers=getNumbers();
                  });

                  print(numbers);

                  },


                child: const Text(
                  'Generate',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
              ),
            )
          ]
        ),
      ),
    );
  }
}
