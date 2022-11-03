import 'package:flutter/material.dart';

class ProductdetailPage extends StatelessWidget {
  final String itemname;
  final String itemcategory;
  final String itemimage;
  final String itemrating;
  final String itemcount;
  final String itemprice;
  final String itemdescription;
  const ProductdetailPage(
      {super.key,
      required this.itemname,
      required this.itemcategory,
      required this.itemrating,
      required this.itemcount,
      required this.itemprice,
      required this.itemdescription,
      required this.itemimage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(itemname),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(15),
                child: Center(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 200,
                      child: Image.network(itemimage)),
                ),
              ),
              Text(
                itemname,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                itemcategory,
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Container(
                    width: 50,
                    height: 20,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Color.fromARGB(255, 11, 151, 15),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          itemrating,
                          style: TextStyle(color: Colors.white),
                        ),
                        const Icon(Icons.star, color: Colors.white, size: 12)
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "(" + itemcount + ")",
                    style: TextStyle(color: Colors.black38),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  const Text(
                    '\₹',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    itemprice,
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Description :',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "    " + itemdescription,
                    style: TextStyle(fontSize: 14, color: Colors.black54),
                    textAlign: TextAlign.justify,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
