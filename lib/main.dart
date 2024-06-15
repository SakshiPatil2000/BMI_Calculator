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
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'BMI Calculator'),
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
  var wtController=TextEditingController();
  var ftController=TextEditingController();
  var inController=TextEditingController();
  var result="";
  var bgColor =Colors.deepPurple.shade200;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,

        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.amber,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("BMI", style: TextStyle(fontSize: 34, fontWeight: FontWeight.w500),),
                SizedBox(height: 21,),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    label: Text('Enter Your Weight In KG'),
                    prefixIcon: Icon(Icons.line_weight),

                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    label: Text('Enetr your height in feet'),
                    prefixIcon: Icon(Icons.height),

                  ),
                ),
                SizedBox(height: 11,),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    label: Text('Enter your height in inch'),
                    prefixIcon: Icon(Icons.height),
                  ),
                ),
              SizedBox(height: 21,),
                ElevatedButton(onPressed: (){

                 var weight=wtController.text.toString();
                 var feet =ftController.text.toString();
                 var inch=inController.text.toString();

                 if(weight!="" && feet!="" && inch!="" ){
                   //BMI calculation
                   var iwt= int.parse(weight);
                   var ift= int.parse(feet);
                   var iinch =int.parse(inch);

                   var tinch=(ift*12)+iinch;
                   var tcm= tinch*2.54;
                   var tm= tcm/100;

                   var bmi= iwt/(tm*tm);
                   var msg ="";

                   if(bmi>25){
                     msg = "You are over weight";
                     bgColor=Colors.orange.shade200;

                   }else if (bmi <18){

                     msg = "You are Under Weight";
                     bgColor=Colors.red.shade200;

                   }else{
                     msg ="You are Healthy";
                     bgColor=Colors.green.shade200;
                   }

                   setState(() {
                     result="$msg \n Your BMI is ${bmi.toStringAsFixed(2)}";
                   });

                 }
                 else{
                   setState(() {
                     result="Please enter all the fields";
                   });

                 }



                },
                    child: Text('CALCULATE')),

                SizedBox(height: 21,),

                Text(result,style: TextStyle(
                  fontSize: 22,
                ),),

              ],
            ),
          ),
        ),
      )
    );
  }
}
