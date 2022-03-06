import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../model/person.dart';
import '../services/person_network_services.dart';

class HomeScreen extends StatelessWidget {
 PersonNetworkService personService = PersonNetworkService();
 var currentPerson;
  HomeScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
      ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(
                "https://www.pixsy.com/wp-content/uploads/2021/04/ben-sweet-2LowviVHZ-E-unsplash-1.jpeg",
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: FutureBuilder(
              future: personService.fetchPersons(55),
              builder:
              (BuildContext,  AsyncSnapshot<List<Person>> snapshot){
                if (snapshot.hasData){
                  return
                      Row(
                        children: <Widget>[
                          Expanded(
                              child: Container(
                                child:Card(
                                  color: Colors.black.withOpacity(0.5),
                                  child: ListView.builder(
                                      itemCount: snapshot.data?.length,
                                      itemBuilder: ( context, int index){
                                         currentPerson = snapshot.data![index];
                                        return ListTile(
                                          title: Column(
                                            children: [
                                              Text('${currentPerson.name}',) ,
                                              Text(
                                                  "Phone :  ${currentPerson.phoneNUmber}",),
                                            ],
                                          ),
                                          leading: CircleAvatar(
                                            backgroundImage: NetworkImage("${currentPerson.imageUrl}",),
                                          ),
                                        );
                                      }),
                                ) ,
                          ))
                         ],
                      );
                }
                if (snapshot.hasError){
                  return const Center(
                    child: Icon(
                      Icons.error
                    ),);

                }
                return Center(
                  child: Column(
                    children: const [
                      CircularProgressIndicator(),
                      SizedBox(
                      height:20,
                      ),
                    Text('loanding')
                ],
                ));
              },
            ),

          ),
        ),
    );
  }
}
