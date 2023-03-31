import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  //const MyApp({super.key});

  List<Test> list = [
    Test(imageName: 'ronaldo.png', name: 'Ronaldo', backgroundColor: '#5324321',),
    Test(imageName: 'ronaldo.png', name: 'Ronaldo', backgroundColor: '#5324321',),
    Test(imageName: 'ronaldo.png', name: 'Ronaldo', backgroundColor: '#5324321',),
    Test(imageName: 'ronaldo.png', name: 'Ronaldo', backgroundColor: '#5324321',),
  ];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      //home: const MyHomePage(title: 'Flutter Demo Home Page'),
      //home: Test(imageName: 'ronaldo.png', name: 'Ronaldo', backgroundColor: '#5324321',),
      home: Scaffold(body: CoolBitch())
    );
  }
}

class Test extends StatelessWidget{
  Test({Key? key, required this.imageName, required this.name, required this.backgroundColor}) : super(key: key);
  final String imageName;
  final String name;
  final String backgroundColor;

  int _counter = 0;

  void _incrementCounter() {
    _counter++;
    print(_counter);
  }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text("Stateless"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Text(
                '$_counter',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ), // This trailing comma makes auto-formatting nicer for build methods.
      );
    }
}

class CoolButton extends StatelessWidget{
    CoolButton({Key? key, required this.text, required this.function}) : super(key: key);
    final String text;
    final Function function;

    @override
    Widget build(BuildContext context) {
        return ElevatedButton(
            onPressed: function(), child: Text("Текст крутой кнопочки: ${text.length}"));
    }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      print(_counter);
    });
  }

  // Container()
  // Text()
  // Column()
  // Row()
  // Scaffold()
  // Stack()
  // ElevatedButton()
  // TextButton()


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: 100,right: 100),
        color: (_counter > 3) ? Colors.green : Colors.red,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(widget.title,style: TextStyle(color: Colors.white),),
                const TextField(
                    style: TextStyle(fontSize: 22, color: Colors.blue),
                    maxLines: 10,
                    minLines: 5),
                const TextField(
                    style: TextStyle(fontSize: 22, color: Colors.blue),
                    maxLines: 10,
                    minLines: 5),
                Container(
                    margin: EdgeInsets.only(top: 30),
                    child: CoolButton(function: () {print("1");},text: "хай",)
                )
              ],
            ),
          ),
      ),
    );
  }
}
// ElevatedButton(
// // style: ButtonStyle(
// //   shape: OutlinedBorder(
// //
// //   )
// // ),
// onPressed: _incrementCounter, child: Container(
// height: 70,
// width: 200,
// child: Center(child: Text("Зарегаться",style: TextStyle(color: Colors.white,fontSize: 24),))))


class BasicBitch extends StatelessWidget{
    const BasicBitch({Key? key}) : super(key: key);
    @override
    Widget build(BuildContext context) {
        return Container(
          height: 500,
          width: 500,
          color: Colors.blue,
          child: const Center(child: Text("Я не меняюсь")),
        );
    }
}

class CoolBitch extends StatefulWidget{
    CoolBitch({Key? key}) : super(key: key);
    bool isLiked = false; /// наша булевая переменная в зависимости от которой будем по разному отображать наш виджет
    @override
    State<CoolBitch> createState() => CoolBitchState();
}

class CoolBitchState extends State<CoolBitch>{

  /// чтобы не передавать через конструктор в стейт переменную
  /// isLiked мы можем обратится к родительскому виджету через widget.isLiked

  void changeIsLiked(){
    setState(() { /// setState обновляет состояние виджета
      widget.isLiked = !widget.isLiked; /// в примере мы переключаем значение между true/false
    });
  }

    @override
    Widget build(BuildContext context) {
      return Container(
        height: 500,
        width: 500,
        padding: const EdgeInsets.all(150),
        color: (widget.isLiked) ? Colors.blue : Colors.red, /// тут используем тернарный оператор, по сути это if который мы можем запихнуть прямо в верстку
        child: ElevatedButton(onPressed: changeIsLiked, child: const Text("Поменяться")), /// и по нажатию кнопки будем менять значение переменной, о
                                                                                          /// бновлять состояние и виджет будет меняться
      );
    }
}