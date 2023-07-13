import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int winingsOfXPlayer = 0;
  int winingsOfOPlayer = 0;
  bool isTurnO = true;
  List<String> xOrOList = ["", "", "", "", "", "", "", "", ""];
  bool isFinishing = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: const Text("Tic Tac Toe"),
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Player O",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      winingsOfOPlayer.toString(),
                      style: const TextStyle(fontSize: 25),
                    )
                  ],
                ),
                Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "Player X",
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      winingsOfXPlayer.toString(),
                      style: const TextStyle(fontSize: 25),
                    )
                  ],
                ),
              ],
            ),
            Container(
              margin: const EdgeInsets.all(20),
              width: size.width,
              height: size.height / 1.9,
              child: GridView.builder(
                physics: const NeverScrollableScrollPhysics(),
                itemCount: 9,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(
                        () {
                          if (!isFinishing) {
                            if (xOrOList[index] == "") {
                              isTurnO = !isTurnO;
                            }

                            if (xOrOList[index] == "") {
                              if (!isTurnO) {
                                xOrOList[index] = "O";
                              } else {
                                xOrOList[index] = "X";
                              }
                            }
                          }
                        },
                      );
                      if (!isFinishing) {
                        checkWinner(xOrOList);
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                      ),
                      child: Center(
                        child: Text(
                          xOrOList[index],
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                            color: xOrOList[index] == "O"
                                ? Colors.redAccent
                                : Colors.greenAccent,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            TextButton(
              onPressed: () {
                setState(
                  () {
                    for (var i = 0; i < xOrOList.length; i++) {
                      xOrOList[i] = "";
                    }
                    isFinishing = false;
                  },
                );
              },
              child: const Text(
                "Reset",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ),
            const Spacer(),
            Text(
              isTurnO ? "Turn O" : "Turn X",
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  void checkWinner(List<String> list) {
    if (list[0] == list[1] && list[0] == list[2] && list[0] != "") {
      if (list[0] == "X") {
        setState(
          () {
            winingsOfXPlayer += 1;
            isFinishing = true;
          },
        );
      } else {
        setState(
          () {
            winingsOfOPlayer += 1;
            isFinishing = true;
          },
        );
      }
    }
    if (list[3] == list[4] && list[3] == list[5] && list[3] != "") {
      if (list[3] == "X") {
        setState(
          () {
            winingsOfXPlayer += 1;
            isFinishing = true;
          },
        );
      } else {
        setState(
          () {
            winingsOfOPlayer += 1;
            isFinishing = true;
          },
        );
      }
    }
    if (list[6] == list[7] && list[6] == list[8] && list[6] != "") {
      if (list[6] == "X") {
        setState(
          () {
            winingsOfXPlayer += 1;
            isFinishing = true;
          },
        );
      } else {
        setState(
          () {
            winingsOfOPlayer += 1;
            isFinishing = true;
          },
        );
      }
    }
    if (list[0] == list[3] && list[0] == list[6] && list[0] != "") {
      if (list[0] == "X") {
        setState(
          () {
            winingsOfXPlayer += 1;
            isFinishing = true;
          },
        );
      } else {
        setState(
          () {
            winingsOfOPlayer += 1;
            isFinishing = true;
          },
        );
      }
    }
    if (list[1] == list[4] && list[1] == list[7] && list[1] != "") {
      if (list[1] == "X") {
        setState(
          () {
            winingsOfXPlayer += 1;
            isFinishing = true;
          },
        );
      } else {
        setState(
          () {
            winingsOfOPlayer += 1;
            isFinishing = true;
          },
        );
      }
    }
    if (list[2] == list[5] && list[2] == list[8] && list[2] != "") {
      if (list[2] == "X") {
        setState(
          () {
            winingsOfXPlayer += 1;
            isFinishing = true;
          },
        );
      } else {
        setState(
          () {
            winingsOfOPlayer += 1;
            isFinishing = true;
          },
        );
      }
    }
    if (list[0] == list[4] && list[0] == list[8] && list[0] != "") {
      if (list[0] == "X") {
        setState(
          () {
            winingsOfXPlayer += 1;
            isFinishing = true;
          },
        );
      } else {
        setState(
          () {
            winingsOfOPlayer += 1;
            isFinishing = true;
          },
        );
      }
    }
    if (list[2] == list[4] && list[2] == list[6] && list[2] != "") {
      if (list[2] == "X") {
        setState(
          () {
            winingsOfXPlayer += 1;
            isFinishing = true;
          },
        );
      } else {
        setState(
          () {
            winingsOfOPlayer += 1;
            isFinishing = true;
          },
        );
      }
    }
  }
}
