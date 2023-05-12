import 'package:quitanda_app/src/models/cart_item_model.dart';
import 'package:quitanda_app/src/models/order_model.dart';
import 'package:quitanda_app/src/models/user_model.dart';

import '../models/item_model.dart';

ItemModel apple = ItemModel(
  description:
      'A melhor maçã da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
  imgUrl: 'assets/fruits/apple.png',
  name: 'Maçã',
  price: 5.5,
  unit: 'kg',
);

ItemModel grape = ItemModel(
  imgUrl: 'assets/fruits/grape.png',
  name: 'Uva',
  price: 7.4,
  unit: 'kg',
  description:
      'A melhor uva da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel guava = ItemModel(
  imgUrl: 'assets/fruits/guava.png',
  name: 'Goiaba',
  price: 11.5,
  unit: 'kg',
  description:
      'A melhor goiaba da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel kiwi = ItemModel(
  imgUrl: 'assets/fruits/kiwi.png',
  name: 'Kiwi',
  price: 2.5,
  unit: 'un',
  description:
      'O melhor kiwi da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel mango = ItemModel(
  imgUrl: 'assets/fruits/mango.png',
  name: 'Manga',
  price: 2.5,
  unit: 'un',
  description:
      'A melhor manga da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

ItemModel papaya = ItemModel(
  imgUrl: 'assets/fruits/papaya.png',
  name: 'Mamão papaya',
  price: 8,
  unit: 'kg',
  description:
      'O melhor mamão da região e que conta com o melhor preço de qualquer quitanda. Este item conta com vitaminas essenciais para o fortalecimento corporal, resultando em uma vida saudável.',
);

// Lista de produtos
List<ItemModel> items = [
  apple,
  grape,
  guava,
  kiwi,
  mango,
  papaya,
];

List<String> categories = [
  'Fruits',
  'Vegetables',
  'Meat',
  'Beverages',
  'Vegetables2',
  'Vegetables3',
  'Vegetables4'
];

List<CartItemModel> cartItems = [
  CartItemModel(item: apple, quantity: 5),
  CartItemModel(item: grape, quantity: 3),
  CartItemModel(item: kiwi, quantity: 7),
  CartItemModel(item: papaya, quantity: 1),
];

UserModel user = UserModel(
  name: 'Bruno Brizolara',
  email: 'bbrizolara7@gmail.com',
  phone: '099057586',
  id: '87129418087',
  password: '123asd',
);

List<OrderModel> orders = [
  OrderModel(
      id: '1',
      createdAt: DateTime.parse('2023-05-05 10:00:10.458'),
      overdueAt: DateTime.parse('2023-05-22 12:00:10.458'),
      items: [
        CartItemModel(item: apple, quantity: 1),
        CartItemModel(item: grape, quantity: 2)
      ],
      status: 'pending_payment',
      copyAndPaste: 'sfsghf8s7fsfs',
      total: 5.5),
  OrderModel(
      id: '2',
      createdAt: DateTime.parse('2023-05-06 10:00:10.458'),
      overdueAt: DateTime.parse('2023-05-15 12:00:10.458'),
      items: [
        CartItemModel(item: apple, quantity: 6),
        CartItemModel(item: grape, quantity: 7)
      ],
      status: 'delivered',
      copyAndPaste: 'sfsghf8s7fdffdsfs',
      total: 5.5)
];
