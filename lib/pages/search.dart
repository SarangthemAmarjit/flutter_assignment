import 'dart:developer';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:fluttertask/modalhelper.dart';
import 'package:fluttertask/router/router.gr.dart';
import 'package:fluttertask/serviceapi.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    Key? key,
  }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<SearchPage> {
  // This holds a list of fiction users
  // You can use data fetched from a database or a server as well

  // This list holds the data for the list view
  List<dynamic> _foundUsers = [];
  List<dynamic> _foundUsers2 = [];
  List<dynamic> _foundlogo = [];
  final List _searchResult = [];
  List<Itemmodal> newlist = [];
  @override
  initState() {
    // at the beginning, all users are shown

    super.initState();
    getdata();
  }

  getdata() async {
    final datafinal = await ServiceApi().Getdata();
    setState(() {
      newlist = datafinal!;
    });
    newlist.forEach((element) {
      _foundUsers.add(element.title);
      _foundlogo.add(element.image);
    });
  }

  // This function is called whenever the text field changes
  _runFilter(String enteredKeyword) {
    log(enteredKeyword);
    List<dynamic> results = [];
    List<dynamic> logo = [];
    List<int> result_ind = [];
    if (enteredKeyword.isEmpty) {
      setState(() {
        results = _foundUsers;
        logo = _foundlogo;
      });
    } else {
      setState(() {
        results = _foundUsers
            .where((user) => user
                .toString()
                .toLowerCase()
                .contains(enteredKeyword.toLowerCase()))
            .toList();
        log(results.toString());
      });
      for (var items in results) {
        if (_foundUsers.contains(items)) {
          result_ind.add(_foundUsers.indexOf(items));
        }
        setState(() {
          result_ind.forEach((element) {
            logo.add(_foundlogo[element]);
          });
        });
      }
    }

    // Refresh the UI
    setState(() {
      _foundUsers2 = results;
      _foundlogo = logo;
    });
  }

  @override
  Widget build(BuildContext context) {
    log(MediaQuery.of(context).size.width.toString());

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 203, 244, 249),
              Color.fromARGB(255, 203, 244, 249),
              Color.fromARGB(255, 255, 254, 254),
              Color.fromARGB(255, 252, 252, 228),
              Color.fromARGB(255, 249, 237, 249),
              Color.fromARGB(255, 255, 254, 254),
            ],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 30, right: 30, left: 10),
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Row(children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.only(right: 7),
                      child: InkWell(
                          onTap: () {
                            context.router.pop();
                            FocusScopeNode currentFocus =
                                FocusScope.of(context);

                            if (!currentFocus.hasPrimaryFocus) {
                              currentFocus.unfocus();
                            }
                          },
                          child: const Icon(Icons.arrow_back)),
                    ),
                  ),
                  Expanded(
                    flex: 10,
                    child: Container(
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 253, 253, 252),
                          borderRadius: BorderRadius.circular(7)),
                      height: 43,
                      child: TextFormField(
                        cursorHeight: 25,
                        autofocus: true,
                        onChanged: ((value) {
                          _runFilter(value);
                        }),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(top: 7),
                          prefixIcon: const Icon(Icons.search),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(7)),
                          hintText: 'Search Your Course',
                        ),
                      ),
                    ),
                  )
                ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: _foundUsers2.isNotEmpty
                    ? ListView.builder(
                        shrinkWrap: true,
                        itemCount: _foundUsers2.length,
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
                                      SizedBox(
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
                        },
                      )
                    : const Text(
                        'No results found',
                        style: TextStyle(fontSize: 24),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
