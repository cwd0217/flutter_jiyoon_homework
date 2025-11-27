import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_jiyoon_homework/view_model/251126_alarm_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Alarm extends ConsumerWidget {
  const Alarm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final alarms = ref.watch(alarmListProvider);

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        leading: TextButton(onPressed: (){}, 
        child: Text("Edit",
        style: TextStyle(
        color: Colors.orangeAccent
        ),
        )),
        actions: [IconButton(onPressed: (){}, icon: Icon(Icons.add,
        color: Colors.orangeAccent,
        ))],
      ),

      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Alarm",
          style: TextStyle(
            fontSize: 34,
            fontWeight: FontWeight.bold
          ),
          ),
          Divider(),

          Expanded(
            child: ListView.builder(
              itemCount: alarms.length,
              itemBuilder: (context, index) {
                final alarm = alarms[index];

                final Color itemTextColor = alarm.isEnabled
                ? Colors.white
                : Colors.white.withValues(alpha: 0.4);

               return Column(
                    children: [
                      const Divider(), // 항목 구분선
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8.0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center, // 세로 중앙 정렬
                          children: [
                            // 5. 시간 및 AM 텍스트 (색상 연결)
                            RichText(
                              text: TextSpan(
                                // ⭐️ 동적 색상 적용
                                style: TextStyle(color: itemTextColor), 
                                children: <TextSpan>[
                                  TextSpan(
                                    text: alarm.time.substring(0, 4), // 7:00, 8:30 등
                                    style: const TextStyle(fontSize: 40, fontWeight: FontWeight.w200),
                                  ),
                                  TextSpan(
                                    text: alarm.time.substring(4).trim(), // AM, PM 등
                                    style: const TextStyle(fontSize: 20, fontWeight: FontWeight.normal)
                                  )
                                ]
                              ),
                            ),
                            
                            // 6. 텍스트 아래 'Alarm' 레이블 추가 (Complex UI - 여기서는 생략하고 Row 안에만 집중)
                            
                            const Spacer(),
                            
                            // 7. 스위치 (상태 및 로직 연결)
                            CupertinoSwitch(
                              value: alarm.isEnabled, // ⭐️ ViewModel 상태 연결
                              activeColor: CupertinoColors.systemRed,
                              onChanged: (bool? value) {
                                // 8. ⭐️ ViewModel 메서드 호출: 상태 변경 요청
                                if (value != null) {
                                  ref.read(alarmListProvider.notifier).toggleAlarm(alarm.id);
                                }
                              },
                            ),
                          ], 
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      )
    );
  }
}