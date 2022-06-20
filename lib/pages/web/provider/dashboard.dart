import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:sizer/sizer.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      primary: false,
      padding: const EdgeInsets.all(80),
      crossAxisSpacing: 20,
      mainAxisSpacing: 20,
      crossAxisCount: 3,
      children: <Widget>[
        GestureDetector(
          onTap: () => setState(() {}),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlue[100],
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  "Arena Details",
                  style: TextStyle(
                    fontFamily: "Reem Kufi",
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset('icon/arenaicon.png'),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {}),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlue[200],
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  "Field Details",
                  style: TextStyle(
                    fontFamily: "Reem Kufi",
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset('icon/fieldicon.png'),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {}),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlue[300],
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  "Booking Details",
                  style: TextStyle(
                    fontFamily: "Reem Kufi",
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset('icon/bookingicon.png'),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {}),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlue[100],
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  "User Details",
                  style: TextStyle(
                    fontFamily: "Reem Kufi",
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset('icon/usericon.png'),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => setState(() {}),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlue[200],
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  "Edit Profile",
                  style: TextStyle(
                    fontFamily: "Reem Kufi",
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset('icon/editicon.png'),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () => ({}),
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.lightBlue[300],
            ),
            padding: const EdgeInsets.all(10),
            child: Column(
              children: [
                const Text(
                  "Total Sales",
                  style: TextStyle(
                    fontFamily: "Reem Kufi",
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: Image.asset('icon/totalsalesicon.png'),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
