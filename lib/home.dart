import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';

// Widgets
import 'exercise_card.dart';
import 'exercise_tile.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var excercises = [];

  List<Widget> buildContent() {
    List<Widget> content = List();
    content.add(Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Text(
            'Popular',
            style: TextStyle(
              color: Colors.grey[800],
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          Text(
            'View All',
            style: TextStyle(
              color: Colors.lightBlue,
            ),
          ),
        ],
      ),
    ));
    excercises.forEach((exercise) {
      content.add(ExerciseTile(
        exercise: exercise,
      ));
      content.add(Divider(indent: 100));
    });

    return content;
  }

  Future fetchExerciseData() async {
    print('Fetching data.');
    var response = await http.get('https://reqres.in/api/users?page=2');
    if (response.statusCode == 200) {
      return json.decode(response.body)['data'];
    } else {
      print('Error fetching data.');

      return null;
    }
  }

  @override
  void didChangeDependencies() async {
    super.didChangeDependencies();

    while (excercises == null) {
      excercises = await fetchExerciseData();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.grey[100],
            centerTitle: false,
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Friday, July 3',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 16,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                Text(
                  'Date',
                  style: TextStyle(
                    color: Colors.grey[800],
                    fontSize: 35,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ],
            ),
            bottom: PreferredSize(
              preferredSize: Size(double.infinity, 400),
              child: Container(
                height: 400,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return ExerciseCard(index);
                  },
                ),
              ),
            ),
          ),
          excercises == null
              ? SliverToBoxAdapter(
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                )
              : SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  sliver: SliverList(
                    delegate: SliverChildListDelegate(buildContent()),
                  ),
                ),
        ],
      ),
    );
  }
}
