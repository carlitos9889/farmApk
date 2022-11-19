import 'package:animate_do/animate_do.dart';
import 'package:auto_route/auto_route.dart';
// import 'package:auto_route/auto_route.dart';
import 'package:farmapk/delegate/search_delegate.dart';
import 'package:farmapk/helpers/format_data_to_json.dart';
import 'package:farmapk/models/data_json.dart';
import 'package:farmapk/provider/data_provider.dart';
import 'package:farmapk/routes/routes.gr.dart';
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
            return AutoTabsRouter.tabBar(
                routes: [
                  const InicioRoute(),
                  const BooksRoute(),
                  TestRoute(dataTemas: data.datajson.temas)
                ],
                builder: (_, child, controller) {
                  return Scaffold(
                    appBar: AppBar(
                      title: const Text('Bienvenido, a FarmApk'),
                      bottom: TabBar(
                        indicatorColor: Colors.white,
                        controller: controller,
                        tabs: const [
                          Tab(icon: Icon(Icons.home)),
                          Tab(icon: Icon(Icons.book)),
                          Tab(icon: Icon(Icons.quiz)),
                        ],
                      ),
                    ),
                    body: child,
                    floatingActionButton: FadeInUpBig(
                      child: FloatingActionButton(
                        tooltip: 'Buscar Medicamentos',
                        backgroundColor: const Color(0xff8CC63E),
                        onPressed: () => showSearch(
                            context: context, delegate: SearchMedicamentos()),
                        child: const Icon(Icons.search),
                      ),
                    ),
                  );
                });
          },
        );
      },
    );
  }
}
