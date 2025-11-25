import 'package:flutter_jiyoon_homework/model/251125_example_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

class CalculatorViewModel extends StateNotifier<CountNumver>{
  CalculatorViewModel() : super(CountNumver(count: 0));

  // 더하는 매서드
  void add(int value){
    state = CountNumver(count: state.count + value);
  }
  // 뺴는 매서드
  void remove(int value){ 
    state = CountNumver(count: state.count - value);
  }

  // 곱하는 매서드
  void multiply(int value){
    state = CountNumver(count: state.count * value);
  }

  void reset(){
    state = CountNumver(count: 0);
  }

}

final calculatorViewModelProvider = StateNotifierProvider<CalculatorViewModel, CountNumver>
((ref) => CalculatorViewModel());
