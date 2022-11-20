import 'package:farmapk/helpers/format_data_to_json.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/pages/book_page.dart';
import 'package:farmapk/pages/inicio_page.dart';
import 'package:farmapk/pages/test_page.dart';
import 'package:farmapk/provider/data_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: DataFromJson.data.getDataJson(),
      builder: (BuildContext context, AsyncSnapshot<Data> snapshot) {
        if (!snapshot.hasData) {
          return Scaffold(
            body: Center(child: Container(color: Colors.white)),
          );
        }
        return Consumer<DataJsonPRovider>(
          builder: (context, data, child) {
            data.datajson = snapshot.data!;

            return DefaultTabController(
              length: 3,
              child: Scaffold(
                appBar: AppBar(
                  title: const Text('Bienvenido, a FarmApk'),
                  actions: [
                    IconButton(
                      onPressed: () => _showAlert(context),
                      icon: const Icon(Icons.more_vert_rounded),
                    )
                  ],
                  bottom: const TabBar(
                    indicatorColor: Colors.white,
                    tabs: [
                      Tab(icon: Icon(Icons.home)),
                      Tab(icon: Icon(Icons.book)),
                      Tab(icon: Icon(Icons.quiz)),
                    ],
                  ),
                ),
                body: TabBarView(
                  children: [
                    const InicioPage(),
                    const BooksPage(),
                    TestPage(dataTemas: data.datajson.temas),
                  ],
                ),
              ),
            );
          },
        );
      },
    );
  }

  _showAlert(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('FarmaApk'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: const [Text('FarmApk'), Text('')],
          ),
        );
      },
    );
  }
}
