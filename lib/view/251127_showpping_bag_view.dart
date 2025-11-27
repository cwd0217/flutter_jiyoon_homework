import 'package:flutter/material.dart';
import 'package:flutter_jiyoon_homework/model/251127_showpping_bag_model.dart';
import 'package:flutter_jiyoon_homework/view_model/251127_showpping_bag_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// ViewModel과 Model 클래스를 정의한 파일을 import 해야 합니다.
// import '패키지경로/shopping_bag_view_model.dart';
// import '패키지경로/251127_showpping_bag_model.dart';

// ConsumerWidget을 사용하여 Riverpod에 접근합니다.
class Shopping extends ConsumerWidget {
  const Shopping({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) { // 👈 WidgetRef ref 사용
    
    // 1. 상태 구독: 상품 목록 상태를 watch하여 데이터 변경 시 View를 리빌드합니다.
    final items = ref.watch(shoppingBagProvider);
    
    // 2. 함수 접근: ViewModel의 함수 호출을 위해 notifier 인스턴스를 read 합니다.
    final viewModel = ref.read(shoppingBagProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Shopping Bag",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.white, // 배경색을 흰색으로 설정
        elevation: 0.5, // 그림자 설정
      ),
      body: Column(
        children: [
          // 1. 상품 목록 영역 (스크롤 가능)
          Expanded(
            child: ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return _buildItemRow(context, ref, item, viewModel);
              },
            ),
          ),
          
          // 2. 하단 금액 요약 및 버튼 영역
          _buildFooter(context, viewModel),
        ],
      ),
    );
  }

  // --- 위젯 분리 ---

  // 상품 개별 항목 위젯
  Widget _buildItemRow(BuildContext context, WidgetRef ref, ShoppingItem item, ShoppingBagViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // 
          // 상품 이미지 (예시 이미지 플레이스홀더)
          Container(
            width: 80,
            height: 80,
            color: Colors.grey[200],
            child: const Center(child: Icon(Icons.image_search, color: Colors.grey)),
          ), 
          const SizedBox(width: 16),
          
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                Text('\$${item.price.toStringAsFixed(2)}', style: TextStyle(color: Colors.grey[600])),
              ],
            ),
          ),

          // 수량 조절 버튼 그룹
          Row(
            children: [
              // 감소 버튼
              IconButton(
                icon: const Icon(Icons.remove_circle_outline, color: Colors.grey),
                onPressed: () {
                  // ViewModel의 함수를 호출하여 상태 변경 요청
                  viewModel.updateQuantity(item, false); 
                },
              ),
              // 현재 수량 표시
              Text(item.count.toString(), style: const TextStyle(fontWeight: FontWeight.bold)),
              // 증가 버튼
              IconButton(
                icon: const Icon(Icons.add_circle_outline, color: Colors.black),
                onPressed: () {
                  // ViewModel의 함수를 호출하여 상태 변경 요청
                  viewModel.updateQuantity(item, true);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  // 하단 금액 요약 및 체크아웃 버튼 위젯
  Widget _buildFooter(BuildContext context, ShoppingBagViewModel viewModel) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // 금액 요약
          _buildPriceRow('Sub Total', viewModel.subTotal),
          const SizedBox(height: 10),
          _buildPriceRow('Shipping', ShoppingBagViewModel.SHIPPING_FEE),
          const Divider(height: 30),
          _buildPriceRow('Bag Total', viewModel.bagTotal, isBold: true, isRed: true),
          const SizedBox(height: 20),
          
          // 체크아웃 버튼
          ElevatedButton(
            onPressed: viewModel.proceedToCheckout, 
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.deepOrange, // 버튼 색상 설정
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              elevation: 0,
            ),
            child: const Text(
              'Proceed to Checkout', 
              style: TextStyle(color: Colors.white, fontSize: 18)
            ),
          ),
        ],
      ),
    );
  }

  // 금액 표시 Row 공통 위젯
  Widget _buildPriceRow(String label, double amount, {bool isBold = false, bool isRed = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal),
        ),
        Text(
          '\$${amount.toStringAsFixed(2)}',
          style: TextStyle(
            fontWeight: isBold ? FontWeight.bold : FontWeight.normal,
            color: isRed ? Colors.deepOrange : Colors.black, // 최종 금액 빨간색으로 표시
            fontSize: isBold ? 18 : 16,
          ),
        ),
      ],
    );
  }
}