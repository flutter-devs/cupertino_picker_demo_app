import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CupertinoPickerView extends StatefulWidget {
  const CupertinoPickerView({Key? key}) : super(key: key);

  @override
  _CupertinoPickerViewState createState() => _CupertinoPickerViewState();
}

class _CupertinoPickerViewState extends State<CupertinoPickerView> {
  var selectItem;
  double _kPickerSheetHeight = 216.0;
  DateTime? dateTime;
  Duration initialtimer = new Duration();
  var time;
  int value=0;
  final items=[
    "Item 1",
    "Item 2",
    "Item 3",
    "Item 4",
    "Item 5",
  ];


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: _buildBody()
    );
  }

  Widget _buildBody() {
    return Center(
      child: Container(
        margin: EdgeInsets.only(left: 30,right: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          //crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                showCupertinoModalPopup<void>(
                    context: context, builder: (BuildContext context){
                  return _buildBottomPicker(
                      _buildCupertinoPicker()
                  );
                });
              },
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width:MediaQuery.of(context).size.width ,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.pinkAccent
                    ),
                    child: Center(
                      child: Text("Cupertino Picker",
                      style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ),
                 // SizedBox(height: 30,),

                  Container(
                    padding: EdgeInsets.only(top: 8,bottom: 8),
                    child: Text(selectItem!=null?selectItem:'No Item Chosen',
                      style: TextStyle(
                          color: Colors.black,

                      ),),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                showCupertinoModalPopup<void>(
                    context: context, builder: (BuildContext context){
                  return _buildBottomPicker(
                     _buildDateTimePicker()
                  );
                });
              },
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width:MediaQuery.of(context).size.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Colors.blue
                    ),
                    child: Center(
                      child: Text("Cupertino Date Picker",
                      style: TextStyle(
                          color: Colors.white
                      ),),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8,bottom: 8),
                   // selectItem!=null?selectItem:'Set Picker',
                    child: Text(dateTime == null ? 'No Date Chosen'
                        : ' ${dateTime}',
                      style: TextStyle(
                          color: Colors.black
                      ),),
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: (){
                showCupertinoModalPopup<void>(
                    context: context, builder: (BuildContext context){
                  return _buildBottomPicker(
                      timePicker()
                  );
                });
              },
              child: Column(
                children: [
                  Container(
                    height: 50,
                    width:MediaQuery.of(context).size.width ,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.orange
                    ),
                    child: Center(
                      child: Text("Cupertino Time Picker",
                        style: TextStyle(
                            color: Colors.white
                        ),),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 8,bottom: 8),
                    child: Text(time == null ? 'No Time Chosen'
                        : ' ${time}',
                      style: TextStyle(
                          color: Colors.black
                      ),),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }




 Widget _buildCupertinoPicker(){
    return Container(
      child: CupertinoPicker(
        magnification: 1.5,
        backgroundColor: Colors.white,
        itemExtent: 50, //height of each item
        looping: true,
        children: items.map((item)=> Center(
          child: Text(item,
          style: TextStyle(fontSize: 32),),
        )).toList(),
        onSelectedItemChanged: (index) {
          setState(() => this.value= index);
          selectItem= items[index];
          print("Selected Iem: $index");
          // setState(() {
          //   selectItem=value.toString();
          // });
        },
      ),
    );

  }


  Widget _buildDateTimePicker() {
    return  CupertinoDatePicker(
        mode: CupertinoDatePickerMode.dateAndTime,
        initialDateTime: dateTime,
        onDateTimeChanged:(DateTime newDataTime){
          if(mounted){
            setState(() {
              dateTime=newDataTime;
            });
          }
        });
  }
  Widget timePicker() {
    return CupertinoTimerPicker(
      mode: CupertinoTimerPickerMode.hms,
      minuteInterval: 1,
      secondInterval: 1,
      initialTimerDuration: initialtimer,
      onTimerDurationChanged: (Duration changedtimer) {
        setState(() {
          initialtimer = changedtimer;
          time = changedtimer.inHours.toString() +
              ' hrs ' +
              (changedtimer.inMinutes % 60).toString() +
              ' mins ' +
              (changedtimer.inSeconds % 60).toString() +
              ' secs';
        });
      },
    );
  }

  Widget _buildBottomPicker(Widget picker) {
    return Container(
      height: _kPickerSheetHeight,
      padding: const EdgeInsets.only(top: 6.0),
      color: CupertinoColors.white,
      child: DefaultTextStyle(
        style: const TextStyle(
          color: CupertinoColors.black,
          fontSize: 22.0,
        ),
        child: GestureDetector(
          // Blocks taps from propagating to the modal sheet and popping.
          onTap: () {},
          child: SafeArea(
            top: false,
            child: picker,
          ),
        ),
      ),
    );
  }





  // Widget datetimePicker() {
  //   return CupertinoDatePicker(
  //     initialDateTime: DateTime.now(),
  //     onDateTimeChanged: (DateTime newdate) {
  //       print(newdate);
  //       setState(() {
  //         dateTime = (newdate.day.toString() + '/' + newdate.month.toString() + '/' + newdate.year.toString() + ' ' + newdate.hour.toString() + ' hrs ' + newdate.minute.toString() + ' mins') as DateTime?;
  //       });
  //     },
  //     use24hFormat: true,
  //     maximumDate: new DateTime(2021, 12, 30),
  //     minimumYear: 2010,
  //     maximumYear: 2021,
  //     minuteInterval: 1,
  //     mode: CupertinoDatePickerMode.dateAndTime,
  //   );
  // }


  // showCupertinoModalPopup(
  // context: context,
  // builder: (_) {
  // return new SizedBox(
  // height: MediaQuery.of(context).size.height / 2,
  // child: new CupertinoPicker(
  // scrollController: FixedExtentScrollController(initialItem: 3),
  // magnification: 1.2,
  // useMagnifier: true,
  // itemExtent: 32.0,
  // onSelectedItemChanged: (i) => setState(() => _chosenProvince = listProvince[i]),
  // children: r != null && listProvince != null ? listProvince.map((prov) {
  // return new Padding(
  // padding: const EdgeInsets.all(4.0),
  // child: new Text(
  // prov.name,
  // textAlign: TextAlign.center,
  // overflow: TextOverflow.ellipsis,
  // style: new TextStyle(
  // fontSize: 20.0,
  // ),
  // ),
  // );
  // }).toList(): [],),);});

}



