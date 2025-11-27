class ShoppingItem{
   int count;
  final String name;
  final double price;
  ShoppingItem({ this.count= 1, required this.name, required this.price});


  //changeNotifier를 쓰면 카피가 사용할 필요가 없다고함(새로운 객체를 생성할 일이 없으니)
  
  ShoppingItem copyWith({
    int? count,
    String? name,
    double? price,
  }){
    return ShoppingItem(count: count ?? this.count, name: name ?? this.name, price: price ?? this.price);
  }

}