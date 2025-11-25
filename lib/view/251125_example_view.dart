import 'package:flutter_jiyoon_homework/model/251125_example_model.dart';
import 'package:flutter_jiyoon_homework/view_model/251125_example_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class Example extends HookConsumerWidget {
  const Example({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 상태 구독
    final countNumver = ref.watch(calculatorViewModelProvider).count;
    // 뷰모델 접근 (뷰모델은 접근할떄 notifier)
    final notifier = ref.read(calculatorViewModelProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "예제 페이지",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //첫번쨰 버튼
            Row(
              children: [
                calculatorBox(Icons.add, "더하기 1", () => notifier.add(1)),
                SizedBox(width: 8),
                calculatorBox(Icons.remove, "뺴기 1", () => notifier.remove(1)),
              ],
            ),
            SizedBox(height: 8),
            //2번쨰 버튼
            Row(
              children: [
                calculatorBox(Icons.close, "곱하기 2", () => notifier.multiply(2)),
                SizedBox(width: 8),
                calculatorBox(Icons.refresh, "초기화 1", () => notifier.reset()),
              ],
            ),
            Expanded(
              child: Center(
                child: Container(
                  width: 100,
                  height: 100,
              
                  alignment: Alignment.center,
                  child: Text("$countNumver",
                  style: TextStyle(
                    fontSize: 64,
                    fontWeight: FontWeight.bold
                  ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget calculatorBox(IconData icon, String text, VoidCallback onTap) {
    return Expanded(
      child: InkWell(
        onTap: onTap,
        child: Container(
          alignment: Alignment.centerLeft,
          height: 80,
          padding: EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Color(0xffEFF1F5),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon),
              Text(
                text,
                style: TextStyle(fontSize: 14, color: Color(0xff000000)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
