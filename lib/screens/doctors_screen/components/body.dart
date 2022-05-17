import 'package:flutter/material.dart';
import 'package:rehabbudy/screens/doctors_screen/components/tab_bar.dart';

class Body extends StatefulWidget {
  const Body({Key? key}) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> with TickerProviderStateMixin {
  TabController? _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
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
      appBar: _appBar("Professionals Doctors", () {}, (() {})),
      body: Container(
        height: size.height,
        width: size.width,
        color: Color(0xFFFFFFFF),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Container(
            height: size.height * 0.21,
            width: size.width,
            color: Color.fromARGB(255, 248, 245, 245),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              _doctorChatContainer(),
              CustomTabBar(
                tabController: _tabController!,
              )
            ]),
          )
        ]),
      ),
    );
  }

  _doctorChatContainer() {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.15,
      width: size.width,
      child: Stack(alignment: Alignment.center, children: [
        Positioned(
          left: 10,
          child: InkWell(
            onTap: () {},
            child: const CircleAvatar(
              backgroundColor: Colors.white,
              backgroundImage: NetworkImage(
                "https://img.freepik.com/free-photo/young-woman-hat-walks-city-uses-smartphone-hipster-walk-uses-phone-takes-photos-social-networks_231208-10715.jpg?w=996&t=st=1650606898~exp=1650607498~hmac=6506425111285a337d23cba66f6f11d296b4757a823b96910d18be1b16826a2b",
              ),
              radius: 40,
            ),
          ),
        ),
        Positioned(
            child: Container(
          height: size.height * 0.12,
          width: size.width * 0.5,
          child: Stack(children: [
            const Positioned(
                top: 15,
                left: 8,
                child: Text(
                  "Doctors chat",
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.w500,
                      fontSize: 14),
                )),
            Positioned(
              bottom: 15,
              left: 8,
              child: _activeDoctors(
                  Colors.black,
                  "https://img.freepik.com/free-photo/beautiful-doctor-pointing-fingers_1258-16474.jpg",
                  ""),
            ),
            Positioned(
                bottom: 15,
                left: 28,
                child: _activeDoctors(
                    Colors.black,
                    "https://www.pngitem.com/pimgs/m/455-4554771_doctor-png-female-doctor-transparent-background-png-download.png",
                    "")),
            Positioned(
                bottom: 15,
                left: 50,
                child: _activeDoctors(
                    Colors.black,
                    "https://e7.pngegg.com/pngimages/1014/346/png-clipart-physician-medicine-health-care-clinic-patient-male-doctor-service-pharmaceutical-drug.png",
                    "")),
            Positioned(
                bottom: 15,
                left: 75,
                child: _activeDoctors(
                    Colors.black,
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSoiWkTKGzkkF6UGkhQpPNHXrTVaGc3mceSSg&usqp=CAU",
                    "")),
            Positioned(
                bottom: 15,
                left: 95,
                child: _activeDoctors(Color(0xFF38B6FF), null, "+5")),
            const Positioned(
                bottom: 0,
                left: 18,
                child: Text(
                  "9 Active Doctors",
                  style: TextStyle(
                      color: Color(0xFF000000),
                      fontFamily: "Poppins",
                      fontWeight: FontWeight.bold,
                      fontSize: 10),
                )),
          ]),
        )),
        Positioned(
          right: 15,
          bottom: 25,
          child: Container(
            alignment: Alignment.center,
            height: size.height * 0.04,
            width: size.width * 0.18,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Color(0xFF38B6FF)),
            child: const Text(
              "Chat",
              style: TextStyle(
                  fontSize: 14,
                  fontFamily: "Poppins",
                  fontWeight: FontWeight.w500,
                  color: Colors.white),
            ),
          ),
        )
      ]),
    );
  }

  _activeDoctors(Color color, [String? imgUrl, String? text]) {
    return Container(
      height: 32,
      width: 32,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(32),
          border: Border.all(color: color, width: 1.5)),
      child: CircleAvatar(
        backgroundColor: Color(0xFF38B6FF),
        backgroundImage: NetworkImage(
          imgUrl.toString(),
        ),
        child: Text(
          text.toString(),
          style: const TextStyle(
              color: Colors.white,
              fontFamily: "Poppins",
              fontWeight: FontWeight.w500,
              fontSize: 12),
        ),
        radius: 18,
      ),
    );
  }

  _appBar(String title, VoidCallback onPressed, VoidCallback onTab) {
    return AppBar(
      backgroundColor: Color(0xFF38B6FF),
      title: Text(title),
      centerTitle: false,
      titleTextStyle: const TextStyle(
          fontSize: 15.5,
          fontFamily: "Poppins",
          color: Colors.white,
          fontWeight: FontWeight.w500),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: onPressed,
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 8),
          child: InkWell(
            onTap: onTab,
            child: Stack(children: [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 20,
                child: Image.asset(
                  "assets/icon/notification-bell.png",
                  height: 20,
                  width: 20,
                ),
              ),
              Positioned(
                  top: 12,
                  right: 12,
                  child: Container(
                    height: 7,
                    width: 7,
                    decoration: BoxDecoration(
                        color: Color(0xFFA61919),
                        borderRadius: BorderRadius.circular(15)),
                  ))
            ]),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 10),
          child: InkWell(
            onTap: () {},
            child: CircleAvatar(
              backgroundColor: Color(0xFF38B6FF),
              radius: 30,
              child: Image.asset(
                "assets/icon/menu.png",
                height: 30,
                width: 30,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
