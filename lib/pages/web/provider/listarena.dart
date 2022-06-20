import 'package:flutter/material.dart';


class ListArena extends StatefulWidget {
  const ListArena({ Key? key }) : super(key: key);

  @override
  State<ListArena> createState() => _ListArenaState();
}

class _ListArenaState extends State<ListArena> {
  @override
  Widget build(BuildContext context) {
        return DataTable(
      columns: const <DataColumn>[
        DataColumn(
          label: Text(
            'Field Name',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Grass Type',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
        DataColumn(
          label: Text(
            'Number light',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
         DataColumn(
          label: Text(
            'Subs bench',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
         DataColumn(
          label: Text(
            'Day Price',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
         DataColumn(
          label: Text(
            'Night Price',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
         DataColumn(
          label: Text(
            'Referee',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
         DataColumn(
          label: Text(
            'Spectators seat',
            style: TextStyle(fontStyle: FontStyle.italic),
          ),
        ),
      ],
      rows: const <DataRow>[
        DataRow(
          cells: <DataCell>[
            DataCell(Text('Ahmad')),
            DataCell(Text('Nth')),
            DataCell(Text('2')),
            DataCell(Text('4')),
            DataCell(Text('50')),
            DataCell(Text('70')),
            DataCell(Text('2')),
            DataCell(Text('1')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
         DataCell(Text('Ali')),
            DataCell(Text('Bit')),
            DataCell(Text('1')),
            DataCell(Text('3')),
            DataCell(Text('60')),
            DataCell(Text('80')),
            DataCell(Text('2')),
            DataCell(Text('1')),
          ],
        ),
        DataRow(
          cells: <DataCell>[
               DataCell(Text('Aaaad')),
            DataCell(Text('Nthaaa')),
            DataCell(Text('2')),
            DataCell(Text('4')),
            DataCell(Text('50')),
            DataCell(Text('70')),
            DataCell(Text('2')),
            DataCell(Text('1')),
          ],
        ),
      ],
    );
  }
}