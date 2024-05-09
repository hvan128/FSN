import 'package:frontend/models/category/category.dart';
import 'package:frontend/models/community/dish.dart';
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

List<Category> listCategoriesTest =
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


List<Reaction> listTestReactions = [
  Reaction(
    type: reactions[0].value,
    quantity: 20,
    isSelected: true,
  ),
  Reaction(
    type: reactions[1].value,
    quantity: 100,
  ),  
  Reaction(
    type: reactions[2].value,
    quantity: 50,
  ),
];