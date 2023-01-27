import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class MyHomePage extends StatelessWidget {
  static const routeName = '/home';
  final Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text("Chat History"),
      ),
      drawer: Drawer(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              alignment: Alignment.bottomLeft,
              color: Colors.redAccent,
              width: double.infinity,
              height: 120,
              child: const Text(
                "Options Menu",
                style: TextStyle(
                    fontSize: 24,
                    color: Colors.white),
              )
            ),
            const SizedBox(
              height: 10
            ),
            ListTile(
              onTap: () => Navigator.of(context).pushNamed(MyHomePage.routeName),
              leading: Icon(Icons.home),
              title: const Text("Home")
            ),
            ListTile(
              onTap: () {} ,
              leading: Icon(Icons.settings),
              title: const Text("Settings"),
            ),
            ListTile(
              onTap: () {},
              leading: Icon(Icons.logout),
              title: const Text("Logout")
            )
        ],
        ),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(15),
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
            String name = faker.person.name();
            return Dismissible(
              key: Key(index.toString()),
              direction: DismissDirection.startToEnd,
              confirmDismiss: (direction) {
                return showDialog(context: context, builder: (context){
                  return AlertDialog(
                    title: Text("Confirmation"),
                    content: Text("Are you sure you want to delete item?"),
                    actions: [
                      ElevatedButton(
                          onPressed: (){
                            Navigator.of(context).pop(false);
                          },
                          child: Text("No")
                      ),
                      ElevatedButton(
                          onPressed: () {
                            Navigator.of(context).pop(true);
                          },
                          child: Text("Yes")
                      )
                    ],
                  );
                }
                );
              } ,
              background: Container(
                alignment: Alignment.centerLeft,
                color: Colors.red,
                padding: EdgeInsets.only(right: 10),
                child: Icon(
                    Icons.delete,
                    color: Colors.white,
                    size: 25),
              ),
              child: ListTile(
                onLongPress: () {

                },
                title: Text(name),
                leading: CircleAvatar(
                  backgroundColor: Colors.redAccent,
                  child: Text(
                    name.trim().split(' ').map((l) => l[0]).take(2).join(),
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                subtitle: Text(faker.lorem.sentence()),
              )
            );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("Telah diklik");
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
                title: const Text("Confirm"),
                content: const Text("Are you sure to delete this:"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text("Yes")
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text("No"),
                  ),
                ]
            ),
          );
        },
        child: const Icon(Icons.delete),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}