import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => FirstRoute(),
        '/second': (context) => SecondRoute(),
        '/Third': (context) => ThirdRoute(),
        '/Fourth': (context) => FourthRoute(),
      },
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}

class FirstRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Instituto federal de ciência e tecnologia do piauí'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Imagem no topo
          Image.network(
            'https://revistaaz.com.br/wp-content/uploads/2022/09/ifpi-940x600.jpg',
            height: 200.0,
          ),

          // Espaçamento
          SizedBox(height: 30.0),

          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                labelText: 'Email',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          SizedBox(height: 30.0),

          
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0),
            child: TextField(
              keyboardType: TextInputType.text,
              obscureText: true,
              decoration: InputDecoration(
                labelText: 'Senha',
                border: OutlineInputBorder(),
              ),
            ),
          ),

          SizedBox(height: 30.0),

          
          ElevatedButton(
            onPressed: () {
              Navigator.pushNamed(context, '/second');
            },
            child: Text('ENTRAR'),
          ),

          
          SizedBox(height: 30.0),

          
        ],
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('IFPI MENU')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Imagem no topo central
          Container(
            height: 200.0, // Altura da imagem
            child: Image.network(
              'https://revistaaz.com.br/wp-content/uploads/2022/09/ifpi-940x600.jpg',
              fit: BoxFit.cover, // Ajuste para cobrir o espaço disponível
            ),
          ),
          SizedBox(height: 20.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: ElevatedButton(
                child: Text('CONTATOS'),
                onPressed: () {},
              )),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/Third');
                  },
                  child: Text('ABASTECER'),

                  // Remove a sombra do botão
                ),
              )
            ],
          ),
          SizedBox(height: 20.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/Fourth');
                      },
                      child: Text('APP'))),
              Expanded(
                  child: ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/');
                      },
                      child: Text('RETORNAR')))
            ],
          )
        ],
      ),
    ));
  }
}

class ThirdRoute extends StatefulWidget {
  const ThirdRoute({super.key});

  @override
  State<ThirdRoute> createState() => _HomeState();
}

class _HomeState extends State<ThirdRoute> {
  final TextEditingController _textEditingControllerGasolina =
      TextEditingController();
  final TextEditingController _textEditingControllerAlcool =
      TextEditingController();

  double resultado = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gasolina x Alcool'),
      ),
      body: Container(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(32),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(32),
                child: Text(
                  'Gasolina x Alcool',
                  style: TextStyle(
                    fontSize: 30.0,
                    color: Colors.pink[200],
                  ),
                ),
              ),
              Image.network(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNpOmAncrasgXKICs6U2m3DAOV2k3LfZxbotBrou7NDOistlvn5o5Q0-CLdl_G9lFpGL8&usqp=CAU'),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(label: Text('Valor da gasolina')),
                controller: _textEditingControllerGasolina,
                onSubmitted: (String Valor) {
                  print('Valor' + _textEditingControllerGasolina.text);
                },
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(label: Text('Valor do Alcool')),
                controller: _textEditingControllerAlcool,
                onSubmitted: (String Valor) {
                  print('Valor' + _textEditingControllerAlcool.text);
                },
              ),
              ElevatedButton(
                  child: Text('Calcular'),
                  onPressed: () {
                    setState(() {
                      resultado = double.parse(
                              _textEditingControllerAlcool.text) /
                          double.parse(_textEditingControllerGasolina.text) *
                          100;

                      print('Calcular ' + resultado.toString());
                    });
                  }),
              Padding(
                padding: EdgeInsets.only(top: 10.0),
                child: Text('Resultado: $resultado'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FourthRoute extends StatefulWidget {
  const FourthRoute({super.key});

  @override
  State<FourthRoute> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<FourthRoute> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My App'),
      ),
      drawer: Drawer(),
      body: Center(
        child: Column(
          children: [Text('This is my app')],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: Icon(Icons.settings), label: 'Settings'),
          BottomNavigationBarItem(icon: Icon(Icons.menu), label: 'Menu')
        ],
      ),
    );
  }
}
