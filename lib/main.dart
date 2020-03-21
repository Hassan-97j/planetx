import 'package:flutter/material.dart';

void main() => runApp(Myapp());

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Planet",
      home: Homepage(),
    );
  }
}

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

/* mercury 0.38
  venus 0.91
  earth 1.00
  mars 0.38
  jupiter 2.34
  saturn 1.06
   uranus 0.92
  neputune 1.19
  pluto 0.06 */ 
class _HomepageState extends State<Homepage> {
  final TextEditingController _weightcontroller = TextEditingController();
  double _finalResult = 0.0;
 String _formattedText = '';

  int radioValue = 0;
  void handleRadioValueChanged(int value) {
    setState(() {
      radioValue = value;
      switch (radioValue){
        case 0:
        _finalResult = calculateWeight(_weightcontroller.text, 0.06);
        _formattedText = "your weight on pluto is ${_finalResult.toStringAsFixed(2)}";
        break;
        case 1:
        _finalResult = calculateWeight(_weightcontroller.text, 0.38);
        _formattedText = "your weight on mars is ${_finalResult.toStringAsFixed(2)}";
        break;
        case 2:
        _finalResult = calculateWeight(_weightcontroller.text, 0.91);
        _formattedText = "your weight on venus is ${_finalResult.toStringAsFixed(2)}";
        break;
                      }
                    });
                  }
                
                  @override
                  Widget build(BuildContext context) {
                    return Scaffold(
                      appBar: AppBar(
                          title: Text(
                            'Weight on planet',
                            style: TextStyle(color: Colors.white30),
                          ),
                          centerTitle: true,
                          backgroundColor: Colors.deepPurpleAccent),
                      backgroundColor: Colors.cyanAccent,
                      body: Container(
                          alignment: Alignment.topCenter,
                          padding: EdgeInsets.only(top: 8,left: 6, right: 6),
                          child:
                              ListView(padding: const EdgeInsets.all(2.5), children: <Widget>[
                            Image.asset(
                              "images/space.png",
                              height: MediaQuery.of(context).size.height*0.50,
                              width: MediaQuery.of(context).size.width,
                            ),
                            Container(
                              margin: EdgeInsets.all(3.0),
                              alignment: Alignment.center,
                              child: Column(children: <Widget>[
                                TextField(
                                  controller: _weightcontroller,
                                  keyboardType: TextInputType.number,
                                  decoration: InputDecoration(
                                      labelText: 'your Weight on Earth',
                                      hintText: 'In KGs',
                                      prefixIcon: Icon(Icons.person_outline)),
                                ),
                                Padding(padding: const EdgeInsets.all(5.0)),
                                Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      Radio<int>(
                                        value: 0,
                                        groupValue: radioValue,
                                        onChanged: handleRadioValueChanged,
                                        activeColor: Colors.redAccent,
                                      ),
                                      Text(
                                        'pluto',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Radio<int>(
                                        value: 1,
                                        groupValue: radioValue,
                                        onChanged: handleRadioValueChanged,
                                        activeColor: Colors.redAccent,
                                      ),
                                      Text(
                                        'mars',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                      Radio<int>(
                                        value: 2,
                                        groupValue: radioValue,
                                        onChanged: handleRadioValueChanged,
                                        activeColor: Colors.redAccent,
                                      ),
                                      Text(
                                        'venus',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ]),
                                    Padding(padding: const EdgeInsets.all(6.0)),
                                    Text(
                                      // _weightcontroller.text.isNotEmpty ? "please enter your weight" : _formattedText + "KGs",
                                      '$_formattedText KGs',
                                    style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w500 ),
                                    )
                              ]),
                            )
                          ])),
                    );
                  }
        
          double calculateWeight(String weight, double multiplier) {
            if (int.parse(weight).toString().isNotEmpty && int.parse(weight) > 0)
            {
              return int.parse(weight) * multiplier;
            }
            else{
              print('wrong!');
              return int.parse('180') * 0.38;            }
          }
        }
        

