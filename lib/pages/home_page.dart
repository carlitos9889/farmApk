import 'package:farmapk/helpers/format_data_to_json.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/pages/book_page.dart';
import 'package:farmapk/pages/inicio_page.dart';
import 'package:farmapk/pages/test_page.dart';
import 'package:farmapk/provider/data_provider.dart';
import 'package:farmapk/widgets/start/header_txt_inicio.dart';
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
                    title: HeaderTxt(txtSmall: 'Bienvenido, a FarmApk'),
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
                      TestPage(dataTemas: data.datajson.temas)
                    ],
                  ),
                ));
          },
        );
      },
    );
  }
}
