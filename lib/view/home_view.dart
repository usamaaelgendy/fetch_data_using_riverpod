import 'package:fetch_data_using_riverpod/controller/data_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerWidget {
  const HomeView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context, watch) {
    final viewModel = watch(getDataFuture);
    return Scaffold(
      appBar: AppBar(
        title: Text('Fetch Data'),
      ),
      body: viewModel.listDataModel.isEmpty
          ? Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              itemCount: viewModel.listDataModel.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text(
                      viewModel.listDataModel[index].title,
                      style: TextStyle(fontSize: 16),
                    ),
                    subtitle: Text(
                      viewModel.listDataModel[index].body,
                      style: TextStyle(fontSize: 12),
                    ),
                    leading: Container(
                      alignment: Alignment.center,
                      width: 30,
                      height: 30,
                      decoration: BoxDecoration(
                          color: Colors.lightBlueAccent,
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        viewModel.listDataModel[index].id.toString(),
                      ),
                    ),
                  ),
                );
              },
            ),
    );
  }
}
