import 'package:etiya_case_study/presentation/widgets/game_list/bloc/game_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBar extends StatelessWidget {
  final TextEditingController textEditingController;
  const SearchBar({Key? key, required this.textEditingController})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final gameBloc = BlocProvider.of<GameBloc>(context);
    double deviceWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: deviceWidth * 0.9,
      child: TextField(
        controller: textEditingController,
        style: TextStyle(color: Colors.grey.shade300),
        decoration: const InputDecoration(
          hintText: "e.x. Grand Theft Auto",
          hintStyle: TextStyle(color: Colors.grey),
          contentPadding: EdgeInsets.all(5),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(90.0)),
            borderSide: BorderSide(width: 0, color: Colors.transparent),
          ),
          disabledBorder: InputBorder.none,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(90.0)),
            borderSide: BorderSide(
              width: 2,
              color: Colors.transparent,
            ),
          ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.grey,
          ),
          filled: true,
          fillColor: Color.fromRGBO(70, 63, 113, 1),
        ),
        onChanged: (s) {
          gameBloc.add(FetchGameEvent(search: s));
        },
      ),
    );
  }
}
