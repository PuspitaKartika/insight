import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  String? _name;
  String? _pass;
  final nameEcd = TextEditingController();
  final passEcd = TextEditingController();

  @override
  void dispose() {
    nameEcd.dispose();
    passEcd.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _fromKey,
          autovalidateMode: AutovalidateMode.always,
          child: Column(
            children: [
              TextFormField(
                controller: nameEcd,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30)
                        // BorderRadius.all(Radius.circular(30)
                        ),
                    prefixIcon: Icon(Icons.person),
                    hintText: "contoh : Puspita",
                    labelText: "Nama : "),
                onChanged: (String? value) {
                  setState(() {
                    _name = value;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama tidak boleh kosong';
                  }
                },
              ),
              TextFormField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      label: Text("nama"),
                      hintText: "Masukan nama")),
              TextFormField(
                controller: passEcd,
                obscureText: true,
                decoration: const InputDecoration(
                    hintText: "masukan password",
                    labelText: "Password ",
                    border: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.amber),
                      borderRadius: BorderRadius.all(
                        Radius.circular(12),
                      ),
                    ),
                    focusColor: Colors.amber),
                onChanged: (String? value) {
                  setState(() {
                    _pass = value;
                  });
                },
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'Pass tidak boleh kosong';
                  }
                  if (value.contains('@')) {
                    return 'pass harus angka/huruf';
                  }
                },
              ),
              ElevatedButton(
                  onPressed: () {
                    print(nameEcd.text);
                    print(passEcd.text);
                  },
                  child: Text("Submit"))
              //Text(nameEcd.text)
            ],
          ),
        ),
      ),
    );
  }
}
