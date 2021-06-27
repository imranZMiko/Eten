import 'package:flutter/material.dart';

class Randoms with ChangeNotifier {
  List<Map<String, dynamic>> list = [
    {"id": 641461, "title": "Deviled Eggs With Crab"},
    {"id": 716413, "title": "Oven Roasted Tomato Sauce"},
    {"id": 631750, "title": "Flank Steak with Mushroom Sauce"},
    {"id": 639629, "title": "Classic Macaroni and Cheese"},
    {
      "id": 655525,
      "title": "Pecan Pumpkin Pie Dessert Pizza with Maple Whipped Cream"
    },
    {"id": 638257, "title": "Chicken Porridge"},
    {"id": 641794, "title": "Easter Bunny's Vegan Ambrosia Salad"},
    {"id": 637625, "title": "Cheesecake with cranberries"},
    {"id": 650939, "title": "Maple-Glazed Apple Cookies"},
    {"id": 632452, "title": "Apple & Cream Cheese Braid"},
    {"id": 660306, "title": "Slow Cooker: Pork and Garbanzo Beans"},
    {"id": 645730, "title": "Grilled Guacamole with Pistachios"},
    {
      "id": 1045245,
      "title": "How to make the perfect Chocolate Chip Eggnog Bars"
    },
    {"id": 661653, "title": "Stir Fried Cabbage and Tomatoes"},
    {"id": 642594, "title": "Farfalle with Shrimps, Tomatoes Basil Sauce"},
    {"id": 652513, "title": "Mozzarella Sticks"},
    {
      "id": 716430,
      "title": "Roasted Cabbage Wedge Salad with Yogurt Gorgonzola Dressing"
    },
    {"id": 641727, "title": "Dulce De Leche Crème Brûlée"},
    {"id": 634434, "title": "Basil Marinated Grilled Chicken"},
    {"id": 637932, "title": "Chicken and White Bean Chili"},
    {"id": 652651, "title": "Mushroom Crepes with Vegetarian Sauce"},
    {"id": 663313, "title": "The Pearhattan Cocktail"},
    {"id": 637814, "title": "Chèvre With Sautéed Grapes"},
    {"id": 637658, "title": "Cheesy Ham and Shrimp Macaroni Au Gratin"},
    {"id": 660697, "title": "Southern Fried Catfish"},
    {"id": 637218, "title": "Carrot Raisin Chocolate Chip Cookies"},
    {"id": 715511, "title": "Antipasto Squares"},
    {"id": 634237, "title": "Bananas Foster Ice Cream"},
    {"id": 715437, "title": "Homemade King Ranch Chicken Casserole"},
    {"id": 632085, "title": "Allergy-Free Thin Mints"},
    {"id": 661925, "title": "Strawberry-Mango Quinoa Salad"},
    {"id": 639580, "title": "Classic Carrot Cake With Cream Cheese Frosting"},
    {"id": 633942, "title": "Balsamic Roasted Vegetables"},
    {"id": 636328, "title": "Brownie Coffins"},
    {"id": 637335, "title": "Cedar-Planked Salmon With Mustard Dill Sauce"},
    {"id": 650139, "title": "Linguine with Prawns, Fresh Tomatoes and Spinach"},
    {"id": 634091, "title": "Banana Foster Bread Pudding"},
    {"id": 798956, "title": "Mango Banana Coconut Smoothie"},
    {"id": 1000566, "title": "Easy Instant Pot Beef Tips and Rice"},
    {"id": 635370, "title": "Blue Cheese Tartlets With Fig Jam and Walnuts"},
    {
      "id": 642660,
      "title": "Fennel and Orange Salad With Toasted Hazelnuts and Cranberries"
    },
    {"id": 1039293, "title": "Pulled Pork Nachos"},
    {"id": 640383, "title": "Cranberry Margarita"},
    {"id": 794351, "title": "Summery Tomato Soup with Pasta and Chickpeas"},
    {
      "id": 637593,
      "title": "Cheese Tortellini With Shrimp In Tomato Cream Sauce"
    },
    {"id": 660868, "title": "Spanish Meatballs In Tomato Sauce"},
    {
      "id": 1043339,
      "title": "Skillet Sweet Potato Casserole with Bacon, Brown Sugar Crumble"
    },
    {"id": 662694, "title": "Swordfish with Orange Caramel Sauce"},
    {"id": 641060, "title": "Curried Cabbage & Kale Gratin"},
    {"id": 645714, "title": "Grilled Fish With Sun Dried Tomato Relish"},
    {"id": 661447, "title": "Square Deviled Eggs"},
    {"id": 658418, "title": "Roast Chicken with Apples and Rosemary"},
    {"id": 642113, "title": "Easy Pork Chops on Stuffing"},
    {"id": 633344, "title": "Bacon Wrapped Pork Tenderloin"},
    {"id": 649808, "title": "Lemon Thumbprint Cookies"},
    {"id": 658632, "title": "Roasted Pumpkin and Barley Risotto"},
    {"id": 633293, "title": "Bacon Brownie Cupcakes"},
    {"id": 638604, "title": "Chilled Swiss Oatmeal"},
    {"id": 716411, "title": "Snickerdoodle Ice Cream"},
    {"id": 640366, "title": "Cranberry Crumb Bars"},
    {"id": 664270, "title": "Valentine's Chicken Marsala"},
    {"id": 656329, "title": "Pizza bites with pumpkin"},
    {"id": 640349, "title": "Cranberry and Orange Juice Spareribs"},
    {"id": 639672, "title": "Coastal Avocado Salad with Grapes and Shrimp"},
    {"id": 638819, "title": "Chocolate Asparagus Bundt Cake"},
    {"id": 639616, "title": "Classic Matzo Ball Soup"},
    {"id": 651341, "title": "Meatball Sliders"},
    {"id": 715527, "title": "Sweet and Sticky Chicken Strips"},
    {"id": 634992, "title": "Bing's Mango Salsa"},
    {"id": 631748, "title": "Asian Shrimp Stir-Fry"},
    {"id": 665193, "title": "White Chocolate Raspberry Brie Cups"},
    {"id": 643362, "title": "French Onion Marsala Soup"},
    {"id": 640266, "title": "Crab and Shrimp Burgers With Garlic Grits Fries"},
    {"id": 645714, "title": "Grilled Fish With Sun Dried Tomato Relish"},
    {"id": 765011, "title": "Snap Pea and Green Bean Salad with Arugula Pesto"},
    {"id": 1050445, "title": "How to Make the Best Crock Pot Roast"},
    {"id": 792705, "title": "4 Ingredient Raw Peanut Butter Chocolate Cups"},
    {
      "id": 640166,
      "title":
          "Cornmeal-Crusted Catfish with Cajun Seasoning and Spicy Tartar Sauce"
    },
    {"id": 642287, "title": "Eggplant Fries with Tzatziki Sauce"},
    {
      "id": 658517,
      "title": "Roasted Brussels Sprouts With Red Onions and Pancetta"
    },
    {"id": 637766, "title": "Cherry Lime Mojito"},
    {"id": 637181, "title": "Carrot Cake Muffin Cookies"},
    {"id": 651757, "title": "Meyer Lemon Cheesecake"},
    {"id": 649361, "title": "Layered Poppy Seed Pastries"},
    {"id": 795514, "title": "Spaghetti Squash & Tomato Basil Meat Sauce"},
    {"id": 716272, "title": "Nutella Crepes and Ice Cream"},
    {"id": 660231, "title": "Skinny Veggie Fried Rice"},
    {"id": 641896, "title": "Easy Chicken Cordon Bleu"},
    {"id": 644846, "title": "Gluten Free Onion Rings"},
    {"id": 645721, "title": "Grilled Garlicky-Herbed Shrimp"},
    {"id": 729366, "title": "Plantain Salad"},
    {"id": 639153, "title": "Chocolate Peanut Butter No-Bake Dessert"},
    {"id": 636087, "title": "Breakfast: Waffles"},
    {"id": 633139, "title": "Avocado Chocolate Bits Frozen Yogurt"},
    {"id": 639850, "title": "Cod with tomatoes, olives and polenta"},
    {"id": 639594, "title": "Classic Eggs Benedict"},
    {
      "id": 636212,
      "title": "Broccoli Rabe with Tomatoes, Anchovies & Spaghetti"
    },
    {"id": 632819, "title": "Asian Chickpea Lettuce Wraps"},
    {
      "id": 1043339,
      "title": "Skillet Sweet Potato Casserole with Bacon, Brown Sugar Crumble"
    },
    {"id": 648432, "title": "Jambalaya Stew"},
    {"id": 644693, "title": "Gingerbread Mummies"},
    {"id": 663313, "title": "The Pearhattan Cocktail"},
    {
      "id": 658579,
      "title": "Roasted Endive Salad With Prosciutto, Figs and Pistachios"
    },
    {"id": 766453, "title": "Hummus and Za'atar"},
    {"id": 776505, "title": "Sausage & Pepperoni Stromboli"},
    {"id": 631748, "title": "Asian Shrimp Stir-Fry"},
    {"id": 716403, "title": "Easy Lemon Feta Greek Yogurt Dip"},
    {"id": 660697, "title": "Southern Fried Catfish"},
    {"id": 638917, "title": "Chocolate Chip Coconut Muffins"},
    {"id": 639620, "title": "Classic New England Crab Cakes"},
    {"id": 646217, "title": "Ham with Orange Rosemary Marmalade Glaze"},
    {"id": 665016, "title": "Watermelon Jalapeño Cocktail Cooler"},
    {"id": 639749, "title": "Coconut Cream Pie Vegan Milkshake"},
    {"id": 652427, "title": "Moroccan kofte and sausage stew"},
    {"id": 716300, "title": "Plantain Pizza"},
    {"id": 635059, "title": "Black Bean and Veggie Burgers with Corn Salsa"},
    {"id": 715391, "title": "Slow Cooker Chicken Taco Soup"},
    {
      "id": 642259,
      "title": "Eggless Blueberry and White Chocolate Baked Cheesecake"
    },
    {"id": 642138, "title": "Easy Vegetable Fried Rice"},
    {"id": 991010, "title": "Chicken Ranch Burgers"},
  ];

  List<Map<String, dynamic>> get randomList {
    return list.getRange(0, 10).toList();
  }

  Future<void> getData() async {
    await Future.delayed(Duration.zero);
    list.shuffle();
    notifyListeners();
  }
}
