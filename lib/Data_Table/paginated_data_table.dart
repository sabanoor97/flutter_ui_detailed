import 'package:flutter/material.dart';

class PaginatedDataDemo extends StatefulWidget {
  @override
  _PaginatedDataDemoState createState() => _PaginatedDataDemoState();
}

class _PaginatedDataDemoState extends State<PaginatedDataDemo> {
  int _rowsPerPage = PaginatedDataTable.defaultRowsPerPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Paginated Data Table"),
      backgroundColor: Colors.cyan,  
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: PaginatedDataTable(
        //header: Text("Flutter Data Table ", textAlign: TextAlign.center,),
        rowsPerPage: _rowsPerPage,
        availableRowsPerPage: [2, 5, 10],
        onRowsPerPageChanged: (int value) {
          setState(() {
            _rowsPerPage = value;
          });
        },
        columns: kTableColumns,
        source: FlutterDataSource(),
      )),
    );
  }
}

//creating columns
const kTableColumns = <DataColumn>[
  DataColumn(
      label: const Text("Desserts"),
      numeric: true,
      tooltip: "The ammount of happiness in events"),
  DataColumn(
      label: const Text("Calories"),
      tooltip: "The ammount of energy in given food quantity",
      numeric: true),
  DataColumn(label: const Text("Fat"), numeric: true),
  DataColumn(label: const Text("Carbs"), numeric: true),
  DataColumn(label: const Text("Protein"), numeric: true),
  DataColumn(label: const Text("sodium"), numeric: true),
  DataColumn(label: const Text("Calcium"), numeric: true),
  DataColumn(label: const Text("Iron"), numeric: true),
];

//initializing values
class Dessert {
  String name;
  int calories;
  double fat;
  int carbs;
  double protein;
  int sodium;
  int calcium;
  int iron;
  bool selected = false;

  Dessert(this.name, this.calories, this.fat, this.carbs, this.protein,
      this.sodium, this.calcium, this.iron);
}

class FlutterDataSource extends DataTableSource {
  //first we initialize data selected counts
  int _dataSelectedCounts = 0;

  //creating list of data to put in columns

  List<Dessert> _listOfData = <Dessert>[
    new Dessert('Frozen yogurt', 159, 6.0, 24, 4.0, 87, 14, 1),
    new Dessert('Ice cream sandwich', 237, 9.0, 37, 4.3, 129, 8, 1),
    new Dessert('Eclair', 262, 16.0, 24, 6.0, 337, 6, 7),
    new Dessert('Cupcake', 305, 3.7, 67, 4.3, 413, 3, 8),
    new Dessert('Gingerbread', 356, 16.0, 49, 3.9, 327, 7, 16),
    new Dessert('Jelly bean', 375, 0.0, 94, 0.0, 50, 0, 0),
    new Dessert('Lollipop', 392, 0.2, 98, 0.0, 38, 0, 2),
    new Dessert('Honeycomb', 408, 3.2, 87, 6.5, 562, 0, 45),
    new Dessert('Donut', 452, 25.0, 51, 4.9, 326, 2, 22),
    new Dessert('KitKat', 518, 26.0, 65, 7.0, 54, 12, 6),
    new Dessert('Frozen yogurt with sugar', 168, 6.0, 26, 4.0, 87, 14, 1),
    new Dessert('Ice cream sandwich with sugar', 246, 9.0, 39, 4.3, 129, 8, 1),
    new Dessert('Eclair with sugar', 271, 16.0, 26, 6.0, 337, 6, 7),
    new Dessert('Cupcake with sugar', 314, 3.7, 69, 4.3, 413, 3, 8),
    new Dessert('Gingerbread with sugar', 345, 16.0, 51, 3.9, 327, 7, 16),
    new Dessert('Jelly bean with sugar', 364, 0.0, 96, 0.0, 50, 0, 0),
    new Dessert('Lollipop with sugar', 401, 0.2, 100, 0.0, 38, 0, 2),
  ];

  //adding functionality of rows
  @override
  DataRow getRow(int index) {
    assert(index >= 0);

    if (index >= _listOfData.length) return null;
    //getting index
    final Dessert dessert = _listOfData[index];
    return DataRow.byIndex(
        index: index,
        selected: dessert.selected,
        onSelectChanged: (bool value) {
          if (dessert.selected != value) {
            _dataSelectedCounts += value ? 1 : -1;
            assert(_dataSelectedCounts > 0);
            dessert.selected = value;
            notifyListeners();
          }
        },
        cells: <DataCell>[
          DataCell(Text("${dessert.name}")),
          DataCell(Text("${dessert.calories}")),
          DataCell(Text("${dessert.fat}")),
          DataCell(Text("${dessert.carbs}")),
          DataCell(Text("${dessert.protein}")),
          DataCell(Text("${dessert.sodium}")),
          DataCell(Text("${dessert.calcium}")),
          DataCell(Text("${dessert.iron}")),
        ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _listOfData.length;

  @override
  int get selectedRowCount => _dataSelectedCounts;
}