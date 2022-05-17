import 'package:flutter/material.dart';
import 'package:rehabbudy/models/disease_data.dart';
import 'package:rehabbudy/screens/patient_details_screen/patient_details_screen.dart';
import '../../../utils/constant/app_bar.dart';
import '../../home/home.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar(
            "Check any of the condition",
            () => Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (_) => PatientDetailsScreen())),
            () => Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (_) => Home()))),
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(8.0, 18.0, 8.0, 0),
        height: size.height,
        width: size.width,
        child: GestureDetector(
          onTap: (() => print("Hello")),
          child: GridView.builder(
              itemCount: diseaseData.length,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount:
                      (orientation == Orientation.portrait) ? 2 : 3),
              itemBuilder: (BuildContext context, int index) {
                return Card(
                    color: Color(0xFFFFFFFF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(21),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          diseaseData[index].imgUrl,
                          height: 50,
                          width: 50,
                        ),
                        Text(
                          diseaseData[index].diseaseName,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Color(0xFF252E4E),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w400,
                              fontSize: 12),
                        )
                      ],
                    ));
              }),
        ),
      ),
    );
  }
}
