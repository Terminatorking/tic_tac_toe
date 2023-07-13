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
                          isTurnO = !isTurnO;
                          if (xOrOList[index] == "") {
                            if (isTurnO) {
                              xOrOList[index] = "O";
                            } else {
                              xOrOList[index] = "X";
                            }
                          }
                        },
                      );
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
}
