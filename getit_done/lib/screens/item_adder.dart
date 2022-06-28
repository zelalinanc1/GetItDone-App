import 'package:flutter/material.dart';
import 'package:getit_done/models/items_data.dart';
import 'package:provider/provider.dart';

class ItemAdder extends StatelessWidget {

  final textController=TextEditingController();
   ItemAdder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(7.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextField(
                  controller: textController,
                  onChanged: (input){

                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Add Item',
                    hintText: '....',
                  ),
                  autofocus: true,
                ),

              FlatButton(
                onPressed: () {
                  Provider.of<ItemData>(context,listen: false).addItem(textController.text);
                  Navigator.pop(context);
                },
                color: Colors.lightGreen[500],
                child: Text('ADD'),
              ),
            ],
          )
        ),
      ),
    );
  }
}
