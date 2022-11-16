import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'main.dart';
import 'drawer.dart';

class MyFormPage extends StatefulWidget {
  const MyFormPage({
    super.key,
    required this.budgetList,
    required this.addBudget,
  });

  final String title = 'Form Budget';
  final List<Budget> budgetList;
  final Function(Budget) addBudget;

  @override
  State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();
  String formTitle = '';
  int formAmount = 0;
  String? formType;
  final List<String> typeList = ['Pemasukan', 'Pengeluaran'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        title: Text(widget.title),
      ),

      drawer: MyDrawer(
        budgetList: widget.budgetList,
        addBudget: widget.addBudget,
      ),

      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: <Widget>[

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: 'Judul',
                      hintText: 'Beli Sate Pacil',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() {
                        formTitle = value!;
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        formTitle = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Judul tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                    ],
                    decoration: InputDecoration(
                      labelText: 'Nominal',
                      hintText: '15000 (tanpa Rp atau tanda)', 
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                      ),
                    ),
                    onChanged: (String? value) {
                      setState(() { 
                        formAmount = (value == null || value.isEmpty) ? 0 : int.parse(value);
                      });
                    },
                    onSaved: (String? value) {
                      setState(() {
                        formAmount = (value == null || value.isEmpty) ? 0 : int.parse(value);
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Nominal tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: DropdownButtonFormField(
                    value: formType,
                    hint: const Text('Pilih Jenis'),
                    items: typeList.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        formType = value!;
                      });
                    },
                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'Jenis tidak boleh kosong!';
                      }
                      return null;
                    },
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: TextButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.blue),
                    ),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        widget.addBudget(Budget(
                          formTitle,
                          formAmount,
                          formType!
                        ));
                      };
                    },
                    child: const Text(
                      'Simpan',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              
              ],
            ),
          ),
        ),
      ),
    );
  }
}