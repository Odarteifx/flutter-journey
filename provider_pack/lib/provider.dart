import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier{
  String userName;

UserProvider({
  this.userName = 'Admin'
});

void changeUserName({required String newUserName}) async{
  userName = newUserName;
  notifyListeners();
}
}


class CounterProvider extends ChangeNotifier {
int num;
CounterProvider({
this.num = 0,
});
  
  void numIncrement() async {
    num ++;
    notifyListeners();
  }

  void numDecrement() async{
    num --;
    notifyListeners();
  }
}

