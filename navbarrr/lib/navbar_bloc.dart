import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:navbarrr/navbar_states.dart';

enum NavbarItems { Red, Green, Blue }

class NavbarBloc extends Bloc<NavbarItems, NavbarState> {
  NavbarBloc() : super(ShowRed());

  @override
  Stream<NavbarState> mapEventToState(NavbarItems event) async* {
    switch (event) {
      case NavbarItems.Blue:
        yield ShowBlue();
        break;
      case NavbarItems.Green:
        yield ShowGreen();
        break;
      default:
        yield ShowRed();
        break;
    }
  }
}
