import 'package:flutter/material.dart';
import 'package:posttest4_031_kevin/models/item.dart';

class ItemForm extends StatefulWidget {
  final Function(Item) onSubmit;

  ItemForm({required this.onSubmit});

  @override
  _ItemFormState createState() => _ItemFormState();
}

class _ItemFormState extends State<ItemForm> {
  final TextEditingController namaController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  String? jenisItem;
  final TextEditingController deskripsiController = TextEditingController();
  bool isCheckboxChecked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Item Form',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(
                  controller: namaController,
                  decoration: InputDecoration(
                    labelText: 'Nama Item',
                    labelStyle: TextStyle(
                      color: Colors.black, 
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black, 
                  ),
                ),
                SizedBox(height: 10),
                TextField(
                  controller: hargaController,
                  decoration: InputDecoration(
                    labelText: 'Harga Item',
                    labelStyle: TextStyle(
                      color: Colors.black, 
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black, 
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(height: 10),
                Row(
                  children: [
                    Text('Jenis Item: '),
                    Radio(
                      value: 'Baru',
                      groupValue: jenisItem,
                      onChanged: (value) {
                        setState(() {
                          jenisItem = value as String?;
                        });
                      },
                    ),
                    Text('Baru'),
                    Radio(
                      value: 'Second',
                      groupValue: jenisItem,
                      onChanged: (value) {
                        setState(() {
                          jenisItem = value as String?;
                        });
                      },
                    ),
                    Text('Second'),
                  ],
                ),
                SizedBox(height: 10),
                TextField(
                  controller: deskripsiController,
                  maxLines: null,
                  decoration: InputDecoration(
                    labelText: 'Deskripsi Item',
                    labelStyle: TextStyle(
                      color: Colors.black, 
                    ),
                  ),
                  style: TextStyle(
                    color: Colors.black, 
                  ),
                ),
                SizedBox(height: 10),
                ElevatedButton(
                  onPressed: () {
                    Item newItem = Item(
                      namaItem: namaController.text,
                      hargaItem: int.tryParse(hargaController.text),
                      jenisItem: jenisItem,
                      deskripsiItem: deskripsiController.text,
                    );

                    print('Input Success:');
                    print('Nama Item: ${newItem.namaItem}');
                    print('Harga Item: ${newItem.hargaItem}');
                    print('Jenis Item: ${newItem.jenisItem}');
                    print('Deskripsi Item: ${newItem.deskripsiItem}');

                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Item added successfully!'),
                      ),
                    );
                    widget.onSubmit(newItem);

                    Navigator.pop(context, 'Input success');
                  },
                  child: Text(
                    'Submit',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
