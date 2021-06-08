import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:z_provider_ex/itemData.dart';

import 'itemData.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ItemData(),
      child: MaterialApp(
        title: 'Followers App',
        home: HomePage(),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ItemData>(
      builder: (context, item, child) {
        return Scaffold(
          body: ListView.separated(
            itemCount: item.itemCount,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(item.items[index]),
              );
            },
            separatorBuilder: (context, index) {
              return Divider();
            },
          ),
          floatingActionButton: FloatingActionButton(onPressed: () {
            item.addItem('new Val');
          }),
        );
      },
    );
  }
}

//works provider.of is redundant
// class HomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: ListView.separated(
//         itemCount: Provider.of<ItemData>(context).itemCount,
//         itemBuilder: (context, index) {
//           return ListTile(
//             title: Text(Provider.of<ItemData>(context).items[index]),
//           );
//         },
//         separatorBuilder: (context, index) {
//           return Divider();
//         },
//       ),
//     );
//   }
// }
