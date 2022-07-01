import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:popular_food/DetailFood.dart';
import 'package:popular_food/model/Food.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('Popular Food'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: EdgeInsets.all(20.0),
                child: Text(
                  "Popular Food",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              PopularFoodList(),
            ],
          ),
        ),
      ),
    );
  }
}

class PopularFoodList extends StatelessWidget {
  const PopularFoodList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        final Food popularFood = popularFoodList[index];
        NumberFormat currencyFormatter = NumberFormat.currency(
          locale: 'id',
          symbol: 'IDR ',
          decimalDigits: 0,
        );

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10,
            vertical: 5.0,
          ),
          child: InkWell(
            borderRadius: BorderRadius.circular(12.0),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return DetailFood(food: popularFood);
              }));
            },
            child: Container(
              margin: EdgeInsets.all(10.0),
              padding: EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 25.0,
              ),
              decoration: BoxDecoration(
                color: Color(0xffF6F7FB),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/images/${popularFood.imageAsset}',
                    width: 68,
                    height: 70,
                  ),
                  SizedBox(width: 18.0),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          popularFood.name,
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                            color: Color(0xff111111),
                          ),
                        ),
                        Text(
                          popularFood.description,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: TextStyle(
                            color: Color(0xffA4A4A4),
                          ),
                        ),
                        Text(
                          currencyFormatter.format(popularFood.price),
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w600,
                            color: Color(0xff111111),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      physics: ScrollPhysics(),
      itemCount: popularFoodList.length,
    );
  }
}
