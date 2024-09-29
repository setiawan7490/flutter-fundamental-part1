import 'package:flutter/material.dart';
import 'package:flutter_application_1/basic_widget/text_widget.dart';
import 'basic_widget/image_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rendi Setiawan',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Rendi Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final TextEditingController _controller = TextEditingController(); // Controller untuk TextField
  DateTime selectedDate = DateTime.now(); // Variabel untuk tanggal yang dipilih

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _showAlertDialog(BuildContext context) {
    // Set up the button
    Widget okButton = TextButton(
      child: const Text("OK"),
      onPressed: () {
        Navigator.pop(context); // Menutup dialog
      },
    );

    // Set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: const Text("Aku Rendi"),
      content: const Text("Buat pesan Rendi."),
      actions: [
        okButton,
      ],
    );

    // Show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert; // Menampilkan dialog
      },
    );
  }

  Future<void> _selectDate(BuildContext context) async {
    // Menampilkan Date Picker
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2015, 8),
      lastDate: DateTime(2101),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked; // Mengupdate tanggal yang dipilih
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const MyTextWidget(),
            const MyImageWidget(),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20), // Tambahkan jarak
            ElevatedButton(
              child: const Text('Klik'),
              onPressed: () {
                _showAlertDialog(context); // Menampilkan dialog
              },
            ),
            const SizedBox(height: 20), // Tambahkan jarak
            // TextField Widget
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: TextField(
                controller: _controller, // Menghubungkan controller
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Nama',
                ),
              ),
            ),
            const SizedBox(height: 20), // Tambahkan jarak
            Text("${selectedDate.toLocal()}".split(' ')[0]), // Menampilkan tanggal yang dipilih
            const SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () => _selectDate(context), // Menampilkan Date Picker
              child: const Text('Pilih Tanggal'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
