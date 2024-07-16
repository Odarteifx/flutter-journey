import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_practical/riverpodmodel.dart';

final riverpodEasyLevel = StateProvider<int>((ref){
  return 0;
});


final riverpodHardLevel = ChangeNotifierProvider<Riverpodmodel>((ref){
  return Riverpodmodel (counter: 0);
});
