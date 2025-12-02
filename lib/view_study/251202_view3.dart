import 'package:flutter/material.dart';

class View3 extends StatelessWidget {
   View3({super.key});

  // final List<BottomNavigationBarItem> bottomNaviItem = [
  //   BottomNavigationBarItem(icon: Icon(Icons.home))
  // ];

  final String imageUrl =
      "https://image.fnnews.com/resource/media/image/2016/08/29/201608291416064135_l.jpg";

  Widget icons({required IconData icon, required String text}) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(21),
              color: Color(0xffcccccc),
            ),
            child: Icon(icon),
          ),

          Text(text, style: TextStyle(fontSize: 12)),
        ],
      ),
    );
  }

  // 디테일 가기전 목록
  Widget detailPick({
    required String url,
    required String itemName,
    required double price,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 160,
          width: 126,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Color(0xffcccccc),
            image: url.isNotEmpty
                ? DecorationImage(image: NetworkImage(url), fit: BoxFit.cover)
                : null,
          ),
        ),
        Text(itemName),
        Text(
          "\$${price.toStringAsFixed(2)}",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

      ],
    );
  }

  // 뷰 그리기 시작!
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //왼쪽 아이콘
        leading: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: IconButton(
            onPressed: () {},
            icon: Image.asset("assets/tree.png"),
          ),
        ),
        //타이틀
        title: Text("Gemstore", style: TextStyle(fontWeight: FontWeight.bold)),
        //오른쪽 아이콘
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications, size: 26),
            ),
          ),
        ],
      ),
      //바디 시작
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            //아이콘들
            Row(
              children: [
                SizedBox(height: 100),
                icons(icon: Icons.female, text: "Women"),
                icons(icon: Icons.male, text: "Men"),
                icons(icon: Icons.watch_outlined, text: "Accessoies"),
                icons(icon: Icons.water_drop_outlined, text: "Beauity"),
              ],
            ),
            SizedBox(height: 30),
            Container(
              width: 312,
              height: 168,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey,
                // image가 imgeurl에 없으면 ?
                image: imageUrl.isNotEmpty
                    ? DecorationImage(
                        image: NetworkImage(imageUrl),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Feature Proucts",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Text(
                      "show all",
                      style: TextStyle(fontSize: 13, color: Color(0xff9B9B9B)),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            
            SizedBox(
              height: 227,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children:[detailPick(
                  url:
                      "https://image.auction.co.kr/itemimage/4d/b0/41/4db0419266.jpg",
                  itemName: "Turtleneck Sweater",
                  price: 39.99,
                ), 
                SizedBox(width: 15),
                detailPick(
                  url:
                      "https://cimg.cowave.kr/image/vendor_inventory/9082/0ae5a62253842f8e9a8bc7a4bddd0714a9808496d96499396cdc1db057c9.png",
                  itemName: "Long Sleeve Dress",
                  price: 45,
                ),
                SizedBox(width: 15),
                detailPick(
                  url:
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTZW7wSn-g7Pnu2aCBlI5x5G8ytXMid_nRohQ&s",
                  itemName: "Sportwear Set",
                  price: 80,
                ),
                ] 
              ),
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar( items: bottomNaviItem),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            InkWell(
              onTap: () {},
              child: Icon(Icons.home, size: 35, color: Colors.black),
            ),
            InkWell(
              onTap: () {},
              child: Icon(
                Icons.manage_search_rounded,
                size: 35,
                color: Colors.grey,
              ),
            ),
            Icon(Icons.badge, size: 35, color: Colors.grey),
            Icon(Icons.person_outlined, size: 35, color: Colors.grey),
          ],
        ),
      ),








    );
  }
}
