import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//필요한 클래스를 만들어서 사용해주기
class Cart {
  String name;
  double price;
  int count;
  String size;
  Cart({
    required this.name,
    required this.price,
    required this.count,
    required this.size,
  });
}

class View2 extends StatelessWidget {
  View2({super.key});
  final List<Cart> cart = [
    Cart(name: "Coton quen T", price: 43.00, count: 1, size: "S"),
    Cart(name: "Grey T- shirt", price: 41.00, count: 1, size: "M"),
  ];
  //만들어 진 틀안에 들어갈 리스트 만들기
  // 이렇게 쓰니까 오타가 있어도 못잡아줌.. 그래서 클래스로 만들어쓰는 방법이 더 좋다..?
  // final List<Map<String, dynamic>> cartList = [{
  //   "name":"Coton quen T","price":43.00,"count":1,"size": "s"},
  //   {"name":"Grey T- shirt","price":41.00,"count":1,"size": "M"}
  //   ];
  // 중복되는 글들을 메서드로 만들어서 사용할려고 파라미터를 만들어준거야
  Widget buildCartItem({
    required String name,
    required double price,
    required int count,
    required String size,
  }) {
    // 무엇을 리턴을해야지 되는걸까?? 뭘 리턴받고싶은거지..? 중복되는 저 값들을 리턴하고싶은거같은데
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 90,
              height: 90,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(Icons.shopping_bag, color: Colors.white),
            ),
            //수량 조절하는 버튼
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                  ),
                  SizedBox(height: 15),
                  Row(
                    children: [
                      //+ 버튼
                      Material(
                        color: Color(0xffeeeeee),
                        borderRadius: BorderRadius.circular(12),

                        child: InkWell(
                          onTap: () {},

                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffdddddd),
                            ),
                            child: Icon(Icons.add, size: 16),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      //갯수
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: SizedBox(
                          child: Text(
                            "$count",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),

                      //- 버튼
                      Material(
                        color: Color(0xffeeeeee),
                        borderRadius: BorderRadius.circular(12),

                        child: InkWell(
                          onTap: () {},

                          child: Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Color(0xffdddddd),
                            ),
                            child: Icon(Icons.remove, size: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            //사이즈
            Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Center(
                child: Text(
                  size,
                  style: TextStyle(color: Colors.white, fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  // 총 게산할떄 쓰는 메서드
  Widget _totalPrice ({required String name, required double price, required bool isbool}){
          return Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(name),
              Text("\$${price.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 24,
                fontWeight:   FontWeight.bold , color: isbool ? Colors.orangeAccent :  Colors.black 
              ),
              )
            ],
          );
          }

  // Proced to Checkout 버튼
  Widget _CheckoutButton (){
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(14),
        color: Colors.orangeAccent
      ),
      child: Text("Proced to Checkout",
      style: TextStyle(
        color: Colors.white,
        fontSize: 18
      ),
      ),
    );
  }


  @override
  Widget build(BuildContext context) {
    double subtotal = 0;
    double shopping = 6.00;

    for( var items in cart ){
      subtotal += items.price * items.count;
    }
    double BagTotal = subtotal + shopping;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Shopping Bag",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 50),
        child: Column(
          children: [
            Expanded(
              child: ListView.separated(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  final cart2 = cart[index];
                  return buildCartItem(
                    name: cart2.name,
                    price: cart2.price,
                    count: cart2.count,
                    size: cart2.size,
                  );
                },
                separatorBuilder: (context, index) {
                  return const SizedBox(height: 40);
                },
              ),
            
            ),
            // 토탈 가격 정리
            _totalPrice(name: "Sub Total", price:84, isbool: false),
            _totalPrice(name: "Shopping", price:6, isbool: false),
            SizedBox(height: 16),
            _totalPrice(name: "Bag Total", price:90, isbool: true),
            SizedBox(height: 15),
            //checkout button
            _CheckoutButton()

          ],
        ),
      ),
    );
  }
}
