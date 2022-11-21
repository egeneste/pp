import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CloudProjects extends StatelessWidget {
  const CloudProjects({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List of Locally Saved Projects'),
      ),
      body: Center(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(
                        margin: const EdgeInsets.all(15),
                        padding: const EdgeInsets.all(15),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(width: 2.0, color: Colors.black),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Column(
                          children: [
                            const Center(
                              child: Text("Projects"),
                            ),
                            Expanded(
                              child: ListView.builder(
                                  //itemCount: pjsProvider.projects.length,//context.select((Projects pj) => pj.projects.length),
                                  itemBuilder: (context, index) {
                                    return Card(
                                      //color: Colors.brown.shade100,
                                      child: ListTile(
                                        leading: Checkbox(
                                          //activeColor: Colors.blueGrey,
                                          fillColor: MaterialStateProperty.all(
                                              Colors.blueGrey),
                                          checkColor: Colors.white,
                                          value: true,
                                          onChanged: (value) {

                                          },
                                        ),
                                        title: Text(
                                          'pjsProvider.projects[index].id',
                                          style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 18.0,
                                              color: Colors.blueGrey),
                                        ),
                                        trailing: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            TextButton.icon(
                                              onPressed: () {


                                              },
                                              icon:
                                              const Icon(Icons.open_in_new),
                                              label: const Text('Open'),
                                            ),
                                            TextButton.icon(
                                              onPressed: () {
                                                // setState(() {
                                                //   Project p = Project.copy(pjsProvider.projects[index]);
                                                //   pjsProvider.addProject(p);
                                                // });


                                                //Navigator.pop(context);
                                              },
                                              icon: const Icon(Icons.copy),
                                              label: const Text('Copy'),
                                            ),
                                            TextButton.icon(
                                              style: ButtonStyle(
                                                backgroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.red),
                                                foregroundColor:
                                                MaterialStateProperty.all(
                                                    Colors.white),
                                              ),
                                              onPressed: () {

                                              },
                                              icon: const Icon(Icons.delete),
                                              label: const Text('Delete'),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  }),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Card(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [

                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
      ),
    );
  }
}
