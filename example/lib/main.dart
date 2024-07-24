import 'package:blendmask/blendmask.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            buildTextWithBlendMask(context),
            const SizedBox(height: 40),
            buildImageStackWithBlendMask(context),
          ],
        ),
      ),
    );
  }

  Widget buildTextWithBlendMask(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Container(
                height: 60,
                color: Colors.blue,
              ),
            ),
            Expanded(
              child: Container(
                height: 60,
                color: Colors.yellow,
              ),
            ),
          ],
        ),
        BlendMask(
          blendMode: BlendMode.colorBurn,
          child: Text(
            'HELLO WORLD!',
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  fontWeight: FontWeight.bold,
                ),
          ),
        ),
      ],
    );
  }

  Widget buildImageStackWithBlendMask(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network("https://images.dog.ceo/breeds/akita/Akita_Inu_dog.jpg"),
        Positioned(
          right: 0,
          top: 60,
          bottom: 60,
          child: BlendMask(
            blendMode: BlendMode.luminosity,
            child: Image.network(
                "https://images.dog.ceo/breeds/spaniel-irish/n02102973_634.jpg"),
          ),
        ),
        BlendMask(
          blendMode: BlendMode.overlay,
          child: Text(
            'HELLO WORLD!',
            style: Theme.of(context)
                .textTheme
                .headlineLarge!
                .copyWith(fontWeight: FontWeight.bold, fontSize: 52),
          ),
        ),
      ],
    );
  }
}
