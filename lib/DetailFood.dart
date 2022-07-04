import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:popular_food/model/Food.dart';

class DetailFood extends StatefulWidget {
  final Food food;

  const DetailFood({Key? key, required this.food}) : super(key: key);

  @override
  State<DetailFood> createState() => _DetailFoodState();
}

class _DetailFoodState extends State<DetailFood> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 992) {
          return DetailWebPage(food: widget.food);
        } else {
          return DetailMobilePage(food: widget.food);
        }
      },
    );
  }
}

class DetailMobilePage extends StatefulWidget {
  final Food food;

  const DetailMobilePage({Key? key, required this.food}) : super(key: key);

  @override
  State<DetailMobilePage> createState() => _DetailMobilePageState();
}

class _DetailMobilePageState extends State<DetailMobilePage> {
  String size = 'S';
  int quantity = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'IDR ',
      decimalDigits: 0,
    );

    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 20,
                        left: 10,
                      ),
                      child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios_new),
                        alignment: Alignment.centerLeft,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 0,
                      ),
                      child: Text(
                        widget.food.name,
                        style: TextStyle(
                          fontSize: 30.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 20,
                        right: 20,
                        top: 0,
                        bottom: 20,
                      ),
                      child: Text(
                        widget.food.description,
                        style: TextStyle(
                          fontSize: 16.0,
                          color: Color(0xffA4A4A4),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        'assets/images/${widget.food.imageAsset}',
                        width: 315.0,
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Size",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    size = 'S';
                                  });
                                },
                                child: Text(
                                  "S",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: size == 'S'
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(12),
                                  primary: size == 'S'
                                      ? Colors.green
                                      : Colors.grey[300],
                                ),
                              ),
                              SizedBox(width: 15),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    size = 'M';
                                  });
                                },
                                child: Text(
                                  "M",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: size == 'M'
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(12),
                                    primary: size == 'M'
                                        ? Colors.green
                                        : Colors.grey[300]),
                              ),
                              SizedBox(width: 15),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    size = 'L';
                                  });
                                },
                                child: Text(
                                  "L",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: size == 'L'
                                        ? Colors.white
                                        : Colors.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(12),
                                    primary: size == 'L'
                                        ? Colors.green
                                        : Colors.grey[300]),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Quantity",
                            style: TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  if (quantity > 1) {
                                    setState(() {
                                      quantity -= 1;
                                    });
                                  }
                                },
                                child: Text(
                                  "-",
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(3),
                                  primary: Colors.grey[300],
                                ),
                              ),
                              SizedBox(width: 10),
                              Text(
                                quantity.toString(),
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    quantity += 1;
                                  });
                                },
                                child: Text(
                                  "+",
                                  style: TextStyle(
                                    fontSize: 24,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(3),
                                    primary: Colors.green),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(16.0),
              child: Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Price",
                          style: TextStyle(
                            fontSize: 18.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xffA4A4A4),
                          ),
                        ),
                        Text(
                          currencyFormatter.format(widget.food.price),
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        isFavorite = !isFavorite;
                      });
                    },
                    child: Icon(
                      isFavorite ? Icons.favorite : Icons.favorite_border,
                      size: 30.0,
                      color: isFavorite ? Colors.red : Colors.black,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(14),
                      primary: Colors.grey[300],
                    ),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: () {},
                    child: Icon(
                      Icons.shopping_basket_outlined,
                      size: 30.0,
                    ),
                    style: ElevatedButton.styleFrom(
                      shape: CircleBorder(),
                      padding: EdgeInsets.all(14),
                      primary: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailWebPage extends StatefulWidget {
  final Food food;

  const DetailWebPage({Key? key, required this.food}) : super(key: key);

  @override
  State<DetailWebPage> createState() => _DetailWebPageState();
}

class _DetailWebPageState extends State<DetailWebPage> {
  String size = 'S';
  int quantity = 1;
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'IDR ',
      decimalDigits: 0,
    );

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.only(
                  top: 20,
                  left: 10,
                ),
                child: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(Icons.arrow_back_ios_new),
                  alignment: Alignment.centerLeft,
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Image.asset(
                        'assets/images/${widget.food.imageAsset}',
                        width: 300.0,
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.food.name,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          widget.food.description,
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Color(0xffA4A4A4),
                          ),
                        ),
                        SizedBox(height: 20.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Size",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      size = 'S';
                                    });
                                  },
                                  child: Text(
                                    "S",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: size == 'S'
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(12),
                                    primary: size == 'S'
                                        ? Colors.green
                                        : Colors.grey[300],
                                  ),
                                ),
                                SizedBox(width: 15),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      size = 'M';
                                    });
                                  },
                                  child: Text(
                                    "M",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: size == 'M'
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(12),
                                      primary: size == 'M'
                                          ? Colors.green
                                          : Colors.grey[300]),
                                ),
                                SizedBox(width: 15),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      size = 'L';
                                    });
                                  },
                                  child: Text(
                                    "L",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: size == 'L'
                                          ? Colors.white
                                          : Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(12),
                                      primary: size == 'L'
                                          ? Colors.green
                                          : Colors.grey[300]),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Quantity",
                              style: TextStyle(
                                fontSize: 18.0,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    if (quantity > 1) {
                                      setState(() {
                                        quantity -= 1;
                                      });
                                    }
                                  },
                                  child: Text(
                                    "-",
                                    style: TextStyle(
                                      fontSize: 24,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    shape: CircleBorder(),
                                    padding: EdgeInsets.all(3),
                                    primary: Colors.grey[300],
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text(
                                  quantity.toString(),
                                  style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      quantity += 1;
                                    });
                                  },
                                  child: Text(
                                    "+",
                                    style: TextStyle(
                                      fontSize: 24,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      shape: CircleBorder(),
                                      padding: EdgeInsets.all(3),
                                      primary: Colors.green),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(height: 40),
                        Padding(
                          padding: const EdgeInsets.only(right: 16),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Price",
                                      style: TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        color: Color(0xffA4A4A4),
                                      ),
                                    ),
                                    Text(
                                      currencyFormatter
                                          .format(widget.food.price),
                                      style: TextStyle(
                                        fontSize: 24.0,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  setState(() {
                                    isFavorite = !isFavorite;
                                  });
                                },
                                child: Icon(
                                  isFavorite
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 30.0,
                                  color: isFavorite ? Colors.red : Colors.black,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(14),
                                  primary: Colors.grey[300],
                                ),
                              ),
                              SizedBox(width: 10),
                              ElevatedButton(
                                onPressed: () {},
                                child: Icon(
                                  Icons.shopping_basket_outlined,
                                  size: 30.0,
                                ),
                                style: ElevatedButton.styleFrom(
                                  shape: CircleBorder(),
                                  padding: EdgeInsets.all(14),
                                  primary: Colors.green,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
