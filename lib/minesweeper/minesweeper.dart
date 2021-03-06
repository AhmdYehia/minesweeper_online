import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:minesweeper_online/helpers/box_decoration.dart';
import 'package:minesweeper_online/minesweeper/board.dart';
import 'package:minesweeper_online/minesweeper/hud.dart';
import 'package:minesweeper_online/models/game_state.dart';
import 'package:minesweeper_online/services/square_service.dart';
import 'package:minesweeper_online/state/board_state.dart';
import 'package:minesweeper_online/state/game_manager_state.dart';
import 'package:provider/provider.dart';

class Minesweeper extends StatelessWidget {
  final GameManagerState gameManager;
  const Minesweeper({Key key, @required this.gameManager}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return Container(
      decoration: BoxDecorationHelper.buildMinesweeperDecoration(
          themeData.toggleButtonsTheme),
      child: ChangeNotifierProxyProvider<GameManagerState, BoardState>(
        initialBuilder: (_) =>
            BoardState(service: SweeperService(options: gameManager.options)),
        builder: (_, gameManager, boardState) {
          if (gameManager.state == GameState.NotStarted) {
            if (boardState.service.options != gameManager.options)
              return BoardState(
                  service: SweeperService(options: gameManager.options));
            else if (!boardState.isPristine)
              boardState.resetBoard();
          }
          return boardState;
        },
        child: SizedBox(
          width: gameManager.options.dimensions.columns * 32.0,
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 10.0,
              ),
              Hud(
                gameManager: gameManager,
              ),
              Builder(
                builder: (context) {
                  final boardState = Provider.of<BoardState>(context);
                  return Board(
                    boardState: boardState,
                    gameManager: gameManager,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
