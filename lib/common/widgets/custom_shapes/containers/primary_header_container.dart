// import 'package:bimnext_app/common/widgets/custom_shapes/containers/circular_container.dart';
// import 'package:bimnext_app/common/widgets/custom_shapes/curved_edges/curved_edges_widget.dart';
// import 'package:bimnext_app/util/constants/colors.dart';
// import 'package:flutter/material.dart';

// class PrimaryHeaderContainer extends StatelessWidget {
//   const PrimaryHeaderContainer({ super.key, required this.child });

//   final Widget child;

//   @override
//   Widget build(BuildContext context) {
//     return CurvedEdgeWidget(
//         child: SizedBox(
//           height: 400,
//           child: Container(
//             color: TColors.primary,
//         // If [size.isFinite': is not true.in Stack] error occurred
//             child: Stack(
//               children: [
//                 const Positioned(
//                     top: -150,
//                     right: -250,
//                     child: CircularContainer(
//                         backgroundColor: TColors.textWhite)),
//                 const Positioned(
//                     top: 100,
//                     right: -300,
//                     child: CircularContainer(
//                         backgroundColor: TColors.textWhite)),
//                 child,
//               ],
//             ),
//           ),
//         ),
//     );
//   }
// }
