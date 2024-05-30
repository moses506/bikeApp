import 'package:bicycle_app/dashboard/view/dashboard_page.dart';
import 'package:bicycle_app/home/cubit/home_cubit.dart';
import 'package:bicycle_app/home/widgets/qr_code.dart';
import 'package:bicycle_app/notifications/view/notifications_page.dart';
import 'package:bicycle_app/profile/view/profile_page.dart';
import 'package:bicycle_app/wallet/view/wallet_page.dart';
import 'package:bicycle_app/widgets/icons.dart';
import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_svg/svg.dart';




/// {@template home_body}

/// Body of the HomePage.

///

/// Add what it does

/// {@endtemplate}

class HomeBody extends StatelessWidget {
  /// {@macro home_body}D

  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Scaffold(
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerDocked,
          resizeToAvoidBottomInset: true,
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              showBottomSheet(
                  context: context,
                  builder: (_) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context); // Dismiss the bottom sheet
                      },
                      child: const QRScanner(),
                    );
                  },);
            },
            shape: const CircleBorder(),
            child: const Icon(Icons.qr_code_2_rounded),
          ),
          body: IndexedStack(
            index: state.index,
            children: const [
              DashBoardPage(),
              NaficationsPage(),
             WalletPage(),
              ProfilePage(),
            ],
          ),
          bottomNavigationBar: CustomBottomAppBar(
            currentIndex: state.index,

            onTap: (index) => context.read<HomeCubit>().navigate(index),

            key: ValueKey(
              state.index,
            ), // Reconstruct the widget when the index changes.
          ),
        );
      },
    );
  }
}

class CustomBottomAppBar extends StatefulWidget {
  const CustomBottomAppBar({
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final int currentIndex;

  // ignore: inference_failure_on_function_return_type

  final Function(int) onTap;

  @override
  CustomBottomAppBarState createState() => CustomBottomAppBarState();
}

class CustomBottomAppBarState extends State<CustomBottomAppBar> {
  Color _getColorForIndex(int index) {
    return widget.currentIndex == index
        ? Theme.of(context).colorScheme.primary
        : Theme.of(context).colorScheme.onSurfaceVariant;
  }

   double _getSize(int index){
    return widget.currentIndex== index ?  34: 30;
   }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
        notchMargin: 5,
        shape: const CircularNotchedRectangle(),
        color: Theme.of(context).colorScheme.shadow,
        child:

//
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
           
             children: [
          MaterialButton(
            minWidth: 40,
            onPressed: () => widget.onTap(0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   AppIcons.home,
                //   width: 25,
                //   colorFilter: ColorFilter.mode(
                //     _getColorForIndex(0),
                //     BlendMode.srcIn,
                //   ),
                // ),
                // const SizedBox(
                //   height: 5,
                // ),
                Icon(Icons.home, size: _getSize(0),
                    color: _getColorForIndex(0),),],
            ),
          ),
          MaterialButton(
            minWidth: 40,
            onPressed: () => widget.onTap(1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
               
                const SizedBox(
                  height: 5,
                ),
                 Icon(Icons.notifications, size: _getSize(1),
                    color: _getColorForIndex(1),),],
             
            ),
          ),
         const Spacer(),
          MaterialButton(
            minWidth: 40,
            onPressed: () => widget.onTap(2),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SvgPicture.asset(
                //   AppIcons.history,
                //   width: 25,
                //   colorFilter: ColorFilter.mode(
                //     _getColorForIndex(2),
                //     BlendMode.srcIn,
                //   ),
                // ),
                const SizedBox(
                  height: 5,
                ),
                  Icon(Icons.wallet_membership_rounded, size: _getSize(2),
                    color: _getColorForIndex(2),),],
              
            ),
          ),
          Expanded(
            child: MaterialButton(
              minWidth: 40,
              onPressed: () => widget.onTap(3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // SvgPicture.asset(
                  //   'assets/user_icon.svg',
                  //   width: 25,
                  //   colorFilter: ColorFilter.mode(
                  //     _getColorForIndex(3),
                  //     BlendMode.srcIn,
                  //   ),
                  // ),
                  const SizedBox(
                    height: 5,
                  ),
                    Icon(Icons.person, size: _getSize(3),
                    color: _getColorForIndex(3),),],
                
              ),
            ),
          ),
        ],),);
  }
}
