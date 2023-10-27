import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calories calculate',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Calcula tus calorías'),
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
  String _sexo ='Masculino';
  final _peso = TextEditingController();
  final _edad = TextEditingController();
  final _estatura = TextEditingController();
  String _actividad = 'Sedentario';
  double _calories = 0;
  String _calories2 = '';
  void _caloriesCalculate() {
    setState(() {
      if(_sexo == 'Masculino'){
        _calories=66+(13.7*double.parse(_peso.text))+(5*double.parse(_estatura.text))-(6.8*double.parse(_edad.text));
      }
      else if(_sexo == 'Femenino'){
        _calories=65+(9.6*double.parse(_peso.text))+(1.8*double.parse(_estatura.text))-(4.7*double.parse(_edad.text));
      }

      if(_actividad == 'Sedentario'){
        _calories = _calories*1.2;
      }
      else if(_actividad == 'Poca'){
        _calories = _calories*1.375;
      }
      else if(_actividad == 'Moderada'){
        _calories = _calories*1.55;
      }
      else if(_actividad == 'Intensa'){
        _calories = _calories*1.725;
      }
      else if(_actividad == 'Atleta'){
        _calories = _calories*1.9;
      }
      _calories2 = _calories.toStringAsFixed(2);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        leading: const Icon(
          Icons.water_drop,
          color: Colors.blueGrey,
        ),
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal:10,vertical:16),
        child: Center(
          child: Column(

            children: <Widget>[
              const Text(
                'Para calcular la cantidad de calorías que debes consumir al día ingresa los siguientes datos',
                style: TextStyle(
                  fontSize: 16,
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Sexo:',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle:FontStyle.italic,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    width: 90.0,
                  ),
                  Container(
                    width: 230,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color:Colors.black45),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal:10,vertical:16),
                    child: DropdownButton <String>(
                      //initialValue: selectedMenu,
                      // Callback that sets the selected popup menu item.
                      value: _sexo,
                      icon: Icon(Icons.arrow_drop_down),
                      style: const TextStyle(color: Colors.black87, fontSize: 16),
                      onChanged: (newsex){
                        setState(() {
                          _sexo = newsex!;
                        });
                      },
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'Masculino',
                          child: Text('Masculino                           '),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Femenino',
                          child: Text('Femenino                            '),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Peso (Kg):',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle:FontStyle.italic,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    width: 53.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: _peso,
                      decoration:const InputDecoration(
                          border:OutlineInputBorder(),
                          labelText: 'Ingrese su peso '),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Estatura (cm):',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle:FontStyle.italic,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: _estatura,
                      decoration:const InputDecoration(
                          border:OutlineInputBorder(),
                          labelText: 'Ingrese su estatura '),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Edad:',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle:FontStyle.italic,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    width: 95.0,
                  ),
                  Flexible(
                    child: TextFormField(
                      controller: _edad,
                      decoration:const InputDecoration(
                          border:OutlineInputBorder(),
                          labelText: 'Ingrese su edad '),
                      keyboardType: TextInputType.number,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const Text(
                    'Actividad:',
                    style: TextStyle(
                      fontSize: 20,
                      fontStyle:FontStyle.italic,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(
                    width: 54.0,
                  ),
                  Container(
                    width: 230,
                    height: 60,
                    decoration: BoxDecoration(
                      border: Border.all(color:Colors.black45),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    padding: const EdgeInsets.symmetric(horizontal:10,vertical:16),
                    child: DropdownButton <String>(
                      //initialValue: selectedMenu,
                      // Callback that sets the selected popup menu item.
                      value: _actividad,
                      icon: Icon(Icons.arrow_drop_down),
                      style: const TextStyle(color: Colors.black87, fontSize: 16),
                      onChanged: (newactividad){
                        setState(() {
                          _actividad = newactividad!;
                        });
                      },
                      items: const [
                        DropdownMenuItem<String>(
                          value: 'Sedentario',
                          child: Text('Sedentario    '),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Poca',
                          child: Text('Poca actividad física'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Moderada',
                          child: Text('Moderada actividad física'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Intensa',
                          child: Text('Intensa actividad física'),
                        ),
                        DropdownMenuItem<String>(
                          value: 'Atleta',
                          child: Text('Atleta profesional '),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                style: TextButton.styleFrom(
                  textStyle: const TextStyle(
                      color: Colors.black87,
                      fontSize: 20),
                  backgroundColor: Colors.indigo[200],
                ),
                onPressed: (){
                  _caloriesCalculate();
                },
                child: const Text(
                  "Calcular",
                  style: TextStyle(
                      color: Colors.black87,
                      fontSize: 20
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Text(
                'Las calorías que debes consumir son: ',
                style: const TextStyle(
                  fontSize: 20,
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                '$_calories2',
                style: const TextStyle(
                  fontSize: 25,
                  fontStyle: FontStyle.italic,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
