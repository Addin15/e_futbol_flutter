import 'package:flutter/material.dart';

class Book extends StatefulWidget {
  const Book({Key? key}) : super(key: key);

  @override
  State<Book> createState() => _BookState();
}

class _BookState extends State<Book> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: <Widget>[
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                margin: EdgeInsets.only(top: 12),
                child: Column(children: <Widget>[
                  Container(
                    height: 50,
                    width: 500,
                    child: Card(
                      color: Colors.blue[800],
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.all(10.0),
                        child: Text(
                          "List of Book",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  TableCard(),
                ]),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class TableCard extends StatelessWidget {
  const TableCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2.0,
      child: Column(children: [
        Container(
          width: MediaQuery.of(context).size.width < 1300
              ? MediaQuery.of(context).size.width - 100
              : MediaQuery.of(context).size.width - 330,
          padding: EdgeInsets.only(bottom: 12),
          decoration: BoxDecoration(
              border: Border(bottom: BorderSide(width: 1, color: Colors.grey))),
          child: Table(
            columnWidths: <int, TableColumnWidth>{
              0: FixedColumnWidth((MediaQuery.of(context).size.width / 10)),
              1: FixedColumnWidth((MediaQuery.of(context).size.width / 10)),
              2: FixedColumnWidth((MediaQuery.of(context).size.width / 10)),
              3: FixedColumnWidth((MediaQuery.of(context).size.width / 10)),
              4: FixedColumnWidth((MediaQuery.of(context).size.width / 10)),
            },
            children: [
              TableRow(decoration: BoxDecoration(), children: [
                Container(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    "No.",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'HelveticaNeue',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    "Field Name",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'HelveticaNeue',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    "Refferee",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'HelveticaNeue',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    "Time",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'HelveticaNeue',
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  child: Text(
                    "Date",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'HelveticaNeue',
                    ),
                  ),
                )
              ]),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width < 1300
              ? MediaQuery.of(context).size.width - 100
              : MediaQuery.of(context).size.width - 330,
          // padding: EdgeInsets.all(32),
          child: Table(
              columnWidths: <int, TableColumnWidth>{
                0: FixedColumnWidth((MediaQuery.of(context).size.width / 10)),
                1: FixedColumnWidth((MediaQuery.of(context).size.width / 10)),
                2: FixedColumnWidth((MediaQuery.of(context).size.width / 10)),
                3: FixedColumnWidth((MediaQuery.of(context).size.width / 10)),
                4: FixedColumnWidth((MediaQuery.of(context).size.width / 10)),
              },
              children: List<TableRow>.generate(10, (i) {
                return TableRow(
                    decoration: BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(width: 0.5, color: Colors.grey))),
                    children: [
                      Container(
                        padding: EdgeInsets.all(18),
                        child: Text(
                          (i + 1).toString(),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(18),
                        child: Text(
                          "Padang Mega",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'HelveticaNeue',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(18),
                        child: Text(
                          "Provided",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'Raleway',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(18),
                        child: Text(
                          "21/12/2022",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'HelveticaNeue',
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.all(18),
                        child: Text(
                          "6:00 p.m.",
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontFamily: 'HelveticaNeue',
                          ),
                        ),
                      )
                    ]);
              })),
        ),
      ]),
    );
  }
}
