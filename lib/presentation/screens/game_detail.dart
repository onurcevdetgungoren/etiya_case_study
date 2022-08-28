import 'package:etiya_case_study/presentation/widgets/game_detail/game_detail_card.dart';
import 'package:flutter/material.dart';

class GameDetailPage extends StatefulWidget {
  const GameDetailPage({Key? key}) : super(key: key);

  @override
  State<GameDetailPage> createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  @override
  Widget build(BuildContext context) {
    return const GameDetailCard();
  }
}
