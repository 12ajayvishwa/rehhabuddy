import 'package:flutter/material.dart';
import './components/body.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Body(),
    );
  }
}





























// import 'dart:ffi';
// import 'dart:io';

// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:rehabbudy/screens/bloc/splash_screen_bloc.dart';
// import 'package:rehabbudy/screens/splash_screen/home.dart';
// import 'package:rehabbudy/widget/splash_screen_widget.dart';

// class SplashScreen extends StatelessWidget {
//   const SplashScreen({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: _buildBody(context),
//     );
//   }

//   BlocProvider<SplashScreenBloc> _buildBody(BuildContext context) {
//     return BlocProvider(
//       create: (context) => SplashScreenBloc(),
//       child: Container(
//         height: MediaQuery.of(context).size.height,
//         width: MediaQuery.of(context).size.width,
//         color: Colors.orange,
//         child: Center(
//           child: BlocBuilder<SplashScreenBloc, SplashScreenState>(
//             builder: (context, state) {
//               if ((state is Initial) || (state is Loading)) {
//                 return SplashScreenWidget();
//               } else if (state is Loaded) {
//                 return Home();
//               } else {
//                 return Home();
//               }
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   dynamic doesntReturn() {}
// }
