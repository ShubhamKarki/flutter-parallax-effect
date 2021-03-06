import 'package:flutter/material.dart';
import 'dart:math' as math;

class SlidingCard extends StatelessWidget {
  final String name;
  final String date;
  final String assetName;
  final double offset; //<-- How far is page from being displayed

  const SlidingCard(
      {Key key, this.name, this.date, this.assetName, this.offset})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double gauss = math.exp(-(math.pow((offset.abs() - 0.5), 2) /
        0.08)); //<--caluclate Gaussian function

    return Card(
      margin: EdgeInsets.only(left: 8, right: 8, bottom: 24),
      elevation: 8,
      color: Colors.amberAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(32),
      ),
      child: Column(
        children: [
          Container(
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(32),
              ),
              child: Image.asset(
                'assets/$assetName',
                height: MediaQuery.of(context).size.height * 0.3,
                alignment: Alignment(-offset.abs(), 0),
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Expanded(
            child: Transform.translate(
              offset: Offset(-32 * gauss * offset.sign, 0),
              child: CardContent(
                name: name,
                date: date,
                offset: gauss,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class CardContent extends StatelessWidget {
  final String name;
  final String date;
  final double offset;
  const CardContent({
    Key key,
    this.name,
    this.date,
    this.offset,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Transform.translate(
            offset: Offset(8 * offset, 0),
            child: Text(
              name ?? '',
              style: TextStyle(fontSize: 20),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Transform.translate(
            offset: Offset(32 * offset, 0),
            child: Text(
              date ?? '',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Spacer(),
          Row(
            children: [
              Transform.translate(
                offset: Offset(48 * offset, 0),
                child: RaisedButton(
                  onPressed: () {},
                  color: Color(0xFF162A49),
                  child: Transform.translate(
                      offset: Offset(24 * offset, 0), child: Text('Reserve')),
                  textColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(32),
                  ),
                ),
              ),
              Spacer(),
              Transform.translate(
                offset: Offset(32 * offset, 0),
                child: Text(
                  '0.00 \$',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0,
                  ),
                ),
              ),
              SizedBox(
                width: 16,
              )
            ],
          )
        ],
      ),
    );
  }
}
