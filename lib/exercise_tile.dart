import 'package:flutter/material.dart';

class ExerciseTile extends StatelessWidget {
  final exercise;
  const ExerciseTile({this.exercise});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: GestureDetector(
        onTap: () {
          showBottomSheet(
            context: context,
            builder: (context) => Material(
              color: Colors.blue,
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(30),
              ),
              child: Container(
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.redAccent,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(30),
                  ),
                ),
                child: Center(
                  child: Text('Hello'),
                ),
              ),
            ),
          );
        },
        child: Row(
          children: <Widget>[
            Material(
              elevation: 3,
              borderRadius: BorderRadius.circular(27),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(27),
                child: Image.network('https://picsum.photos/seed/picsum/75'),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Crunch',
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '3 sets of 20 reps',
                      style: TextStyle(
                        color: Colors.grey[400],
                        fontWeight: FontWeight.w500,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Chip(
              backgroundColor: Color(0xFFFEEAEE),
              labelPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 1),
              label: Text(
                '\$20',
                style: TextStyle(
                  color: Color(0xFFFF4c6c),
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
