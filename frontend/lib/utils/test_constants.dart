import 'package:frontend/types/dish.dart';
import 'package:frontend/types/food.dart';
import 'package:frontend/types/type.dart';
import 'package:frontend/types/user.dart';
import 'package:frontend/utils/constants.dart';

//! Food
List<ItemFood> listFoodsTest = foods.map((food) {
  return ItemFood(
    categories: food.categories.length > 3
        ? food.categories.sublist(0, 2)
        : food.categories,
    value: food.value,
    label: food.label,
    icon: food.icon,
  );
}).toList();
List<ItemFood> listFoodsTest2 = foods.map((food) {
  return ItemFood(
    categories: food.categories.length > 3
        ? food.categories.sublist(3, 5)
        : food.categories,
    value: food.value,
    label: food.label,
    icon: food.icon,
  );
}).toList();
List<ItemFood> listFoodsTest3 = foods.map((food) {
  return ItemFood(
    categories: food.categories.length > 3
        ? food.categories.sublist(5, 7)
        : food.categories,
    value: food.value,
    label: food.label,
    icon: food.icon,
  );
}).toList();

List<ItemCategory> listCategoriesTest =
    listFoodsTest.expand((food) => food.categories).toSet().toList();

//! User
List<User> users = [
  User(
    id: '0',
    username: 'john_doe',
    email: 'john.doe@example.com',
    image:
        'https://www.facebook.com/photo?fbid=3516518468585687&set=a.1525178521053035',
    description: 'Hello, I am John Doe!',
    address: '123 Main Street, City, Country',
    phone: '+1234567890',
    birthday: '1990-01-01',
    gender: 'Male',
    role: 'User',
  ),
  User(
    id: '1',
    username: 'jane_smith',
    email: 'jane.smith@example.com',
    image:
        'https://www.facebook.com/photo/?fbid=3439660432974948&set=a.1381585872115758',
    description: 'Nice to meet you! I am Jane Smith.',
    address: '456 Elm Street, Town, Country',
    phone: '+1987654321',
    birthday: '1985-05-15',
    gender: 'Female',
    role: 'Admin',
  ),
  User(
    id: '2',
    username: 'sam_jones',
    email: 'sam.jones@example.com',
    image:
        'https://www.facebook.com/photo/?fbid=744204171150389&set=a.297320822505395',
    description: 'Greetings! I am Sam Jones.',
    address: '789 Oak Street, Village, Country',
    phone: '+1122334455',
    birthday: '1995-11-20',
    gender: 'Other',
    role: 'User',
  ),
];

//! dish

List<Dish> listDishes = [
  Dish(
    ownerId: '1',
    cookingTime: 20,
    label: 'Spaghetti Carbonara',
    image: 'assets/images/pizza.jpg',
    description: 'Classic Italian pasta dish with creamy sauce. Simple yet delicious pizza topped with tomato sauce, mozzarella cheese, and basil leaves. Simple yet delicious pizza topped with tomato sauce, mozzarella cheese, and basil leaves. Simple yet delicious pizza topped with tomato sauce, mozzarella cheese, and basil leaves.',
    ingredients: [
      Ingredient(
        category: 'mi-ong',
        quantity: 200,
        unit: 'g',
      ),
      Ingredient(
        category: 'xuc-xich-hun-khoi',
        quantity: 100,
        unit: 'g',
      ),
      Ingredient(
        category: 'trung',
        quantity: 2,
        unit: 'nos',
      ),
      Ingredient(
        category: 'pho-mai',
        quantity: 50,
        unit: 'g',
      ),
      Ingredient(
        category: 'ho-tieu',
        quantity: 1,
        unit: 'tsp',
      ),
    ],
    steps: [
      Step(
        no: 1,
        description: 'Cook spaghetti according to package instructions.',
      ),
      Step(
        no: 2,
        description: 'In a separate pan, cook bacon until crispy.',
      ),
      Step(
        no: 3,
        description:
            'In a bowl, whisk together eggs, Parmesan cheese, and black pepper.',
      ),
      Step(
        no: 4,
        description:
            'Drain spaghetti and add to the pan with bacon. Toss together.',
      ),
      Step(
        no: 5,
        description:
            'Pour egg mixture over spaghetti and toss quickly to coat. Serve immediately.',
      ),
    ],
    rangOfPeople: 4,
    isSaved: true,
    reactions: [Reaction(type: 'like', quantity: '2'), Reaction(type: 'love', quantity: '1', isSelected: true)],
  ),
  Dish(
    ownerId: '0',
    cookingTime: 15,
    label: 'Chicken Curry',
    image: 'assets/images/thit-kho.jpg',
    description: 'Delicious Indian curry with tender chicken pieces.',
    ingredients: [
      Ingredient(
        category: 'ga',
        quantity: 500,
        unit: 'g',
      ),
      Ingredient(
        category: 'hanh-kho',
        quantity: 2,
        unit: 'nos',
      ),
      Ingredient(
        category: 'ca-chua',
        quantity: 3,
        unit: 'nos',
      ),
      Ingredient(
        category: 'gung',
        quantity: 3,
        unit: 'cloves',
      ),
      Ingredient(
        category: 'rau-mui',
        quantity: 2,
        unit: 'tsp',
      ),
      Ingredient(
        category: 'nghe',
        quantity: 1,
        unit: 'tsp',
      ),
      Ingredient(
        category: 'bot-ot',
        quantity: 1,
        unit: 'tsp',
      ),
      Ingredient(
        category: 'sua-dua',
        quantity: 200,
        unit: 'ml',
      ),
      Ingredient(
        category: 'muoi',
        quantity: 1,
        unit: 'tsp',
      ),
      Ingredient(
        category: 'dau-ca',
        quantity: 2,
        unit: 'tbsp',
      ),
    ],
    steps: [
      Step(
        no: 1,
        description:
            'Heat oil in a pan. Add chopped onion, garlic, and ginger. Sauté until golden brown.',
      ),
      Step(
        no: 2,
        description: 'Add chopped tomatoes and cook until soft.',
      ),
      Step(
        no: 3,
        description: 'Add chicken pieces and cook until they turn white.',
      ),
      Step(
        no: 4,
        description:
            'Add coriander powder, turmeric powder, chili powder, and salt. Mix well.',
      ),
      Step(
        no: 5,
        description:
            'Pour in coconut milk and simmer until chicken is cooked through and the sauce thickens.',
      ),
      Step(
        no: 6,
        description:
            'Garnish with fresh coriander leaves and serve hot with rice or naan.',
      ),
    ],
    rangOfPeople: 6,
    isSaved: false,
    reactions: listTestReactions,
  ),
  Dish(
    ownerId: '2',
    label: 'Margherita Pizza',
    cookingTime: 30,
    image: 'assets/images/ga.jpg',
    description:
        'Simple yet delicious pizza topped with tomato sauce, mozzarella cheese, and basil leaves.',
    ingredients: [
      Ingredient(
        category: 'dau-ca',
        quantity: 1,
        unit: 'portion',
      ),
      Ingredient(
        category: 'nuoc-sot-pesto',
        quantity: 100,
        unit: 'g',
      ),
      Ingredient(
        category: 'pho-mai-mozzarella',
        quantity: 150,
        unit: 'g',
      ),
      Ingredient(
        category: 'hung-que',
        quantity: 10,
        unit: 'leaves',
      ),
      Ingredient(
        category: 'dau-ca',
        quantity: 1,
        unit: 'tbsp',
      ),
      Ingredient(
        category: 'muoi',
        quantity: 1,
        unit: 'pinch',
      ),
    ],
    steps: [
      Step(
        no: 1,
        description: 'Preheat oven to 220°C (425°F).',
      ),
      Step(
        no: 2,
        description:
            'Roll out pizza dough on a floured surface to desired thickness.',
      ),
      Step(
        no: 3,
        description:
            'Spread tomato sauce evenly over the dough, leaving a small border around the edges.',
      ),
      Step(
        no: 4,
        description: 'Sprinkle shredded mozzarella cheese over the sauce.',
      ),
      Step(
        no: 5,
        description: 'Arrange fresh basil leaves on top of the cheese.',
      ),
      Step(
        no: 6,
        description:
            'Drizzle olive oil over the pizza and season with a pinch of salt.',
      ),
      Step(
        no: 7,
        description:
            'Bake in the preheated oven for 12-15 minutes, or until the crust is golden brown and the cheese is bubbly.',
      ),
      Step(
        no: 8,
        description: 'Remove from oven, slice, and serve hot.',
      ),
    ],
    rangOfPeople: 2,
    isSaved: true,
    reactions: listTestReactions,
  ),
];


List<Reaction> listTestReactions = [
  Reaction(
    type: reactions[0].value,
    quantity: '20',
    isSelected: true,
  ),
  Reaction(
    type: reactions[1].value,
    quantity: '100',
  ),  
  Reaction(
    type: reactions[2].value,
    quantity: '50',
  ),
];