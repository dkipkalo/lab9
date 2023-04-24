// import 'package:flutter/material.dart';
//
//
// class HomePage extends StatelessWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           centerTitle: true,
//           title: const Icon(
//             Icons.cake,
//             size: 30,
//             color: Colors.blue,
//           ),
//           leading: InkWell(
//             onTap: () {},
//             child: const Icon(
//               Icons.insert_emoticon_rounded,
//               size: 30,
//               color: Colors.blue,
//             ),
//           ),
//           bottom: const TabBar(
//             tabs: [
//               Tab(
//                 icon: Text('Для вас', style: TextStyle(color: Colors.black)),
//               ),
//               Tab(
//                 icon: Text('Вы читаете', style: TextStyle(color: Colors.black)),
//               ),
//             ],
//           ),
//           backgroundColor: Colors.white,
//         ),
//         body: const TabBarView(
//           children: [
//             Icon(Icons.directions_transit),
//             Icon(Icons.face),
//           ],
//         ),
//       ),
//     );
//   }
// }
