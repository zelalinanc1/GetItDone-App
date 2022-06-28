import 'package:flutter/material.dart';
import 'package:getit_done/models/items_data.dart';
import 'package:getit_done/widgets/item_card.dart';
import 'package:provider/provider.dart';
import './settings_page.dart';
import 'item_adder.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SettingsPage()));
                },
                icon: Icon(
                  Icons.settings,
                  size: 25,
                )),
          )
        ],
        title: Center(
          child: Text(
            'Get It Done',
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 200,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  '${Provider.of<ItemData>(context).items.length} items',
                  style: Theme.of(context).textTheme.headline3,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Consumer<ItemData>(
                    builder: (context, itemData, child) => Align(
                      alignment: Alignment.topCenter,
                      child: ListView.builder(
                        shrinkWrap: true,
                          reverse: true,
                          //itemCount: Provider.of<ItemData>(context).items.length,
                          itemCount: itemData.items.length,
                          itemBuilder: (context, index) => ItemCard(
                                title: itemData.items[index].title,
                                isDone: itemData.items[index].isDone,
                                toggleStatus: (_) {
                                  itemData.toggleStatus(index);
                                },
                                deleteItem: (_) => itemData.deleteItem(index),
                              )),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              context: context,
              builder: (context) => ItemAdder());
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
