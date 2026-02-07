import 'package:depi_five/const.dart';
import 'package:depi_five/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum Type { Male, Female }

class BmiCalc extends StatefulWidget {
  const BmiCalc({super.key});

  @override
  State<BmiCalc> createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  Type selectedType = Type.Male;
  double height = 40;
  int width = 60;
  int age = 26;


  @override
  void didChangeDependencies() async{
   
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      appBar: AppBar(
        backgroundColor: backgroundColor,
        title: Text(
          "BMI Calculator",
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: .spaceEvenly,
                children: [
                  Row(
                    children: [
                      /// 1x + 3 x = width
                      _typeWidget(Type.Male),
                      SizedBox(width: 10),
                      _typeWidget(Type.Female),
                    ],
                  ),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Column(
                      children: [
                        Text(
                          "Height",
                          style: CustomTextStyles.primaryTextStyle(),
                        ),
                        Row(
                          mainAxisAlignment: .center,
                          crossAxisAlignment: .end,
                          children: [
                            Text(
                              height.toInt().toString(),
                              style: TextStyle(
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                            Text("cm", style: TextStyle(color: Colors.white)),
                          ],
                        ),
                        Slider(
                          min: 40,
                          max: 200,
                          value: height,
                          onChanged: (val) {
                            height = val;
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Weight",
                                style: CustomTextStyles.primaryTextStyle(),
                              ),
                              Text(
                                width.toString(),
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  FloatingActionButton(
                                    mini: true,
                                    shape: CircleBorder(),

                                    onPressed: () {
                                      width--;
                                      setState(() {});
                                    },
                                    child: Icon(Icons.remove),
                                  ),
                                  Spacer(),
                                  FloatingActionButton(
                                    mini: true,
                                    shape: CircleBorder(),
                                    onPressed: () {
                                      width++;
                                      setState(() {});
                                    },
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(width: 10),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            children: [
                              Text(
                                "Age",
                                style: CustomTextStyles.primaryTextStyle(),
                              ),
                              Text(
                                age.toString(),
                                style: TextStyle(
                                  fontSize: 40,
                                  color: Colors.white,
                                ),
                              ),
                              Row(
                                children: [
                                  FloatingActionButton(
                                    mini: true,
                                    shape: CircleBorder(),

                                    onPressed: () {
                                      age--;
                                      setState(() {});
                                    },
                                    child: Icon(Icons.remove),
                                  ),
                                  Spacer(),
                                  FloatingActionButton(
                                    mini: true,
                                    shape: CircleBorder(),
                                    onPressed: () {
                                      age++;
                                      setState(() {});
                                    },
                                    child: Icon(Icons.add),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
      bottomNavigationBar: InkWell(
        onTap: () async {
          double bmi = width / ((height / 100) * (height / 100));
          print("BMI is $bmi");
          String msg = "";
          if (bmi < 18.5) {
            msg = "You are underweight";
          } else if (bmi >= 18.5 && bmi < 24.9) {
            msg = "You have a normal weight";
          } else if (bmi >= 25 && bmi < 29.9) {
            msg = "You are overweight";
          } else {
            msg = "You are obese";
          }

          AlertDialog alert = AlertDialog(
            title: Text("BMI is : ${bmi.toInt()}"),
            content: Text(msg),
          );

          await showDialog(
            context: context,
            builder: (BuildContext context) {
              return alert;
            },
          );
        },
        child: Container(
          height: 100,
          color: Color(0xFFE83D67),
          child: Center(
            child: Text(
              "Calculate",
              style: TextStyle(color: Colors.white, fontSize: 32),
            ),
          ),
        ),
      ),
    );
  }

  Expanded _typeWidget(Type type) {
    return Expanded(
      child: InkWell(
        onTap: () {
          selectedType = type;
          setState(() {});
        },
        child: Container(
          decoration: BoxDecoration(
            color: type == selectedType ? Colors.grey[800] : primaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Column(
            children: [
              SvgPicture.asset(
                type == Type.Male
                    ? "assets/icons/male_icon.svg"
                    : "assets/icons/female_icon.svg",
              ),
              Text(
                type == Type.Male ? "Male" : "Female",
                style: CustomTextStyles.primaryTextStyle(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
