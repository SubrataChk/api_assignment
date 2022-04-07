import 'package:api_assignment/src/api/apiservice.dart';
import 'package:api_assignment/src/model/DataModel.dart';
import 'package:api_assignment/src/product/product_details.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    ApiService apiService = Provider.of<ApiService>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "All Product",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 19.sp),
        ),
      ),
      body: SafeArea(
          child: Column(
        children: [
          Expanded(
              child: FutureBuilder(
            future: ApiService().getData(),
            builder: (context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, index) {
                      return Card(
                        elevation: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListTile(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => ProductDetails(
                                            id: snapshot.data[index]["id"],
                                            // title: snapshot.data[index]
                                            //     ["title"],
                                          )));
                            },
                            leading:
                                Image.network(snapshot.data[index]["image"]),
                            title: Text(snapshot.data[index]["title"]),
                            subtitle: Text(
                              "\$${snapshot.data[index]["price"]}",
                              style: TextStyle(fontSize: 12.sp),
                            ),
                            trailing: Text(
                              snapshot.data[index]["rating"]["rate"].toString(),
                              style:
                                  TextStyle(color: Colors.red, fontSize: 14.sp),
                            ),
                          ),
                        ),
                      );
                    });
              } else {
                return ListView.builder(
                    itemCount: 20,
                    itemBuilder: (context, index) {
                      return Shimmer.fromColors(
                        baseColor: Colors.grey,
                        highlightColor: Colors.grey.shade300,
                        child: Card(
                          elevation: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ListTile(
                              leading: Container(
                                height: 20,
                                width: 20,
                                color: Colors.white,
                              ),
                              title: Container(
                                height: 20,
                                width: 20,
                                color: Colors.white,
                              ),
                              subtitle: Container(
                                height: 20,
                                width: 20,
                                color: Colors.white,
                              ),
                              trailing: Container(
                                height: 10,
                                width: 20,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
                    });
              }
            },
          ))
        ],
      )),
    );
  }
}
