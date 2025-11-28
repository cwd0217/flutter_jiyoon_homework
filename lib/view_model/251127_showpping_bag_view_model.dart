import 'package:flutter_jiyoon_homework/model/251127_showpping_bag_model.dart';
import 'package:flutter_riverpod/legacy.dart';

class ShoppingBagViewModel extends StateNotifier<List<ShoppingItem>> {
  ShoppingBagViewModel()
    : super([
        ShoppingItem(name: 'Cotton queen T', price: 43.00, count: 1),
        ShoppingItem(name: 'Grey T-shirt', price: 41.00, count: 1),
      ]);

  static const double SHIPPING_FEE = 6.00;

  void updateQuantity(ShoppingItem item, bool add) {
    int newCount = item.count;

    if (add) {
      newCount++;
    } else {
      // 최소 수량 1개 유지
      if (item.count > 1) {
        newCount--;
      }
    }
    // 2-1. 특정 아이템의 count만 바뀐 '새로운 ShoppingItem' 객체 생성 (copyWith 사용)
    final updatedItem = item.copyWith(count: newCount);

    // 2-2. 현재 state 리스트(불변)를 복사하면서, 변경된 아이템만 새 객체로 교체
    final updatedList = [
      for (final i in state) // state는 현재 List<ShoppingItem>
        if (i.name == item.name) updatedItem else i, // 이름으로 아이템을 찾고 교체
    ];

    // 2-3. StateNotifier의 핵심: 상태 전체를 새로운 리스트로 교체
    state = updatedList;
  }

  double get subTotal {
    double total = 0.0;
    // state(현재 리스트)를 사용
    for (var item in state) {
      total += item.price * item.count;
    }
    return total;
  }

  double get bagTotal => subTotal + SHIPPING_FEE;

  void proceedToCheckout() {
    print('체크아웃이 진행됩니다. 최종 금액: \$${bagTotal.toStringAsFixed(2)}');
  }
}

final shoppingBagProvider =
    StateNotifierProvider<ShoppingBagViewModel, List<ShoppingItem>>(
      (ref) => ShoppingBagViewModel(),
    );

//아쉬...ChangeNotifier는 다음에 공부하자 일단 과제 제출해야되니까 ^^;;
  
  // // 내가 사용할 모델리스트를 불러오기
  // final List<ShoppingItem> _item =[
  //   //초기 데이터 값 설정 - 이렇게 초기값을 주는 이유는 동적데이터, 데이터변경 재사용성 떄문이다
  //   ShoppingItem(name: "Cottono queen T", price: 43, count: 1 ),
  //   ShoppingItem(name: "Grey T-shirt", price: 41, count:  1),
  // ];
  // // get을 쓰는이유  변수처럼 접근해서 값을 가져올려고
  // List<ShoppingItem> get item => _item;

  // // 달러 6.0 고정
  // static const double SHIPPING_FEE = 6.00; 

