// import 'dart:async';

// import 'package:shimzlaw_app/dashboard/widgets/active_bords.dart';

// import 'package:shimzlaw_app/dashboard/widgets/disabled_board.dart';

// import 'package:shimzlaw_app/dashboard/widgets/pending_boards.dart';

// import 'package:shimzlaw_app/history/history.dart';

// import 'package:shimzlaw_app/widgets/icons.dart';

// import 'package:carousel_slider/carousel_slider.dart';

// import 'package:flutter_svg/svg.dart';

// import 'package:intl/intl.dart';



// import 'package:flutter/material.dart';

// import 'package:google_fonts/google_fonts.dart';

// class DashBoardBody extends StatefulWidget {
//   const DashBoardBody({Key? key}) : super(key: key);

//   @override
//   _DashBoardBodyState createState() => _DashBoardBodyState();
// }

// class _DashBoardBodyState extends State<DashBoardBody> {
//   late final Timer _timer;

//   late String _currentTime;

//   final _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();

//   @override
//   void initState() {
//     super.initState();

//     _currentTime = _formatDateTime(DateTime.now());

//     _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
//       setState(() {
//         _currentTime = _formatDateTime(DateTime.now());
//       });
//     });
//   }

//   String _formatDateTime(DateTime dateTime) {
//     var formattedDate = DateFormat('d MMMM, y').format(dateTime);

//     // The following lines will manually append the correct suffix to the day.

//     var dayNumber = int.parse(DateFormat('d').format(dateTime));

//     String suffix;

//     var digit = dayNumber % 10;

//     if ((digit > 0 && digit < 4) && (dayNumber < 11 || dayNumber > 13)) {
//       suffix = ['th', 'st', 'nd', 'rd'][digit];
//     } else {
//       suffix = 'th';
//     }

//     return '${formattedDate.replaceFirst(DateFormat('d').format(dateTime), dayNumber.toString() + suffix)}';
//   }

//   @override
//   void dispose() {
//     _timer
//         .cancel(); // It's important to cancel the timer to avoid memory leaks.

//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     final user = context.watch<AuthBloc>().state.user;

//     return BlocBuilder<DashoardCubit, DashoardState>(
//       builder: (context, state) {
//         return RefreshIndicator(
//           key: _refreshIndicatorKey,
//           backgroundColor: Theme.of(context).colorScheme.primary,
//           color: Colors.white,
//           onRefresh: () =>
//               context.read<DashoardCubit>().fertchData(user.clientId),
//           child: Scaffold(
//             body: Padding(
//               padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 0),
//               child: ListView(
//                 children: [
//                   SizedBox(
//                     height: 20,
//                   ),
//                   SizedBox(
//                     child: Column(
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Row(
//                           children: [
//                             Text(
//                               'Welcome, ',
//                               style: GoogleFonts.poppins(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                             Text(
//                               user.firstName,
//                               style: GoogleFonts.poppins(
//                                   fontSize: 18,
//                                   fontWeight: FontWeight.w400,
//                                   color: Theme.of(context).colorScheme.primary),
//                             ),
//                           ],
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           "Let's Get Started",
//                           style: GoogleFonts.poppins(
//                             fontSize: 40,
//                             fontWeight: FontWeight.w700,
//                           ),
//                         ),
//                         SizedBox(height: 10),
//                         Text(
//                           _currentTime,
//                           style: GoogleFonts.poppins(
//                             fontSize: 16,
//                             fontWeight: FontWeight.w400,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                   const SizedBox(
//                     height: 20,
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(8),
//                     child: Text(
//                       'Billboard Status',
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     children: [
//                       Expanded(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(context, HistoryPage.route());
//                           },
//                           child: Card(
//                             elevation: 0.0,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(
//                                 10.0,
//                               ),
//                             ),
//                             color: Theme.of(context)
//                                 .colorScheme
//                                 .primary
//                                 .withOpacity(0.9),
//                             child: Padding(
//                               padding: const EdgeInsets.symmetric(
//                                 vertical: 8,
//                                 horizontal: 20,
//                               ),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     padding: EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color:
//                                           Theme.of(context).colorScheme.primary,
//                                     ),
//                                     child: SvgPicture.asset(
//                                       AppIcons.total,
//                                       colorFilter: ColorFilter.mode(
//                                         Color(0xFFFFFFFF),
//                                         BlendMode.srcIn,
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(height: 20),
//                                   const Text('Total Billboards'),
//                                   state.isLoading
//                                       ? const Loader()
//                                       : state.total.isEmpty
//                                           ? Text(
//                                               '0',
//                                               style: GoogleFonts.poppins(
//                                                 fontSize: 28,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.white,
//                                               ),
//                                             )
//                                           : ListView.builder(
//                                               physics:
//                                                   const NeverScrollableScrollPhysics(),
//                                               shrinkWrap: true,
//                                               itemCount: state.total.length,
//                                               itemBuilder: (context, index) {
//                                                 final board =
//                                                     state.total[index];

//                                                 return Text(
//                                                   '${board.total}',
//                                                   style: GoogleFonts.poppins(
//                                                     fontSize: 28,
//                                                     fontWeight: FontWeight.bold,
//                                                     color: Colors.white,
//                                                   ),
//                                                 );
//                                               },
//                                             )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: Card(
//                           elevation: 0.0,
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                               color: Theme.of(context).colorScheme.primary,
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(
//                               10.0,
//                             ),
//                           ),
//                           color: Theme.of(context).colorScheme.background,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                               vertical: 8,
//                               horizontal: 20,
//                             ),
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                     context, PendingBoardPage.route());
//                               },
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     padding: EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color:
//                                           Theme.of(context).colorScheme.primary,
//                                     ),
//                                     child: SvgPicture.asset(
//                                       AppIcons.pending,
//                                       colorFilter: ColorFilter.mode(
//                                         Color(0xFFFFFFFF),
//                                         BlendMode.srcIn,
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   const Text('Pending Billboards'),
//                                   if (state.loadingPending)
//                                     const Loader()
//                                   else
//                                     state.boards.isEmpty
//                                         ? Text(
//                                             '0',
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 28,
//                                               fontWeight: FontWeight.bold,
//                                               color: Theme.of(context)
//                                                   .colorScheme
//                                                   .outlineVariant,
//                                             ),
//                                           ):Text(state.boards.length.toString(),style: TextStyle(

//                                             fontSize: 28,
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Theme.of(context)
//                                                       .colorScheme
//                                                       .outlineVariant,
//                                           ),
//                                           )
//                                         // : ListView.builder(
//                                         //     physics:
//                                         //         const NeverScrollableScrollPhysics(),
//                                         //     shrinkWrap: true,
//                                         //     itemCount: state.boards.length,
//                                         //     itemBuilder: (context, index) {
                                              
//                                         //       return Text(
//                                         //         '${state.boards.length}',
//                                         //         style: GoogleFonts.poppins(
//                                         //           fontSize: 28,
//                                         //           fontWeight: FontWeight.bold,
//                                         //           color: Theme.of(context)
//                                         //               .colorScheme
//                                         //               .outlineVariant,
//                                         //         ),
//                                         //       );
//                                         //     },
//                                         //   ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(
//                     height: 10,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       Expanded(
//                         child: Card(
//                           elevation: 0.0,
//                           shape: RoundedRectangleBorder(
//                             side: BorderSide(
//                               color: Theme.of(context).colorScheme.primary,
//                               width: 1.0,
//                             ),
//                             borderRadius: BorderRadius.circular(
//                               10.0,
//                             ),
//                           ),
//                           color: Theme.of(context).colorScheme.background,
//                           child: Padding(
//                             padding: const EdgeInsets.symmetric(
//                               vertical: 12,
//                               horizontal: 20,
//                             ),
//                             child: GestureDetector(
//                               onTap: () {
//                                 Navigator.push(
//                                     context, ActiveBoardPage.route());
//                               },
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     padding: EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color:
//                                           Theme.of(context).colorScheme.primary,
//                                     ),
//                                     child: SvgPicture.asset(
//                                       AppIcons.active,
//                                       colorFilter: ColorFilter.mode(
//                                         Color(0xFFFFFFFF),
//                                         BlendMode.srcIn,
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   const Text('Active Billboards'),
//                                   if (state.loadingActive)
//                                     const Loader()
//                                   else
//                                     state.active.isEmpty
//                                         ? Text(
//                                             '0',
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 28,
//                                               fontWeight: FontWeight.bold,
//                                               color: Theme.of(context)
//                                                   .colorScheme
//                                                   .outlineVariant,
//                                             ),
//                                           )
//                                         : ListView.builder(
//                                             physics:
//                                                 const NeverScrollableScrollPhysics(),
//                                             shrinkWrap: true,
//                                             itemCount: state.active.length,
//                                             itemBuilder: (context, index) {
//                                               final board = state.active[index];

//                                               return Text(
//                                                 '${board.total}',
//                                                 style: GoogleFonts.poppins(
//                                                   fontSize: 28,
//                                                   fontWeight: FontWeight.bold,
//                                                   color: Theme.of(context)
//                                                       .colorScheme
//                                                       .outlineVariant,
//                                                 ),
//                                               );
//                                             },
//                                           ),
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                       Expanded(
//                         child: GestureDetector(
//                           onTap: () {
//                             Navigator.push(context, DisabledBoardPage.route());
//                           },
//                           child: Card(
//                             elevation: 0.0,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(
//                                 10.0,
//                               ),
//                             ),
//                             color: Color(0xfff57c14),
//                             child: Padding(
//                               padding: EdgeInsets.symmetric(
//                                   vertical: 12, horizontal: 20),
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Container(
//                                     padding: EdgeInsets.all(10),
//                                     decoration: BoxDecoration(
//                                       shape: BoxShape.circle,
//                                       color:
//                                           Theme.of(context).colorScheme.primary,
//                                     ),
//                                     child: SvgPicture.asset(
//                                       AppIcons.payment,
//                                       colorFilter: ColorFilter.mode(
//                                         Color(0xFFFFFFFF),
//                                         BlendMode.srcIn,
//                                       ),
//                                     ),
//                                   ),
//                                   const SizedBox(
//                                     height: 20,
//                                   ),
//                                   Text('Rejected Billboards'),
//                                   if (state.isLoading)
//                                     const Loader()
//                                   else
//                                     state.rejected.isEmpty
//                                         ? Text(
//                                             '0',
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 28,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.white,
//                                             ),
//                                           )
//                                         : Text(
//                                             '${state.rejected.length}',
//                                             style: GoogleFonts.poppins(
//                                               fontSize: 28,
//                                               fontWeight: FontWeight.bold,
//                                               color: Colors.white,
//                                             ),
//                                           )
//                                 ],
//                               ),
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                   Padding(
//                     padding: EdgeInsets.all(8),
//                     child: Text(
//                       'Your Billboards',
//                       style: GoogleFonts.poppins(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w600,
//                       ),
//                     ),
//                   ),
//                   if (state.listBoard.isNotEmpty) ...{
//                     // ListView.builder(

//                     //   shrinkWrap: true,

//                     //   physics: NeverScrollableScrollPhysics(),

//                     //   itemCount: state.listBoard.length,

//                     //   itemBuilder: (context, index) {

//                     //     final ss = state.listBoard[index];

//                     //     return Text(ss.imageString);

//                     //   },

//                     // ),

//                     Container(
//                       width: double.infinity,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.all(Radius.circular(10)),
//                       ),
//                       child: GestureDetector(
//                         onTap: () {
//                           context.read<DashoardCubit>()
//                             ..fertchBillboards(user.clientId);
//                         },
//                         child: CarouselSlider.builder(
//                           itemCount: state.listBoard.length,
//                           itemBuilder: (context, index, realIndex) {
//                             final board = state.listBoard[index];

//                             List<String> unwantedWords = [
//                               "home/shimzlaw/bill-boards/priv/static/"
//                             ];

//                             String pattern = unwantedWords.join("|");

//                             ;

//                             return (board.imageString.isNotEmpty &&
//                                     board.imageString.toLowerCase() != 'null')
//                                 ? Image.network(
//                                     "https://lccshimzlaw.co.zm${board.imageString}"
//                                         .replaceAll(RegExp(pattern), ""),
//                                     fit: BoxFit.cover,
//                                     width: double.infinity,
//                                   )
//                                 : Image.asset(
//                                     'assets/image_filler.png', // Replace with the correct asset path

//                                     fit: BoxFit.cover,

//                                     width: double.infinity,
//                                   );
//                           },
//                           options: CarouselOptions(
//                             viewportFraction: 1,
//                             height: 250,
//                             autoPlay: true,
//                             aspectRatio: 16 / 10,
//                             enlargeCenterPage: true,
//                           ),
//                         ),
//                       ),
//                     ),-15.40913, 28.32164

//                     SizedBox(
//                       height: 5,
//                     )
//                   },
//                 ],
//               ),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }
