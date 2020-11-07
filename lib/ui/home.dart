import 'dart:math';
import 'package:first_flutter_app/model/movie.dart';
import 'package:flutter/material.dart';
import 'dart:async';

class ScaffoldExample extends StatelessWidget {
  Random rand = new Random();
  double opacity = 0;
  int red = 0;
  int green = 0;
  int blue = 0;

  _tapButton() {
    opacity += rand.nextDouble();
    red += rand.nextInt(2);
    green += rand.nextInt(2);
    blue += rand.nextInt(2);
    debugPrint("tapped");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scaffold"),
        backgroundColor: Color.fromRGBO(red, green, blue, opacity),
        actions: [
          IconButton(
              icon: Icon(Icons.ac_unit),
              onPressed: () {
                _tapButton();
              })
        ],
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.amber,
          child: Text("a"),
          onPressed: () => _tapButton()),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.access_alarm), title: Text("alarm")),
          BottomNavigationBarItem(
              icon: Icon(Icons.accessible), title: Text("chair"))
        ],
        onTap: (int index) => debugPrint("page ${index + 1}"),
      ),
      backgroundColor: Colors.deepPurpleAccent,
      body: Container(
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CustomButton()
            //         InkWell(
            //           child: Text("Tap Me!",
            //             style: TextStyle(
            //             fontWeight: FontWeight.w500,
            //             fontSize: 23.4,
            //           ),),
            //           onTap: () {
            //             _tapButton();
            //           }
            //
            // )
          ],
        ),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  Random rand = new Random();
  double opacity = 100.0;
  int red = 0;
  int green = 0;
  int blue = 0;

  _tapButton() {
    red = rand.nextInt(256);
    green = rand.nextInt(256);
    blue = rand.nextInt(256);
    debugPrint("$red");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _tapButton();
        SnackBar snackBar = SnackBar(
          content: Text("Hello Again!"),
          backgroundColor: Color.fromRGBO(red, green, blue, opacity),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Container(
        padding: EdgeInsets.all(20.0),
        decoration: BoxDecoration(
            color: Color.fromRGBO(red, green, blue, 100),
            borderRadius: BorderRadius.circular(34.0)),
        child: Text("Button"),
      ),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.red,
      child: Center(
          child: Text(
        "Hello Flutter!",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 23.4,
        ),
      )),
    );
  }
}

class BizCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("BizCard"),
          backgroundColor: Colors.lightBlue,
        ),
        body: Container(
          alignment: Alignment.center,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[_getCard()],
          ),
        ));
  }

  Container _getCard() {
    return Container(
      width: 350,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Colors.redAccent,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text("Tarun Dorairaj"),
          Text("1234567890"),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(Icons.email),
              Text("tarundorairaj@gmail.com")
            ],
          )
        ],
      ),
    );
  }
}

class Wisdom extends StatefulWidget {
  @override
  _WisdomState createState() => _WisdomState();
}

class _WisdomState extends State<Wisdom> {
  Random rand = new Random();
  List quotes = [
    "quote 1",
    "quote 2",
    "quote 3",
    "quote 4",
    "quote 5",
    "quote 6",
    "quote 7",
    "quote 8",
    "quote 9",
    "quote 10",
    "quote 11",
    "quote 12",
    "quote 13",
    "quote 14",
    "quote 15"
  ];

  int _quoteIndex = 0;

  int red = 255;
  int green = 255;
  int blue = 255;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(
          rand.nextInt(256), rand.nextInt(256), rand.nextInt(256), 1.0),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Center(
                child: Container(
                    width: 350,
                    height: 200,
                    margin: EdgeInsets.all(30.0),
                    decoration: BoxDecoration(
                        color: Color.fromRGBO(rand.nextInt(256),
                            rand.nextInt(256), rand.nextInt(256), 1.0),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Center(
                        child: Text(
                      quotes[_quoteIndex],
                      style: TextStyle(
                          color: Color.fromRGBO(rand.nextInt(256),
                              rand.nextInt(256), rand.nextInt(256), 1.0)),
                    ))),
              ),
            ),
            Divider(
              thickness: 4.0,
              color: Color.fromRGBO(
                  rand.nextInt(256), rand.nextInt(256), rand.nextInt(256), 1.0),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: FlatButton.icon(
                color: Color.fromRGBO(rand.nextInt(256), rand.nextInt(256),
                    rand.nextInt(256), 1.0),
                onPressed: _showQuote,
                icon: Icon(Icons.refresh),
                label: Text(
                  "New quote",
                  style: TextStyle(
                      color: Color.fromRGBO(rand.nextInt(256),
                          rand.nextInt(256), rand.nextInt(256), 1.0)),
                ),
              ),
            ),
            Spacer()
          ],
        ),
      ),
    );
  }

  void _showQuote() {
    setState(() {
      _quoteIndex = rand.nextInt(quotes.length);
      red = rand.nextInt(256);
      green = rand.nextInt(256);
      blue = rand.nextInt(256);
    });
  }
}

class TipCalculator extends StatefulWidget {
  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  int _tipPercentage = 0;
  double _bill = 0.0;
  int _numOfPeople = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin:
              EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.1),
          child: ListView(
            padding: EdgeInsets.all(20.5),
            children: <Widget>[
              Container(
                width: 300,
                height: 175,
                decoration: BoxDecoration(
                    color: Color.fromRGBO(105, 8, 214, 0.1),
                    borderRadius: BorderRadius.circular(20.0)),
                child: Center(
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Total Per Person",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15.0,
                              color: Color.fromRGBO(105, 8, 214, 1)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            "\$${(_bill * (1.0 + _tipPercentage / 100.0) / _numOfPeople).toStringAsFixed(2)}",
                            style: TextStyle(
                                fontSize: 34.9,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(105, 8, 214, 1)),
                          ),
                        )
                      ]),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                padding: EdgeInsets.all(12.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    border: Border.all(
                        color: Colors.blueGrey.shade100,
                        style: BorderStyle.solid)),
                child: Column(
                  children: <Widget>[
                    TextField(
                      keyboardType:
                          TextInputType.numberWithOptions(decimal: true),
                      style: TextStyle(color: Color.fromRGBO(105, 8, 214, 1)),
                      decoration: InputDecoration(
                          prefixText: "bill",
                          prefixIcon: Icon(Icons.attach_money)),
                      onChanged: (String value) {
                        try {
                          _bill = double.parse(value);
                        } catch (exception) {
                          _bill = 0.0;
                        }
                      },
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            "Split ",
                            style: TextStyle(color: Colors.grey.shade700),
                          ),
                          Row(
                            children: <Widget>[
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    if (_numOfPeople > 1) {
                                      _numOfPeople--;
                                    }
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Color.fromRGBO(105, 8, 214, 0.1)),
                                  child: Center(
                                    child: Text(
                                      "-",
                                      style: TextStyle(
                                          color: Color.fromRGBO(105, 8, 214, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0),
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                "$_numOfPeople",
                                style: TextStyle(
                                    color: Color.fromRGBO(105, 8, 214, 1),
                                    fontWeight: FontWeight.bold,
                                    fontSize: 17.0),
                              ),
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    _numOfPeople++;
                                  });
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  margin: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7.0),
                                      color: Color.fromRGBO(105, 8, 214, 0.1)),
                                  child: Center(
                                    child: Text(
                                      "+",
                                      style: TextStyle(
                                          color: Color.fromRGBO(105, 8, 214, 1),
                                          fontWeight: FontWeight.bold,
                                          fontSize: 17.0),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ]),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          "Tip ",
                          style: TextStyle(color: Colors.grey.shade700),
                        ),
                        Text(
                          "\$${(_bill * _tipPercentage / 100.0).toStringAsFixed(2)}",
                          style: TextStyle(
                              color: Color.fromRGBO(105, 8, 214, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                      ],
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "$_tipPercentage%",
                          style: TextStyle(
                              color: Color.fromRGBO(105, 8, 214, 1),
                              fontWeight: FontWeight.bold,
                              fontSize: 17.0),
                        ),
                        Slider(
                            min: 0,
                            max: 100,
                            activeColor: Color.fromRGBO(105, 8, 214, 1),
                            inactiveColor: Colors.grey,
                            divisions: 10,
                            value: _tipPercentage.toDouble(),
                            onChanged: (double value) {
                              setState(() {
                                _tipPercentage = value.round();
                              });
                            })
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class QuizApp extends StatefulWidget {
  @override
  _QuizAppState createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class NewApp extends StatefulWidget {
  @override
  _NewAppState createState() => _NewAppState();
}

class _NewAppState extends State<NewApp> {
  double x = 10.0;
  double y = 20.0;
  bool xPressed = false;
  bool negXPressed = false;
  bool yPressed = false;
  bool negYPressed = false;
  int topY = -1;
  int leftX = 0;
  int bottomY = -1;
  int rightX = 0;
  final int SQUARE_SIZE = 30;
  final int BOX_SIZE = 10;


  List<List<List<bool>>> maze = [
    [[true, true, false, false], [true, false, false, true], [true, false, false, false], [true, false, true, false], [false, true, false, false], [true, false, true, false], [true, true, false, false], [true, false, false, true], [true, false, true, false] ,[true, true, true, false]],
    [[false, true, true, false], [true, true, false, false], [false, false, true, true], [false, true, false, true], [false, false, true, true], [false, true, true, false], [false, true, false, false], [true, false, true, true], [false, true, true, false] ,[false, true, true, false]],
    [[false, true, true, false], [false, true, false, true], [true, false, false, true], [true, false, true, false], [true, true, true, false], [false, true, true, false], [false, true, false, false], [true, false, true, false], [false, true, false, true] ,[false, false, true, false]],
    [[false, true, true, false], [true, true, false, false], [true, false, true, false], [false, true, false, true], [false, false, true, false], [false, true, false, false], [false, false, true, true], [false, true, false, true], [true, false, true, false] ,[false, true, true, false]],
    [[false, true, false, false], [false, false, true, true], [false, true, true, false], [true, true, false, true], [false, false, true, true], [false, true, false, true], [true, false, true, true], [true, true, false, false], [false, false, true, true] ,[false, true, true, false]],
    [[false, true, true, false], [true, true, true, false], [false, true, true, false], [true, true, false, false], [true, false, false, true], [true, false, false, true], [true, false, false, false], [false, false, false, false], [true, false, false, false] ,[false, false, true, true]],
    [[false, true, true, false], [false, true, false, true], [false, false, true, true], [false, true, true, false], [true, true, true, false], [true, true, false, false], [false, false, true, true], [false, true, true, false], [false, true, false, true] ,[true, false, true, false]],
    [[false, true, false, true], [true, false, false, false], [true, false, false, true], [false, false, true, true], [false, true, true, false], [false, true, true, false], [true, true, true, false], [false, true, false, true], [true, false, true, false] ,[false, true, true, false]],
    [[true, true, true, false], [false, true, true, false], [true, true, false, false], [true, false, true, false], [false, true, true, false], [false, true, true, false], [false, true, true, false], [true, true, false, false], [false, false, true, true] ,[false, true, true, false]],
    [[false, true, false, true], [false, false, false, true], [false, false, true, true], [false, true, false, true], [false, false, true, true], [false, true, true, false], [false, true, false, true], [false, false, true, true], [true, true, false, true] ,[false, false, true, true]]
  ];

  void increaseSize() async {
    while (xPressed) {
      setState(() {
        if (x < 299 && topY >= 0 && bottomY >= 0) {
          if((x+BOX_SIZE) % SQUARE_SIZE != 0 || (!maze[topY][rightX][2] && !maze[bottomY][rightX][2]) && (topY == bottomY || rightX >= BOX_SIZE - 1 || !maze[topY][rightX + 1][3]))
          {
            x++;
            leftX = (x/SQUARE_SIZE - 0.5).round();
            rightX = ((x+BOX_SIZE - 1)/SQUARE_SIZE - 0.5).round();
          }
        } else if(topY < 0 && x < 299 && (topY == bottomY || rightX >= BOX_SIZE - 1 || !maze[bottomY][leftX + 1][0])) {
          x++;
          leftX = (x/SQUARE_SIZE - 0.5).round();
          rightX = ((x+BOX_SIZE - 1)/SQUARE_SIZE - 0.5).round();
        } else {
          x = 300;
        }
      });
      await Future.delayed(Duration(milliseconds: 5));
    }
  }

  void decreaseSize() async {
    while (negXPressed) {
      setState(() {
        if (x >= 1 && topY >= 0 && bottomY >= 0) {
          if((x) % 30 != 0 || (!maze[topY][leftX][1] && !maze[bottomY][leftX][1]) && (topY == bottomY || leftX <= 0 || !maze[topY][leftX - 1][3]))
          {
            x--;
            leftX = (x/SQUARE_SIZE - 0.49).round();
            rightX = ((x+BOX_SIZE - 1)/SQUARE_SIZE - 0.5).round();
          }
        } else if(topY < 0 && x >= 1 && (topY == bottomY || leftX <= 0 || !maze[bottomY][leftX - 1][0])) {
          x--;
          leftX = (x/SQUARE_SIZE - 0.49).round();
          rightX = ((x+BOX_SIZE - 1)/SQUARE_SIZE - 0.5).round();
        } else {
          x = 0;
        }
      });
      await Future.delayed(Duration(milliseconds: 5));
    }
  }

  void increaseYSize() async {
    while (yPressed) {
      setState(() {
        if (y < 333 && bottomY >= 0) {
          if((y - 34) % 30 != 0 || (!maze[bottomY][leftX][3] && !maze[bottomY][rightX][3] && (leftX == rightX || bottomY >= maze.length || !maze[bottomY + 1][leftX][2])))
            {
              y++;
              bottomY = ((y - 35)/30 - 0.5).round();
              topY = ((y - 44)/30 - 0.5).round();
            }
        } else if(bottomY < 0)
          {
            if((y - 34) % 30 != 0 || (!maze[0][leftX][0] && !maze[0][rightX][0]))
            {
              y++;
              bottomY = ((y - 35)/30 - 0.5).round();
              topY = ((y - 44)/30 - 0.5).round();
            }
          }
        else {
          y = 334;
        }
      });
      await Future.delayed(Duration(milliseconds: 5));
    }
  }

  void decreaseYSize() async {
    while (negYPressed) {
      setState(() {
        if (y >= 1 && bottomY < 10 && topY >= 0) {
          if((y - 45) % 30 != 0 || (!maze[topY][leftX][0] && !maze[topY][rightX][0]) && (leftX == rightX || topY < 0 || !maze[topY - 1][leftX][2]))
          {
            y--;
            bottomY = ((y - 35)/30 - 0.5).round();
            topY = ((y - 44)/30 - 0.5).round();
          }
        } else if(bottomY >= 10)
        {
          if((y - 44) % 30 != 0 || (!maze[9][leftX][3] && !maze[9][rightX][3]))
          {
            y--;
            bottomY = ((y - 35)/30 - 0.49).round();
            topY = ((y - 44)/30 - 0.49).round();
          }
        } else if(topY < 0 && y >= 1)
          {
            y--;
            bottomY = ((y - 35)/30 - 0.49).round();
            topY = ((y - 44)/30 - 0.49).round();
          } else {
          y = 0;
          topY = -1;
          bottomY = -1;
        }
      });
      await Future.delayed(Duration(milliseconds: 5));
    }
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 10.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text("Maze"),
                  Stack(
                    children: <Widget>[
                      mazeBoxes(maze, context),
                      Container(
                        height: 344.0,
                        width: 310.0,
                        // decoration: BoxDecoration(
                        //   image: DecorationImage(
                        //       image: AssetImage("images/maze.png")),
                        // ),
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: BoxDecoration(
                            color: Color.fromRGBO(
                                x.round(), y.round(), ((x + y)).round(), 1.0),
                          ),
                        ),
                        padding: EdgeInsets.fromLTRB(x, y, 300 - x, 334 - y),
                      ),
                    ],
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Listener(
                              onPointerDown: (details) {
                                negXPressed = true;
                                decreaseSize();
                              },
                              onPointerUp: (details) {
                                negXPressed = false;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(30.0),
                              ),
                            ),
                            Listener(
                              onPointerDown: (details) {
                                xPressed = true;
                                increaseSize();
                              },
                              onPointerUp: (details) {
                                xPressed = false;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(30.0),
                              ),
                            ),
                          ],
                        ),
                        Text("$x"),
                        Text("$y"),
                        Text("$leftX"),
                        Text("$rightX"),
                        Text("$topY"),
                        Text("$bottomY"),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Listener(
                              onPointerDown: (details) {
                                negYPressed = true;
                                decreaseYSize();
                              },
                              onPointerUp: (details) {
                                negYPressed = false;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(30.0),
                              ),
                            ),
                            Text("$x"),
                            Listener(
                              onPointerDown: (details) {
                                yPressed = true;
                                increaseYSize();
                              },
                              onPointerUp: (details) {
                                yPressed = false;
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey,
                                    border: Border.all(),
                                    borderRadius: BorderRadius.circular(10)),
                                padding: EdgeInsets.all(30.0),
                              ),
                            ),
                          ],
                        ),
                      ])
                ]),
          ),
        ));
  }

  Widget mazeBoxes(List<List<List<bool>>> mazeBorders, BuildContext context) {
    return Container(
        height: 351,
        width: 300,
        child: ListView.builder(
          itemCount: mazeBorders.length,
          itemBuilder: (BuildContext context, int index) {
            return Row(
              children: <Widget>[
                mazeSquare(mazeBorders[index][0]),
                mazeSquare(mazeBorders[index][1]),
                mazeSquare(mazeBorders[index][2]),
                mazeSquare(mazeBorders[index][3]),
                mazeSquare(mazeBorders[index][4]),
                mazeSquare(mazeBorders[index][5]),
                mazeSquare(mazeBorders[index][6]),
                mazeSquare(mazeBorders[index][7]),
                mazeSquare(mazeBorders[index][8]),
                mazeSquare(mazeBorders[index][9]),
            ],
            );
          })
        );
  }

  Widget mazeSquare(List<bool> mazeBorders) {
    List<double> sides = [0.0, 0.0, 0.0, 0.0];
    for(int side = 0; side < mazeBorders.length; side++)
      {
        if(mazeBorders[side])
          {
            sides[side] = 1.0;
          }
      }
    return Container(
      width: 30,
      height: 30,
      decoration: BoxDecoration(
        border: Border(
            top: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, sides[0])),
            left: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, sides[1])),
            right: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, sides[2])),
            bottom: BorderSide(width: 1, color: Color.fromRGBO(0, 0, 0, sides[3])),
        )
      ),

    );
  }
}

class MovieListView extends StatelessWidget {

  final List movies = [
    "Titanic",
    "Blade Runner",
    "Rambo",
    "The Avengers",
    "Avatar",
    "I am Legend",
    "300",
    "The Wolf on Wall Street",
    "Interstellar",
    "Game of Thrones",
    "Vikings"
  ];

  final List<Movie> movieList = Movie.getMovies();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Movies"),
          backgroundColor: Colors.blueGrey.shade900,
        ),
        backgroundColor: Colors.blueGrey.shade900,
        body: ListView.builder(
            itemCount: movieList.length,
            itemBuilder: (BuildContext context, int index) {
              return Stack(
                  children: <Widget>[
                    movieCard(movieList[index], context),
                    Positioned(
                      top: 10.0,
                        child: movieImage(movieList[index].poster)
                    ),

                  ]
              );
              // return Card(
              //   elevation: 20,
              //     color: Colors.white,
              //     child: ListTile(
              //       leading: CircleAvatar(
              //         child: Container(
              //           width: 200,
              //           height: 200,
              //           decoration: BoxDecoration(
              //             color: Colors.blue,
              //               image: DecorationImage(image: NetworkImage(movieList[index].poster),
              //               fit: BoxFit.cover,
              //
              //               ),
              //             borderRadius: BorderRadius.circular(13.9)
              //
              //           ),
              //
              //         )
              //     ),
              //       trailing: Text("..."),
              //       title: Text(movieList[index].title),
              //       subtitle: Text(movieList[index].year),
              //       onTap: () => {
              //         Navigator.push(context, MaterialPageRoute(builder: (context) => MovieListViewDetails(movie: movieList[index],)))
              //       },
              //     )
              // );
            }));
  }

  Widget movieCard(Movie movie, BuildContext context) {
    return InkWell(
      child: Container(
        margin: EdgeInsets.only(left: 60),
        width: MediaQuery.of(context).size.width,
        height: 120,
        child: Card(
          color: Colors.black45,
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0, left: 54.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Flexible(
                        child: Text(movie.title, style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 17.0,
                          color: Colors.white
                        )),
                      ),
                      Text("Rating: ${movie.imbdRating} / 10", style: mainTextStyle() )
                    ],
                  ),
                  Row(
                    mainAxisAlignment:  MainAxisAlignment.spaceAround,
                    children: [
                      Text("Released: ${movie.released}", style: mainTextStyle()),
                      Text(movie.runtime, style: mainTextStyle()),
                      Text(movie.rated, style: mainTextStyle())
                    ],
                  )

                ],
              ),
            ),
          ),
        )

      ),
      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => MovieListViewDetails(movie: movie,))),
    );
  }

  TextStyle mainTextStyle()
  {
    return TextStyle(
        fontSize: 15.0,
        color: Colors.grey
    );
  }

  Widget movieImage(String imageUrl) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(image: NetworkImage(imageUrl ?? "https://picsum.photos/200/300"), fit: BoxFit.cover)
      ),
    );
  }
  
}
class MovieListViewDetails extends StatelessWidget {

  final Movie movie;

  const MovieListViewDetails({Key key, this.movie}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Movie: ${movie.title}"),
      ),
      body: ListView(
        children: <Widget>[

        ],
      )
      // body: Center(
      //   child: Container(
      //     child: RaisedButton(
      //       child: Text("Go Back ${movie.title}"),
      //       onPressed: () {
      //         Navigator.pop(context);
      //       },
      //     ),
      //   ),
      // )
    );
  }

}

