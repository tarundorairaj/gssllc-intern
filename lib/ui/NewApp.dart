import 'package:flutter/material.dart';
import 'dart:async';


class NewApp extends StatefulWidget {
  @override
  _NewAppState createState() => _NewAppState();
}

class _NewAppState extends State<NewApp> {
  double x = 120.0;
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
        } else if(bottomY == -1)
        {
          if((y - 34) % 30 != 0 || (!maze[0][leftX][0] && !maze[0][rightX][0]))
          {
            y++;
            bottomY = ((y - 35)/30 - 0.5).round();
            topY = ((y - 44)/30 - 0.5).round();
          }
        } else if (bottomY < -1)
          {
            y++;
            bottomY = ((y - 35)/30 - 0.5).round();
            topY = ((y - 44)/30 - 0.5).round();
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
            padding: const EdgeInsets.only(top: 40.0),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Column(
                    children: <Widget>[
                      Text("Tarun's Maze", style: TextStyle(
                          color: Colors.lightBlueAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 30
                      ),),
                      Stack(
                        children: <Widget>[
                          mazeBoxes(maze, context),
                          Container(
                            height: 344.0,
                            width: 310.0,
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
