import 'package:bitpay/services/db_service.dart';
import 'package:bitpay/view/constants/gutters.dart';
import 'package:bitpay/view/screens/dashboard_page/widgets/activity_tile.dart';
import 'package:bitpay/view/screens/dashboard_page/widgets/search_field.dart';
import 'package:bitpay/view/screens/widgets/activity_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dbPro = Provider.of<DatabaseConnectionProvider>(
      context,
    );
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.only(left: 15,right: 15,top: 15),
          child: ListView(
            children: [
             SearchField(fieldLabel: 'Search Transactions', selectionStatus: true, focusStatus: true,),
              kMinHeight,
              dbPro.contr.text.isEmpty ?
              FutureBuilder(
                future: dbPro.getActivityData(),
                builder: (BuildContext context, snapshot){
                  if (snapshot.hasData) {
                    List<Map<String, dynamic>> data =
                    snapshot.data as List<Map<String, dynamic>>;
                    print(data.length.toString() + "  length");
                    return ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return Activity(activityData:data[index]);
                        });
                  }else{
                    return Shimmer(
                      duration: Duration(seconds: 2),
                      interval: Duration(seconds: 1),
                      child: ActivityShimmer(),
                    );
                  }
                },
              ) : ListView.builder(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: dbPro.data.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Activity(activityData: dbPro.data[index]);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
