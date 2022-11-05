import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
        decoration: InputDecoration(
      hintText: "Search in thousands of product",
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      isDense: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
        borderSide: const BorderSide(),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(10),
      ),
      fillColor: Colors.grey[100],
      filled: true,
      prefixIcon: const Icon(
        Icons.search,
        size: 30,
        //color: AppColors.searchTextFelidIcon,
      ),
    ));
  }
}
