import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertask/modalhelper.dart';
import 'package:fluttertask/router/router.gr.dart';
import 'package:fluttertask/serviceapi.dart';

class ProductlistPage extends StatefulWidget {
  const ProductlistPage({Key? key}) : super(key: key);

  @override
  State<ProductlistPage> createState() => _ProductlistScreenState();
}

class _ProductlistScreenState extends State<ProductlistPage> {
  List<Itemmodal> newlist = [];
  @override
  void initState() {
    super.initState();
    getdata();
  }

  getdata() async {
    final datafinal = await ServiceApi().Getdata();
    setState(() {
      newlist = datafinal!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Product List'),
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
              Color.fromARGB(255, 247, 239, 152),
              Color.fromARGB(255, 159, 250, 227)
            ])),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, top: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                height: 43,
                width: MediaQuery.of(context).size.width,
                child: TextFormField(
                  showCursor: false,
                  focusNode: FocusNode(),
                  autofocus: false,
                  onTap: () {
                    FocusScopeNode currentFocus = FocusScope.of(context);

                    currentFocus.unfocus();
                    context.router.push(SearchRoute());
                  },
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(top: 7),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Colors.black,
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7)),
                    hintText: 'Search Your Product',
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
                child: Container(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 7),
                child: newlist.isEmpty
                    ? Container(
                        alignment: Alignment.topCenter,
                        height: 20,
                        child: const LinearProgressIndicator(
                          color: Color.fromARGB(255, 241, 134, 77),
                        ),
                      )
                    : GridView.builder(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 7,
                                childAspectRatio: 3 / 4.6),
                        shrinkWrap: true,
                        itemCount: newlist.length,
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              context.router.push(ProductdetailRoute(
                                  itemname: newlist[index].title,
                                  itemcategory: newlist[index].category,
                                  itemrating:
                                      newlist[index].rating.rate.toString(),
                                  itemcount:
                                      newlist[index].rating.count.toString(),
                                  itemprice: newlist[index].price.toString(),
                                  itemdescription: newlist[index].description,
                                  itemimage: newlist[index].image));
                            },
                            child: Card(
                              child: Column(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                          alignment: Alignment.center,
                                          height: 120,
                                          width: 120,
                                          image: NetworkImage(
                                              newlist[index].image)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        newlist[index].title.length > 17
                                            ? "${newlist[index].title.substring(0, 17)}..."
                                            : newlist[index].title,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        newlist[index].category,
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            width: 50,
                                            height: 20,
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              color: Color.fromARGB(
                                                  255, 11, 151, 15),
                                            ),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  newlist[index]
                                                      .rating
                                                      .rate
                                                      .toString(),
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                ),
                                                const Icon(Icons.star,
                                                    color: Colors.white,
                                                    size: 12)
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            "(" +
                                                newlist[index]
                                                    .rating
                                                    .count
                                                    .toString() +
                                                ")",
                                            style: TextStyle(
                                                color: Colors.black38),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          const Text(
                                            '\₹',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          Text(
                                            '${newlist[index].price}',
                                            style: TextStyle(
                                                fontSize: 18,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      // ElevatedButton(
                                      //     style: ElevatedButton.styleFrom(
                                      //       primary: Colors.green,
                                      //     ),
                                      //     onPressed: () {},
                                      //     child: Text('Add To Cart'))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          );
                        }),
              ),
            ))
          ],
        ),
      ),
    );
  }
}
