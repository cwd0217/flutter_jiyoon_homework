import 'package:flutter_jiyoon_homework/model/251126_alarm_model.dart';
import 'package:flutter_riverpod/legacy.dart';

class AlarmList extends StateNotifier<List<Alarm>> {
  AlarmList() : super ([
    Alarm(id: "a1", time: "7:00 AM", isEnabled: true),
    Alarm(id: "a2", time: "8:30 AM", isEnabled: false),
    Alarm(id: "a3", time: "8:00 AM", isEnabled: true),

  ]);
    //이부분은 제미나이형님이 만들어주셨습니다.. 일단 나중에 다시해보겠습니다 ;ㅅ;
    void toggleAlarm(String alarmId){
      state = [
        for(final alarm in state)
        if(alarm.id == alarmId)
        alarm.copywith(isEnabled: !alarm.isEnabled)
        else
        alarm,
      ];

    }
  
}

final alarmListProvider = StateNotifierProvider<AlarmList, List<Alarm>>
((ref) => AlarmList());