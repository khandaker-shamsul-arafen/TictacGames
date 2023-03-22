import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/single_player_controller.dart';

class SinglePlayerView extends GetView<SinglePlayerController> {
  const SinglePlayerView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tic Tac Toe'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            SizedBox(
              height: 500,
              width: 500,
              child: Obx(() {
                return GridView.builder(
                  // use GridView to display the game board
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 1),
                  itemCount: controller.board!.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      // wrap each cell with GestureDetector to handle user input
                      onTap: () {
                        controller.makeMove(index,
                            context); // handle user input by calling the game logic
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: controller.board![index] == 'O'
                              ? Colors.blue
                              : controller.board![index] == 'X'
                                  ? Colors.red
                                  : Colors.grey,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          controller.board![index],
                          style: TextStyle(
                            fontSize: 40,
                            color: controller.board![index] == 'X' ||
                                    controller.board![index] == 'O'
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),
                      ),
                    );
                  },
                );
              }),
            ),
            ElevatedButton(
              onPressed: () {
                controller.resetGame(context);
              },
              style: ElevatedButton.styleFrom(foregroundColor: Colors.red),
              //resetGame2,
              child: const Text(
                "Reset",
                style: TextStyle(color: Colors.black, fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
