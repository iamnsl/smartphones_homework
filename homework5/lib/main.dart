import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(title: 'Product layout demo home page'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Listing")),
      body: ListView(
        shrinkWrap: true,
        padding: const EdgeInsets.fromLTRB(2.0, 10.0, 2.0, 10.0),
        children: <Widget>[
          ProductBox(
            name: "iPhone",
            description: "iPhone is the stylist phone ever",
            price: 1000,
            image: "iphone.png",
            brand: "Apple",
            brandOptions: ["Apple", "Samsung", "Google", "Huawei"],
          ),
          ProductBox(
            name: "Pixel",
            description: "Pixel is the most featureful phone ever",
            price: 800,
            image: "pixel.png",
            brand: "Google",
            brandOptions: ["Google", "Apple", "Samsung", "OnePlus"],
          ),
          ProductBox(
            name: "Laptop",
            description: "Laptop is most productive development tool",
            price: 2000,
            image: "laptop.png",
            brand: "Dell",
            brandOptions: ["Dell", "HP", "Apple", "Lenovo", "Asus"],
          ),
          ProductBox(
            name: "Tablet",
            description: "Tablet is the most useful device ever for meeting",
            price: 1500,
            image: "tablet.png",
            brand: "Samsung",
            brandOptions: ["Samsung", "Apple", "Huawei", "Lenovo"],
          ),
          ProductBox(
            name: "Pendrive",
            description: "Pendrive is useful storage medium",
            price: 100,
            image: "pendrive.png",
            brand: "Kingston",
            brandOptions: ["Kingston", "SanDisk", "Samsung", "Toshiba"],
          ),
          ProductBox(
            name: "Floppy Drive",
            description: "Floppy drive is useful rescue storage medium",
            price: 20,
            image: "floppy drive.png",
            brand: "Sony",
            brandOptions: ["Sony", "Memorex", "Verbatim", "Imation"],
          ),
        ],
      ),
    );
  }
}

class ProductBox extends StatefulWidget {
  ProductBox({
    Key? key,
    required this.name,
    required this.description,
    required this.price,
    required this.image,
    required this.brand,
    required this.brandOptions,
  }) : super(key: key);

  final String name;
  final String description;
  final int price;
  final String image;
  final String brand;
  final List<String> brandOptions;

  @override
  State<ProductBox> createState() => _ProductBoxState();
}

class _ProductBoxState extends State<ProductBox> {
  late String selectedBrand;

  @override
  void initState() {
    super.initState();
    selectedBrand = widget.brand;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(4),
      child: Card(
        elevation: 3,
        child: Row(
          children: <Widget>[
            Image.asset(
              "assets/appimages/${widget.image}",
              width: 100,
              height: 160,
              fit: BoxFit.cover,
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      widget.name,
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Row(
                      children: [
                        Text("Brand: ", style: TextStyle(fontWeight: FontWeight.w500)),
                        DropdownButton<String>(
                          value: selectedBrand,
                          isDense: true,
                          underline: Container(height: 1, color: Colors.blue),
                          items: widget.brandOptions.map((String b) {
                            return DropdownMenuItem<String>(
                              value: b,
                              child: Text(b),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            if (newValue != null) {
                              setState(() => selectedBrand = newValue);
                            }
                          },
                        ),
                      ],
                    ),
                    SizedBox(height: 4),
                    Text(widget.description, style: TextStyle(color: Colors.grey[700])),
                    SizedBox(height: 4),
                    Text(
                      "Price: \$${widget.price}",
                      style: TextStyle(
                        color: Colors.green[700],
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
