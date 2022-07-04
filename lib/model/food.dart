class Food {
  String name;
  String description;
  int price;
  String imageAsset;

  Food({
    required this.name,
    required this.description,
    required this.price,
    required this.imageAsset,
  });
}

var popularFoodList = [
  Food(
    name: 'GRILLED BEEF SUPREME',
    description:
        'BBQ Sauce, Cheese Sauce, Onion, Beef Burger, Jalapeno, Mozzarella',
    price: 80900,
    imageAsset: 'grill-beef-supreme.png',
  ),
  Food(
    name: 'BEEF PEPPERONI FEAST',
    description:
    'Pizza Sauce, Beef Pepperoni, Mozzarella Cheese',
    price: 68300,
    imageAsset: 'beef-pepperoni-feast.png',
  ),
  Food(
    name: 'TUNA DELIGHT',
    description:
    'Hot Spicy Tuna, Mayonnaise, Onion, Red Pepper, Parsley, Mozzarella',
    price: 68300,
    imageAsset: 'tuna-delight.png',
  ),
  Food(
    name: 'CHICKEN PEPPERONI FEAST',
    description:
    'Pizza Sauce, Chicken Pepperoni, Mozzarella Cheese',
    price: 43200,
    imageAsset: 'chicken-pepperoni-feast.png',
  ),
  Food(
    name: 'DOUBLE BEEF BURGER',
    description:
    'Pizza Sauce, Mustard Sauce, Tomato Sauce, Beef Crumble',
    price: 68300,
    imageAsset: 'double-beef-burger.png',
  ),
];
