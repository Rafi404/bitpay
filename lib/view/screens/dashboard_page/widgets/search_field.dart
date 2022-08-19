import 'package:bitpay/view/constants/colors.dart';
import 'package:flutter/material.dart';

class SearchField extends StatelessWidget {
  const SearchField({Key? key, required this.fieldLabel}) : super(key: key);

  final String fieldLabel;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // validator: (){},
      // onSaved: buttonActionSave,
      onChanged: (value) {
        // dbPro.onTextChange(value);
      },
      decoration: InputDecoration(
        prefixIcon: Icon(
          Icons.search,
          size: 24,
          color: bottomNavSelectedColor,
        ),
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
        hintText: fieldLabel,
        hintStyle: TextStyle(
          color: bottomNavUnSelectedColor,
          fontFamily: 'poppins',
          fontSize: 16,
        ),
      ),
    );
  }
}
