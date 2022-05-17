import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:rehabbudy/screens/disease_screen/disease_screen.dart';
import 'package:rehabbudy/screens/home/home.dart';
import 'package:rehabbudy/screens/patient_details_screen/components/title_text.dart';
import 'package:rehabbudy/utils/constant/app_bar.dart';
import 'package:rehabbudy/utils/constant/custom_button.dart';
import 'package:rehabbudy/utils/constant/form_input_field.dart';
import 'package:rehabbudy/utils/validator.dart';
import 'custom_tab_bar.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  final _formkey = GlobalKey<FormState>();
  final patientNameController = TextEditingController();
  final mobileNumberController = TextEditingController();
  final dateOfBirthController = TextEditingController();
  final genderController = TextEditingController();
  final guardianNameController = TextEditingController();
  final guardianMobileNumberController = TextEditingController();
  final guardianDateOfBirthController = TextEditingController();
  final gusrdianGenderController = TextEditingController();

  final items = ['Male','Female','Others'];
  String? value;
  String? value1;

  TabController? _tabController;
  String? _dropdownError;
  int _selectedIndex = 0;


  bool isDropdownOpened = false;
  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 6, vsync: this);
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: CustomAppBar("Enter Patient Details",() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home())),() => Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => Home()))),
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Padding(
          padding: EdgeInsets.fromLTRB(8, 15, 8, 10),
          child: ListView(
            children: [
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18)),
                child: Image.asset("assets/images/patient_image.jpg"),
              ),
              const SizedBox(
                height: 10,
              ),
              TitleText("Who is the Patient"),
              const SizedBox(
                height: 10,
              ),
              CustomTabBar(_tabController!),
              const SizedBox(
                height: 10,
              ),
              Form(
                  key: _formkey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      PatientFormInputFields(
                          size,
                          patientNameController,
                          nameValidator,
                          TextInputType.name,
                          "Name of the patient"),
                      const SizedBox(
                        height: 10,
                      ),
                      PatientFormInputFields(
                        size,
                        mobileNumberController,
                        phoneNumberValidator,
                        TextInputType.phone,
                        "Mobile Number",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Dob_PickerFormFields(
                        size,
                        dateOfBirthController,
                        "Date of Birth of the patient",
                        () async {
                          selectedDate();
                        },
                        (value){if(value.isEmpty){
                          return 'Please enter patient date of birth';
                        }else{
                          return null;
                        }}
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      genderPicker(size),
                      TitleText("Guardian information"),
                      const SizedBox(
                        height: 10,
                      ),
                      PatientFormInputFields(
                          size,
                          guardianNameController,
                          nameValidator,
                          TextInputType.name,
                          "Name of the guardian"),
                      const SizedBox(
                        height: 10,
                      ),
                      PatientFormInputFields(
                        size,
                        guardianMobileNumberController,
                        phoneNumberValidator,
                        TextInputType.phone,
                        "Mobile Number",
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Dob_PickerFormFields(
                          size,
                          guardianDateOfBirthController,
                          "Date of Birth of the guardian", () async {
                        _selectedDate();
                      },
                      (value){if(value.isEmpty){
                          return 'Please enter guardian date of birth';
                        }else{
                          return null;
                        }}),
                      const SizedBox(
                        height: 10,
                      ),
                      _genderPicker(size),
                      const SizedBox(
                        height: 15,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 105.0, right: 18),
                        child: CustomButton(
                          "Next",
                          () {
                            if (_formkey.currentState!.validate()) {
                              Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (_) => DiseaseScreen()));
                            }
                          },
                          BorderRadius.all(Radius.circular(4.0)),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
      ),
    );
  }

  Container genderPicker(Size size) {
    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
                        height: size.height * 0.05,
                        width: size.width * 0.98,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(8.0),border: Border.all(color: Color(0xFFCAD2D9)),color: Colors.white),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                      value: value,
                                      iconSize: 25,
                                      hint: Text("Gender",style: TextStyle(color: Color(0xFFA8A7A7)),),
  
                                      icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                                      isExpanded: true,
                                      items: items.map(buildMenuItems).toList(), onChanged: (value) => setState(() => this.value = value as String?),
                                      ),
                            ),);
  }

  DropdownMenuItem<String> buildMenuItems(String item) => 
    DropdownMenuItem(value: item,child: Text(item,style: TextStyle(fontSize: 16),),);

Container _genderPicker(Size size) {
    return Container(
                      padding: EdgeInsets.symmetric(horizontal: 15,vertical: 4),
                        height: size.height * 0.05,
                        width: size.width * 0.98,
                        decoration:
                            BoxDecoration(borderRadius: BorderRadius.circular(8.0),border: Border.all(color: Color(0xFFCAD2D9)),color: Colors.white),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                      value: value1,
                                      iconSize: 25,
                                
                                      hint: Text("Gender",style: TextStyle(color: Color(0xFFA8A7A7)),),
                                      
                                      icon: Icon(Icons.arrow_drop_down,color: Colors.black,),
                                      isExpanded: true,
                                      items: items.map(buildMenuItems).toList(), onChanged: (value1) => setState(() => this.value1 = value1 as String?),),
                                      
                            ),);
  }

  DropdownMenuItem<String> _buildMenuItems(String item) => 
    DropdownMenuItem(value: item,child: Text(item,style: TextStyle(fontSize: 16),),);


  Future<void> selectedDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            1990), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2022, 12),
        builder: (context,child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xFF38B6FF),
                onPrimary: Colors.white,
                onSurface: Colors.black
              ),
              textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.red))
            ), child: child!)
        });

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      print(formattedDate);

      setState(() {
        dateOfBirthController.text = formattedDate;
      }); //formatted date output using intl package =>  2021-03-16
      //you can implement different kind of Date Format here according to your requirement
    } else {
      print("Date is not selected");
    }
  }

  Future<void> _selectedDate() async {
    DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(
            1990), //DateTime.now() - not to allow to choose before today.
        lastDate: DateTime(2022, 12),
        builder: (context,child) {
          return Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color(0xFF38B6FF),
                onPrimary: Colors.white,
                onSurface: Colors.black
              ),
              textButtonTheme: TextButtonThemeData(style: TextButton.styleFrom(primary: Colors.red))
            ), child: child!)
        });
        

    if (pickedDate != null) {
      print(pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
      String formattedDate = DateFormat('dd-MM-yyyy').format(pickedDate);
      print(formattedDate);

      setState(() {
        guardianDateOfBirthController.text = formattedDate;
      }); //formatted date output using intl package =>  2021-03-16
      //you can implement different kind of Date Format here according to your requirement
    } else {
      print("Date is not selected");
    }
  }
}

