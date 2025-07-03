import 'package:flutter/material.dart';

class Festiveshop extends StatelessWidget {
  const Festiveshop({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 180, 31, 31),
        title: const Text(
          "hfhb",
          style: TextStyle(color: Colors.yellow),
        ),
      ),
      drawer: const Drawer(),
      endDrawer: const Drawer(),
      body: Column(children: [
        Container(
          height: 200,
          width: 200,
          color: const Color.fromARGB(255, 255, 0, 170),
        ),
        Center(
          child: Container(
            height: 200,
            width: 200,
            color: const Color.fromARGB(255, 230, 230, 230),
          ),
        ),
        // Container(
        //   child: SizedBox(
        //     width: 300,
        //     height: 100,
        //     child: ElevatedButton(
        //       style: ElevatedButton.styleFrom(
        //           shape: RoundedRectangleBorder(
        //               borderRadius: BorderRadius.circular(15))),
        //       child: const Text(
        //         'Go to second Screen',
        //         style: TextStyle(fontSize: 20),
        //       ),
        //       onPressed: () {
        //         Navigator.push(
        //             context,
        //             MaterialPageRoute(
        //                 builder: (context) => const SecondScreen()));
        //       },
        //     ),
        //   ),
        // ),
      ]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            // ignore: avoid_print
            print("The button is clickded");
          },
          child: const Icon(Icons.favorite, color: Colors.red)),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(
          icon: Icon(Icons.verified_user, color: Colors.green),
          label: "Account",
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.account_balance), label: "Balence")
      ]),
    );
  }
}
