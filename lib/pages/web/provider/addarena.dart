import 'package:e_futbol_flutter/pages/web/provider/home_provider.dart';
import 'package:flutter/material.dart';

class AddArena extends StatefulWidget {
  const AddArena({ Key? key }) : super(key: key);

  @override
  State<AddArena> createState() => _AddArenaState();
}

class _AddArenaState extends State<AddArena> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
              children: <Widget>[
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                // adjust container position
                crossAxisAlignment: CrossAxisAlignment.center,
                // fill cross axis
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center, //tu center Row
  
                  ),
                  SizedBox(width: 20, height: 20),
                  SizedBox(
                    height: 60,
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Field Name',
                      ),
                    ),
                  ),
                  SizedBox(width: 20, height: 20),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Grass Type',
                      ),
                    ),
                  ),
                                    SizedBox(width: 20, height: 20),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Number light',
                      ),
                    ),
                  ),
                                    SizedBox(width: 20, height: 20),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Subs bench',
                      ),
                    ),
                  ),
                                    SizedBox(width: 20, height: 20),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Day price',
                      ),
                    ),
                  ),
                                    SizedBox(width: 20, height: 20),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Night Price',
                      ),
                    ),
                  ),
                                    SizedBox(width: 20, height: 20),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Referee',
                      ),
                    ),
                  ),
                                    SizedBox(width: 20, height: 20),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: TextFormField(
                      decoration: InputDecoration(
                        border: UnderlineInputBorder(),
                        hintText: 'Spectators seat',
                      ),
                    ),
                  ),
                  SizedBox(width: 20, height: 20),
                  SizedBox(
                    height: 50,
                    width: 300,
                    child: ElevatedButton(
                      child: Text("Add new field"),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        primary: Colors.lightBlue,
                        onPrimary: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
                ],
              ),
            );
  }
}