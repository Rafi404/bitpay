import 'package:bitpay/services/db_service.dart';
import 'package:bitpay/view/constants/colors.dart';
import 'package:bitpay/view/screens/dashboard_page/dashboard_page.dart';
import 'package:bitpay/view/screens/search_page/full_screen_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class SearchField extends StatefulWidget {
  SearchField(
      {Key? key,
      required this.fieldLabel,
      required this.selectionStatus,
      required this.focusStatus})
      : super(key: key);

  final String fieldLabel;
  bool selectionStatus;
  bool focusStatus;
  @override
  _SearchFieldState createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    var dbPro = Provider.of<DatabaseConnectionProvider>(
      context,
    );

    return TextFormField(
      enableInteractiveSelection: widget.selectionStatus,
      autofocus: widget.focusStatus,
      controller: dbPro.contr,
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return SearchPage();
        }));
      },
      onChanged: (value) {
        dbPro.onTextChange(value);
      },
      decoration: InputDecoration(
        prefixIcon: widget.focusStatus ?  IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 24,
          ),
          color: bottomNavSelectedColor,
          onPressed: () {
            dbPro.contr.text = '';
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) {
                  return DashboardPage();
                }));
          },
        ):Icon(
          Icons.search,
          size: 24,
          color: bottomNavSelectedColor,
        ),
        suffixIcon: widget.focusStatus ? IconButton(
          icon: Icon(
            Icons.clear,
            size: 24,
          ),
          color: bottomNavSelectedColor,
          onPressed: () {
            dbPro.contr.text = '';
          },
        ) : SizedBox(),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        contentPadding: const EdgeInsets.all(8.0),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.transparent,
          ),
          borderRadius: BorderRadius.circular(15),
        ),
        fillColor: searchBarBgColor,
        filled: true,
        focusColor: Colors.transparent,
        hintText: widget.fieldLabel,
        hintStyle: TextStyle(
          color: bottomNavUnSelectedColor,
          fontFamily: 'poppins',
          fontSize: 16,
        ),
      ),
    );
  }
}
