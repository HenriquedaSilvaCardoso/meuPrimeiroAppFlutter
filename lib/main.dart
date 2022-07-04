import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(const MaterialApp(
    // método que vai inflar nosso app (executar)
    // um Widget que já vem com bastante coisas de configurações prontas.
    home: HomePage(
      title: 'HomePage',
    ),
    debugShowCheckedModeBanner:
        false, // setando que a minha home (tela inicial) será HomePage.
  ));
}

class HomePage extends StatefulWidget {
  final String title;

  const HomePage({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  State<HomePage> createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  // Classe Stateless Widget (Sem estado)
  int num = 0;

  List<String> links = [
    'https://cdn.pixabay.com/photo/2022/06/21/21/56/konigssee-7276585_960_720.jpg',
    'https://cdn.pixabay.com/photo/2014/11/21/03/26/neist-point-540119_960_720.jpg',
    'https://cdn.pixabay.com/photo/2013/07/18/20/26/sea-164989_960_720.jpg',
    'https://cdn.pixabay.com/photo/2013/10/02/23/03/mountains-190055_960_720.jpg',
    'https://cdn.pixabay.com/photo/2013/11/28/10/36/road-220058_960_720.jpg',
    'https://cdn.pixabay.com/photo/2013/10/02/23/03/mountains-190055_960_720.jpg',
  ];
 
  void changeImage() {
    setState(() {
      num = Random().nextInt(links.length);
    });
  }

  @override
  Widget build(BuildContext context) {
    // método que irá "buildar" toda nossa view
    // passando o context (juda a identificar nossa árvore) e retornando um Widget.
    return Scaffold(
        // esqueleto do app, sempre interessante ter 1 em cada Page
        appBar: AppBar(
          // Widget do próprio Flutter para AppBar.
          title: const Text('LEEEES GOOO'),
        ),
        body: SingleChildScrollView(
          child: Center(
              // Widget para centralizar dentro do espaço disponível
              child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Olá, como você está?',
                  style: TextStyle(
                    color: Colors.purple,
                    fontWeight: FontWeight.w900,
                    fontSize: 20.0,
                  ),
                ),
              ),
              const Text(
                'Estou bem, e você?',
              ),
              Image.network(
                links[num],
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                  onPressed: () {
                    changeImage();
                  },
                  child: const Text(
                    // Widget para mostrar um texto na tela
                    'Enabled',
                  )),
              Row(
                children: [
                  Text(
                    'Hello ',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    'Hello ',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                  Text(
                    'Hello ',
                    style: Theme.of(context).textTheme.headline4,
                  ),
                ],
              )
            ],
          )),
        ));
  }
}
