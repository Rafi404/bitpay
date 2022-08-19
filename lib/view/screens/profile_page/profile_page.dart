import 'package:bitpay/view/constants/colors.dart';
import 'package:bitpay/view/constants/gutters.dart';
import 'package:bitpay/view/constants/text_styles.dart';
import 'package:bitpay/view/screens/dashboard_page/widgets/avatar.dart';
import 'package:bitpay/view/screens/dashboard_page/widgets/search_field.dart';
import 'package:bitpay/view/screens/profile_page/widgets/settings_tile.dart';
import 'package:bitpay/view/screens/settings_page/settings_page.dart';
import 'package:bitpay/view/screens/widgets/bottom_navbar.dart';
import 'package:bitpay/view/screens/widgets/logout_button.dart';
import 'package:bitpay/view/screens/widgets/settings_panel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ScrollController? _scrollController;

  bool lastStatus = true;

  final double height = 200;

  void _scrollListener() {
    if (_isShrink != lastStatus) {
      setState(() {
        lastStatus = _isShrink;
      });
    }
  }

  bool get _isShrink {
    return _scrollController != null &&
        _scrollController!.hasClients &&
        _scrollController!.offset > (height - kToolbarHeight);
  }

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    _scrollController?.removeListener(_scrollListener);
    _scrollController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // body: ListView(
      //   children: [
      //     ///Avatar section
      //     Container(
      //       color: Colors.grey.shade200,
      //       child: Column(
      //         children: [
      //           Align(
      //             alignment: Alignment.centerRight,
      //             child: Padding(
      //               padding: const EdgeInsets.only(top: 25, right: 15),
      //               child: Text(
      //                 'Log Out',
      //                 style: TextStyle(
      //                   fontSize: 16,
      //                   fontWeight: FontWeight.bold,
      //                   color: bottomNavSelectedColor,
      //                 ),
      //               ),
      //             ),
      //           ),
      //           Column(
      //             children: [
      //               Avatar(
      //                 avatarWidth: 100,
      //                 avatarHeight: 100,
      //               ),
      //               kHeight,
      //               kHeight,
      //               Text(
      //                 'Vanessa',
      //                 style: headStyle1,
      //               ),
      //               kHeight,
      //               Text(
      //                 'maej@gmail.com',
      //                 style: headStyle2,
      //               ),
      //               kMinHeight,
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //     kMinHeight,
      //
      //     ///Settings section
      //     Container(
      //       color: Colors.white,
      //       child: Column(
      //         children: [
      //           Padding(
      //             padding: const EdgeInsets.symmetric(horizontal: 20),
      //             child: SearchField(
      //               fieldLabel: 'Search Settings',
      //             ),
      //           ),
      //           kMinHeight,
      //           SettingsTile(tileTitle: 'Personal Info', tileIcon: Icons.person,),
      //           SettingsTile(tileTitle: 'My QR Code', tileIcon: Icons.qr_code_scanner,),
      //           SettingsTile(tileTitle: 'Banks and Cards', tileIcon: Icons.location_city,),
      //           SettingsTile(tileTitle: 'Payment Preferences', tileIcon: Icons.payments_rounded,),
      //           SettingsTile(tileTitle: 'Automatic Payments', tileIcon: Icons.replay,),
      //           SettingsTile(tileTitle: 'Login and Security', tileIcon: Icons.login_outlined,),
      //           SettingsTile(tileTitle: 'Notifications', tileIcon: Icons.notifications,),
      //
      //
      //         ],
      //       ),
      //     ),
      //   ],
      // ),

      body: NestedScrollView(
        controller: _scrollController,
        headerSliverBuilder: (context, innerBoxIsScrolled) {
          return [
            SliverAppBar(
              automaticallyImplyLeading: false,
              elevation: 0,
              backgroundColor: searchBarBgColor,
              pinned: true,
              expandedHeight: 275,
              flexibleSpace: FlexibleSpaceBar(
                collapseMode: CollapseMode.parallax,
                background: SafeArea(
                  child: Column(
                    children: [
                     LogoutButton(),
                      Padding(
                        padding: const EdgeInsets.only(top: 48),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.network(
                            avatarImage,
                            fit: BoxFit.cover,
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text(
                        "Mae Jamison",
                        style: headStyle3,
                      ),
                      kHeight,
                      const Text(
                        "maej@gmail.com",
                      ),
                      kHeight,
                    ],
                  ),
                ),
              ),
              actions: _isShrink
                  ? [
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: LogoutButton(),
                      ),
                    ]
                  : null,
            ),
          ];
        },
        body: CustomScrollView(
          slivers: [
            // SliverList(
            //   delegate: SliverChildBuilderDelegate(
            //     (BuildContext context, int index) {
            //       return SettingsPanel();
            //     },
            //     childCount: 1,
            //   ),
            // ),

            SliverAnimatedList(
                initialItemCount: 1,
                itemBuilder: (context, index, animation) => SizeTransition(
                    sizeFactor: animation,
                    child: SettingsPanel()
                )
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(),
    );
  }
}
