import 'dart:convert';

import 'package:data_manipulation/core/models/product_model.dart';
import 'package:data_manipulation/utilities/constants/themes_constants.dart';
import 'package:data_manipulation/views/commons/inputs_common.dart';
import 'package:flutter/material.dart';

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({super.key});

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<ProductModel> products = [];
  TextEditingController minPriceRange = TextEditingController();
  TextEditingController maxPriceRange = TextEditingController();
  TextEditingController discountPrice = TextEditingController();

  @override
  void initState() {
    super.initState();
    products = productList;
  }

  void filterProducts() {
    setState(() {
      products = productList
          .where((product) =>
              product.price >= double.parse(minPriceRange.text) &&
              product.price <= double.parse(maxPriceRange.text))
          .toList();
    });
  }

  void discountAllProducts() {
    setState(() {
      for (var product in products) {
        product.price = product.price -
            (product.price * (double.parse(discountPrice.text) / 100));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: CColors.trueWhite,
        appBar: AppBar(elevation: 0),
        body: Container(
          color: CColors.trueWhite,
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 400.0,
                    child: ListView.builder(
                        itemCount: products.length,
                        itemBuilder: (BuildContext context, int index) {
                          final product = products[index];
                          return Container(
                            height: 75.0,
                            color: (index % 2 == 0
                                ? CColors.secondaryTextLightColor
                                : CColors.white),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32.0),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 16.0),
                                child: Column(
                                  children: [
                                    Text('Name: ${product.name}'),
                                    Text(
                                        'Price: ${product.price.toStringAsFixed(2)}'),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 16.0, right: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          constraints: const BoxConstraints(maxWidth: 170.0),
                          height: 35.0,
                          child: CustomTextField(
                            hintText: 'Minimum Price',
                            controller: minPriceRange,
                            textInputAction: TextInputAction.next,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                        Container(
                          constraints: const BoxConstraints(maxWidth: 170.0),
                          height: 35.0,
                          child: CustomTextField(
                            hintText: 'Maximum Price',
                            controller: maxPriceRange,
                            textInputAction: TextInputAction.done,
                            keyboardType: TextInputType.number,
                          ),
                        ),
                      ],
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      filterProducts();
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0))),
                    child: const SizedBox(
                      height: 30.0,
                      width: 75.0,
                      child: Center(
                        child: Text(
                            style: TextStyle(
                                color: CColors.primaryTextLightColor,
                                fontSize: 12.0),
                            'Price Filter'),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 16.0, left: 16.0, right: 16.0),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            constraints: const BoxConstraints(maxWidth: 170.0),
                            height: 35.0,
                            child: CustomTextField(
                              hintText: 'Discount Price',
                              controller: discountPrice,
                              textInputAction: TextInputAction.next,
                              keyboardType: TextInputType.number,
                            ),
                          ),
                          OutlinedButton(
                            onPressed: () {
                              discountAllProducts();
                            },
                            style: OutlinedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0))),
                            child: const SizedBox(
                              height: 30.0,
                              width: 75.0,
                              child: Center(
                                child: Text(
                                    style: TextStyle(
                                        color: CColors.primaryTextLightColor,
                                        fontSize: 12.0),
                                    'Use Discount'),
                              ),
                            ),
                          ),
                        ]),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
