
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  dynamic currentindex = 0;
  dynamic result;
  // declare input controller
  TextEditingController heightController = TextEditingController();
  TextEditingController weighttController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "BMI Calculator",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 25),
          ),
          elevation: 0.0,
          backgroundColor: const Color.fromARGB(249, 167, 137, 137),
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.settings,
                  color: Colors.black,
                ))
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    radioButton("Man", Colors.amber, 0),
                    radioButton("Woman", Colors.pink, 1)
                  ],
                ),
                const SizedBox(
                  height: 20.0,
                ),
                //Now reate our input form
                const Text(
                  "Your height in Cm :",
                  style: TextStyle(fontSize: 25.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    controller: heightController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "Your Height in Cm",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none))),

//input text field forweight
                const SizedBox(
                  height: 20.0,
                ),
                //Now reate our input form
                const Text(
                  "Your Weight in Kg :",
                  style: TextStyle(fontSize: 25.0),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextField(
                    keyboardType: TextInputType.number,
                    controller: weighttController,
                    textAlign: TextAlign.center,
                    decoration: InputDecoration(
                        hintText: "Your Weight in Kg",
                        filled: true,
                        fillColor: Colors.grey[200],
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: BorderSide.none))),
//Now add calculatted button
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  height: 60.0,
                  child: ElevatedButton(
                      onPressed: () {
                        double height =
                            double.parse(heightController.value.text);
                        double weight =
                            double.parse(weighttController.value.text);
                        CalculateBMI(height, weight);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(117, 9, 75,
                            36), // Set the background color of the button
                      ),
                      child: const Text(
                        "Calculate",
                        style: TextStyle(
                            fontSize: 23, fontWeight: FontWeight.bold),
                      )),
                ),
//Now add label and show result
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: const Text(
                    "Your BMI is  :",
                    textAlign: TextAlign.center,
                    style:
                        TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
                  ),
                ),
                //for showing Result
                const SizedBox(
                  height: 20,
                ),
                Container(
                  width: double.infinity,
                  child: Text(
                    "$result",
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 40.0, fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
 clear(){
  heightController.clear();
  weighttController.clear();
  CalculateBMI(1,0);
 }



  void CalculateBMI(double height, double weight) {
    double finalresult = weight / (height * height / 10000);
    String bmi = finalresult.toStringAsFixed(2);
    setState(() {
      result = bmi;
    });
  }

  void changeIndex(int index) {
    setState(() {
      currentindex = index;
    });
  }

//   //now am create a new custom widget
  Widget radioButton(String value, Color color, int index) {
    return Expanded(
        child: Container(
            height: 90,
            margin: const EdgeInsets.symmetric(horizontal: 12.0),
            child: ElevatedButton(
              onPressed: () {
                changeIndex(index);
                clear();
                
                
                
              },
              style: ElevatedButton.styleFrom(
                // returns ButtonStyle
                backgroundColor:
                    currentindex == index ? color : Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  // (Not working - Read note!!)
                ),
              ),
              child: Text(
                value,
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: currentindex == index ? Colors.white : color),
              ),
            )));
  }
}
