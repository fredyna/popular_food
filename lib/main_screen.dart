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
        title: Text('Central Pizza'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  margin: EdgeInsets.all(20.0),
                  child: Text(
                    "Popular Pizza",
                    style: TextStyle(
                      fontSize: 30.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                constraints.maxWidth <= 992
                    ? PopularFoodList()
                    : PopularFoodGrid(),
              ],
            );
          }),
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

class PopularFoodGrid extends StatelessWidget {
  const PopularFoodGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final double itemHeight = (size.height - kToolbarHeight) / 4;
    final double itemWidth = size.width / 2;
    final _scrollController = ScrollController();

    NumberFormat currencyFormatter = NumberFormat.currency(
      locale: 'id',
      symbol: 'IDR ',
      decimalDigits: 0,
    );

    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
          childAspectRatio: (itemWidth / itemHeight),
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          physics: ScrollPhysics(),
          controller: _scrollController,
          children: popularFoodList.map((food) {
            return InkWell(
              borderRadius: BorderRadius.circular(12.0),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return DetailFood(food: food);
                }));
              },
              child: Container(
                height: 140,
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
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'assets/images/${food.imageAsset}',
                      width: 68,
                      height: 70,
                    ),
                    SizedBox(width: 18.0),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            food.name,
                            style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500,
                              color: Color(0xff111111),
                            ),
                          ),
                          Text(
                            food.description,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 1,
                            style: TextStyle(
                              color: Color(0xffA4A4A4),
                            ),
                          ),
                          Text(
                            currencyFormatter.format(food.price),
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
            );
          }).toList(),
        ),
      ),
    );
  }
}
