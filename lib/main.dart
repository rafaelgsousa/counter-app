import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int count = 0;
  // String message = 'May come!';

  void decrement() {
    setState(() {
      count--;
      // if (count > 0) count--;
      // if (count < 20) message = 'May come';
    });
    print(count);
  }

  void increment() {
    setState(() {
      count++;
      // if (count == 20) message = 'store is full';
    });
    print(count);
  }

  bool get isEmpty => count == 0;
  bool get isFull => count >= 20;

  @override
  Widget build(BuildContext context) {
    print('build');
    return Scaffold(
        backgroundColor: Colors.black,
        body: Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/pexels-lukas-1352278.jpg'),
                fit: BoxFit.cover,
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                isFull ? 'Is Full' : isEmpty ? 'Empty' : 'May come',
                style: TextStyle(
                    fontSize: 30,
                    color: isFull ? Colors.red : Colors.black,
                    fontWeight: FontWeight.w900,
                    letterSpacing: 3),
              ),
              Padding(padding: const EdgeInsets.all(32),
                child: Text(
                  '$count',
                  style: TextStyle(fontSize: 80, color: isFull ? Colors.red : Colors.black),
                ),),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: isEmpty ? null : decrement,
                    style: TextButton.styleFrom(
                        backgroundColor: isEmpty ? Colors.white.withOpacity(0.2) : Colors.white,
                        fixedSize: const Size(100, 100),
                        foregroundColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          // side: BorderSide(color: Colors.green, width: 5),
                            borderRadius: BorderRadius.circular(24))),
                    child: const Text(
                      'Left',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                  const SizedBox(width: 32,),
                  TextButton(
                      onPressed: isFull ? null : increment,
                      style: TextButton.styleFrom(
                          backgroundColor: isFull ? Colors.white.withOpacity(0.2) : Colors.white,
                          fixedSize: const Size(100, 100),
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            // side: BorderSide(color: Colors.green, width: 5),
                              borderRadius: BorderRadius.circular(24))),
                      child: const Text(
                        'Enter',
                        style: TextStyle(fontSize: 30),
                      ))
                ],
              )
            ],
          ),
        ));
  }
}
