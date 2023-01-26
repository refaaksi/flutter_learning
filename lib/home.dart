import 'package:flutter/material.dart';
import 'package:faker/faker.dart';

class MyHomePage extends StatelessWidget {
  final Faker faker = Faker();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Chat History"),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(15),
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) {
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
                leading: CircleAvatar(),
                title: Text(faker.person.name()),
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