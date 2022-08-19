import 'package:badges/badges.dart';
import 'package:bitpay/services/db_service.dart';
import 'package:bitpay/view/constants/gutters.dart';
import 'package:bitpay/view/constants/text_styles.dart';
import 'package:bitpay/view/screens/dashboard_page/widgets/activity_head.dart';
import 'package:bitpay/view/screens/dashboard_page/widgets/activity_tile.dart';
import 'package:bitpay/view/screens/dashboard_page/widgets/avatar.dart';
import 'package:bitpay/view/screens/dashboard_page/widgets/avatar_with_name.dart';
import 'package:bitpay/view/screens/dashboard_page/widgets/balance_board.dart';
import 'package:bitpay/view/screens/dashboard_page/widgets/search_field.dart';
import 'package:bitpay/view/screens/profile_page/profile_page.dart';
import 'package:bitpay/view/screens/widgets/avatar_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  _DashboardPageState createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    // Provider.of<DatabaseConnectionProvider>(context,
    //     listen: false)
    //     .setDatabase();

    // Provider.of<DatabaseConnectionProvider>(context,
    //     listen: false)
    //     .insertDatabase(contactsData);

    // Provider.of<DatabaseConnectionProvider>(context,
    //     listen: false)
    //     .getData();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: [
            Container(
              color: Colors.grey.shade200,
              child: Column(
                children: [
                  ///Notification bar
                  Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: EdgeInsets.only(top: 15, right: 20),
                      child: Badge(
                        badgeContent: Text(
                          '2',
                          style: TextStyle(color: Colors.white),
                        ),
                        child: Icon(
                          Icons.notifications,
                          size: 25,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),

                  ///Avatar section
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Row(
                      children: [
                        InkWell(
                          splashColor: Colors.blue,
                            onTap: (){

                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) {
                                    return ProfilePage();
                                  }));
                            },
                            child: Avatar(avatarWidth: 60.0, avatarHeight: 60.0, avatarImage: avatarImage,)),
                        kWidth,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hi Vanessa,',
                              style: headStyle1,
                            ),
                            kHeight,
                            Text("Here's your spending dashboard",
                                style: headStyle2),
                          ],
                        ),
                      ],
                    ),
                  ),

                  ///balance show here
                  kMinHeight,
                  BalanceBoard(),
                  kMinHeight,

                  ///Send again section
                  Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Send Again',
                          style: headStyle1,
                        )),
                  ),

                  ///Scrollable avatars section
                  Container(
                    height: 150,
                    child: FutureBuilder(
                      future: Provider.of<DatabaseConnectionProvider>(context,listen: false).getData(),
                      builder: (BuildContext context, snapshot){
                        if(snapshot.hasData){
                          List<Map<String, dynamic>> data =
                          snapshot.data as List<Map<String, dynamic>>;
                          print(data.length.toString() + "  length");
                          return ListView.builder(
                            scrollDirection: Axis.horizontal,
                              itemCount: data.length,
                              itemBuilder: (BuildContext context, int index) {
                            return NameAvatar(contacts: data[index]);
                          });
                        }else{
                         return Shimmer(
                           duration: Duration(seconds: 2),
                           interval: Duration(seconds: 1),
                           child: AvatarShimmer(),
                         );
                        }
                      },
                    ),
                  ),
                  kHeight,

                  Container(
                    color: Colors.white,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 20),
                            child: SearchField(fieldLabel: 'Search Transactions',),
                          ),
                          kMinHeight,

                          ///Activity Section
                          ActivityHead(),
                          kHeight,
                          kHeight,
                          kHeight,

                          ///Activities
                          Activity(),
                          Activity(),
                          Activity(),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
