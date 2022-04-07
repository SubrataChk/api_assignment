import 'package:api_assignment/src/api/apiservice.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class ProductDetails extends StatefulWidget {
  final int id;
  // final String title;
  const ProductDetails({
    Key? key,
    required this.id,
    // required this.title,
  }) : super(key: key);

  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    ApiService apiService = Provider.of<ApiService>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            )),
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Product Details",
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: FutureBuilder(
          future: apiService.getProductData(widget.id),
          builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 5.h,
                    ),
                    Image.network(
                      snapshot.data["image"],
                      height: 20.h,
                      width: double.infinity,
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Center(
                      child: Text(
                        "\$" + snapshot.data["price"].toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16.sp,
                            color: Colors.red),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        snapshot.data["title"],
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 13.sp),
                      ),
                    ),
                    Chip(
                      label: Text(
                        snapshot.data["category"].toString(),
                        style: TextStyle(fontSize: 12.sp, color: Colors.blue),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(12),
                      child: Text(
                        snapshot.data["description"],
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.red,
                ),
              );
            }
          }),
      floatingActionButton: FloatingActionButton(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        onPressed: () {},
        child: Icon(Icons.add_shopping_cart),
      ),
    );
  }
}
