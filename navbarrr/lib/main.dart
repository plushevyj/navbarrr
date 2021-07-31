import 'package:navbarrr/navbar_bloc.dart';
import 'package:navbarrr/navbar_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => NavbarBloc(),
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bloc = BlocProvider.of<NavbarBloc>(context);

    return BlocBuilder(
      bloc: bloc,
      builder: (BuildContext context, NavbarState state) {
        if (state is ShowBlue)
          return buildHomepage(
            state.title,
            Colors.blue,
            state.itemIndex,
            bloc,
          );
        if (state is ShowGreen)
          return buildHomepage(
            state.title,
            Colors.green,
            state.itemIndex,
            bloc,
          );
        if (state is ShowRed)
          return buildHomepage(
            state.title,
            Colors.red,
            state.itemIndex,
            bloc,
          );
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }

  Scaffold buildHomepage(
      String title, Color color, int currentIndex, NavbarBloc bloc) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Container(
        color: color,
        child: Center(
          child: Text(title),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 0) bloc.add(NavbarItems.Red);
          if (index == 1) bloc.add(NavbarItems.Blue);
          if (index == 2) bloc.add(NavbarItems.Green);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: "Red",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: "Blue",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            label: "Green",
          )
        ],
      ),
    );
  }
}
