import 'package:flutter/material.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final TextEditingController _listItemTEController = TextEditingController();
  List listData = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('ToDo App', style: TextStyle(fontWeight: FontWeight.w600),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
                flex: 10,
                child: Row(
                  children: [
                    Expanded(
                      flex: 70,
                      child: TextFormField(

                        controller: _listItemTEController,
                        decoration: const InputDecoration(
                          labelText: 'List Item',
                        ),
                        validator: (String? value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Write list item';
                          }
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 30,
                      child: ElevatedButton(
                          onPressed: () {
                            if (_listItemTEController.text.isEmpty == false) {
                              _getItemText();
                              setState(() {});
                            }
                            _listItemTEController.clear();
                          },
                          child: const Text('Add')),
                    )
                  ],
                )),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                flex: 90,
                child: ListView.builder(
                    itemBuilder: (context, index) {
                      return Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(4)),
                        child: ListTile(
                          title: Text(listData[index]),
                          trailing: IconButton(
                            onPressed: () {
                              _getItemRemove(index);
                            },
                            icon: const Icon(
                              Icons.delete,
                              color: Colors.green,
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: listData.length)),
          ],
        ),
      ),
    );
  }

  void _getItemText() {
    String itemText = _listItemTEController.text;
    listData.add(itemText);
  }

  void _getItemRemove(index) {
    listData.removeAt(index);
    setState(() {});
  }

  @override
  void dispose() {
    super.dispose();
    _listItemTEController.dispose();
  }
}
