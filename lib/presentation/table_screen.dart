import 'package:flutter/material.dart';

import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:provider/provider.dart';

import '../constants.dart';
import '../controllers/tables_controller.dart';

class TableScreen extends StatefulWidget {
  const TableScreen({super.key});

  @override
  State<TableScreen> createState() => _TableScreenState();
}

class _TableScreenState extends State<TableScreen> {
  @override
  void didChangeDependencies() {
    Provider.of<TablesProvider>(context, listen: false).separateTime();
    super.didChangeDependencies();
  }

  ScrollController? _scrollController1;
  ScrollController? _scrollController2;
  ScrollController? _scrollController3;
  ScrollController? _scrollController4;
  ScrollController? _scrollController5;
  ScrollController? _scrollController6;
  ScrollController? _scrollController7;
  ScrollController? _scrollController8;
  ScrollController? _scrollController9;
  LinkedScrollControllerGroup? _controllers;

  @override
  void initState() {
    super.initState();
    _controllers = LinkedScrollControllerGroup();
    _scrollController1 = _controllers!.addAndGet();
    _scrollController2 = _controllers!.addAndGet();
    _scrollController3 = _controllers!.addAndGet();
    _scrollController4 = _controllers!.addAndGet();
    _scrollController5 = _controllers!.addAndGet();
    _scrollController6 = _controllers!.addAndGet();
    _scrollController7 = _controllers!.addAndGet();
    _scrollController8 = _controllers!.addAndGet();

    _scrollController9 = _controllers!.addAndGet();
  }

  @override
  void dispose() {
    _scrollController1!.dispose();
    _scrollController2!.dispose();
    _scrollController3!.dispose();
    _scrollController4!.dispose();
    _scrollController5!.dispose();
    _scrollController6!.dispose();
    _scrollController7!.dispose();
    _scrollController8!.dispose();
    _scrollController9!.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<TablesProvider>(builder: (context, sportsmode, _) {
      return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: _customTable(sportsmode),
          ),
        ),
      );
    });
  }

  Widget _customTable(TablesProvider tableTime) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildCells("Total Info for the WEEK", isbold: true),
            Flexible(
              child: SingleChildScrollView(
                controller: _scrollController1,
                child: Column(
                  children: [
                    _buildCells("1", isbold: true),
                    _buildCells("2", isbold: true),
                    _buildCells("3", isbold: true),
                    _buildCells("4", isbold: true),
                    _buildCells("5", isbold: true),
                    _buildCells("6", isbold: true),
                    _buildCells("7", isbold: true),
                  ],
                ),
              ),
            )
          ],
        ),
        Flexible(
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells("Total (Sun - Sat)", isbold: true),
                    Flexible(
                      child: SingleChildScrollView(
                        controller: _scrollController2,
                        child: Column(
                          children: [
                            _buildCells(
                                " ${tableTime.calculateTotalRunningTime().toString()} min"),
                            _buildCells(
                                " ${tableTime.calculateTotalJoggingTime().toString()} min"),
                            _buildCells(
                                " ${tableTime.calculateTotalExerciseTime().toString()} min"),
                            _buildCells(
                                " ${tableTime.calculateTotalTime()} min"),
                            _buildCells(
                                " ${tableTime.calculateTotalRTEngagement()} %"),
                            _buildCells(
                                " ${tableTime.calculateTotalJTEngagement()} %"),
                            _buildCells(
                                " ${tableTime.calculateTotalETEngagement()} %"),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells(
                        'Sun (${formatDate(tableTime.dataList[0].date)})',
                        isbold: true),
                    Flexible(
                      child: SingleChildScrollView(
                        controller: _scrollController3,
                        child: Column(
                          children: [
                            _buildCells(
                                " ${tableTime.dataList[0].runningTime} min"),
                            _buildCells(
                                "${tableTime.dataList[0].joggingTime} min"),
                            _buildCells(
                                "${tableTime.dataList[0].exerciseTime} min"),
                            _buildCells(
                                "${tableTime.calculateTotalTimeByDate(tableTime.dataList[0].date)} min"),
                            _buildCells(
                                " ${tableTime.calculateTotalRTengagementbyDate(tableTime.dataList[0].date)} %"),
                            _buildCells(
                                " ${tableTime.calculateTotalJTEngagementByDate(tableTime.dataList[0].date)} %"),
                            _buildCells(
                                " ${tableTime.calculateTotalETengagementbyDate(tableTime.dataList[0].date)} %"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells(
                        'Mon (${formatDate(tableTime.dataList[1].date)})',
                        isbold: true),
                    Flexible(
                        child: SingleChildScrollView(
                      controller: _scrollController4,
                      child: Column(
                        children: [
                          _buildCells(
                              " ${tableTime.dataList[1].runningTime} min"),
                          _buildCells(
                              "${tableTime.dataList[1].joggingTime} min"),
                          _buildCells(
                              "${tableTime.dataList[1].exerciseTime} min"),
                          _buildCells(
                              "${tableTime.calculateTotalTimeByDate(tableTime.dataList[1].date)} min"),
                          _buildCells(
                              " ${tableTime.calculateTotalRTengagementbyDate(tableTime.dataList[1].date)} %"),
                          _buildCells(
                              " ${tableTime.calculateTotalJTEngagementByDate(tableTime.dataList[1].date)} %"),
                          _buildCells(
                              " ${tableTime.calculateTotalETengagementbyDate(tableTime.dataList[1].date)} %"),
                        ],
                      ),
                    )),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells(
                        'Tue (${formatDate(tableTime.dataList[2].date)})',
                        isbold: true),
                    Flexible(
                        child: SingleChildScrollView(
                      controller: _scrollController5,
                      child: Column(
                        children: [
                          _buildCells(
                              " ${tableTime.dataList[2].runningTime} min"),
                          _buildCells(
                              "${tableTime.dataList[2].joggingTime} min"),
                          _buildCells(
                              "${tableTime.dataList[2].exerciseTime} min"),
                          _buildCells(
                              "${tableTime.calculateTotalTimeByDate(tableTime.dataList[2].date)} min"),
                          _buildCells(
                              " ${tableTime.calculateTotalRTengagementbyDate(tableTime.dataList[2].date)} %"),
                          _buildCells(
                              " ${tableTime.calculateTotalJTEngagementByDate(tableTime.dataList[2].date)} %"),
                          _buildCells(
                              " ${tableTime.calculateTotalETengagementbyDate(tableTime.dataList[2].date)} %"),
                        ],
                      ),
                    ))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells(
                        'Wed (${formatDate(tableTime.dataList[3].date)})',
                        isbold: true),
                    Flexible(
                        child: SingleChildScrollView(
                      controller: _scrollController6,
                      child: Column(
                        children: [
                          _buildCells(
                              " ${tableTime.dataList[3].runningTime} min"),
                          _buildCells(
                              "${tableTime.dataList[3].joggingTime} min"),
                          _buildCells(
                              "${tableTime.dataList[3].exerciseTime} min"),
                          _buildCells(
                              "${tableTime.calculateTotalTimeByDate(tableTime.dataList[3].date)} min"),
                          _buildCells(
                              " ${tableTime.calculateTotalRTengagementbyDate(tableTime.dataList[3].date)} %"),
                          _buildCells(
                              " ${tableTime.calculateTotalJTEngagementByDate(tableTime.dataList[3].date)} %"),
                          _buildCells(
                              " ${tableTime.calculateTotalETengagementbyDate(tableTime.dataList[3].date)} %"),
                        ],
                      ),
                    ))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells(
                        'Thu (${formatDate(tableTime.dataList[4].date)})',
                        isbold: true),
                    Flexible(
                        child: SingleChildScrollView(
                      controller: _scrollController7,
                      child: Column(
                        children: [
                          _buildCells(
                              " ${tableTime.dataList[4].runningTime} min"),
                          _buildCells(
                              "${tableTime.dataList[4].joggingTime} min"),
                          _buildCells(
                              "${tableTime.dataList[4].exerciseTime} min"),
                          _buildCells(
                              "${tableTime.calculateTotalTimeByDate(tableTime.dataList[4].date)} min"),
                          _buildCells(
                              " ${tableTime.calculateTotalRTengagementbyDate(tableTime.dataList[4].date)} %"),
                          _buildCells(
                              " ${tableTime.calculateTotalJTEngagementByDate(tableTime.dataList[4].date)} %"),
                          _buildCells(
                              " ${tableTime.calculateTotalETengagementbyDate(tableTime.dataList[4].date)} %"),
                        ],
                      ),
                    ))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells(
                        'Fri (${formatDate(tableTime.dataList[5].date)})',
                        isbold: true),
                    Flexible(
                        child: SingleChildScrollView(
                      controller: _scrollController8,
                      child: Column(
                        children: [
                          _buildCells(
                              " ${tableTime.dataList[5].runningTime} min"),
                          _buildCells(
                              "${tableTime.dataList[5].joggingTime} min"),
                          _buildCells(
                              "${tableTime.dataList[5].exerciseTime} min"),
                          _buildCells(
                              "${tableTime.calculateTotalTimeByDate(tableTime.dataList[5].date)} min"),
                          _buildCells(
                              " ${tableTime.calculateTotalRTengagementbyDate(tableTime.dataList[5].date)} %"),
                          _buildCells(
                              " ${tableTime.calculateTotalJTEngagementByDate(tableTime.dataList[5].date)} %"),
                          _buildCells(
                              " ${tableTime.calculateTotalETengagementbyDate(tableTime.dataList[5].date)} %"),
                        ],
                      ),
                    ))
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildCells(
                        'Sat (${formatDate(tableTime.dataList[6].date)})',
                        isbold: true),
                    Flexible(
                        child: SingleChildScrollView(
                      controller: _scrollController9,
                      child: Column(
                        children: [
                          _buildCells(
                              " ${tableTime.dataList[6].runningTime} min"),
                          _buildCells(
                              "${tableTime.dataList[6].joggingTime} min"),
                          _buildCells(
                              "${tableTime.dataList[6].exerciseTime} min"),
                          _buildCells(
                              "${tableTime.calculateTotalTimeByDate(tableTime.dataList[6].date)} min"),
                          _buildCells(
                              " ${tableTime.calculateTotalRTengagementbyDate(tableTime.dataList[6].date)} %"),
                          _buildCells(
                              " ${tableTime.calculateTotalJTEngagementByDate(tableTime.dataList[6].date)} %"),
                          _buildCells(
                              " ${tableTime.calculateTotalETengagementbyDate(tableTime.dataList[6].date)} %"),
                        ],
                      ),
                    ))
                  ],
                ),
              ],
            ),
          ),
        )
      ],
    );
  }

  Widget _buildCells(String? text, {bool isbold = false}) {
    return Container(
      alignment: Alignment.center,
      width: 160.0,
      height: 80.0,
      margin: const EdgeInsets.all(1),
      decoration: BoxDecoration(
        color: !isbold ? Colors.white : Colors.green[300],
        border: Border.all(color: Colors.black, width: 1),
      ),
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Text(
          text!,
          style: TextStyle(
            fontSize: isbold ? 14 : 16,
            fontWeight: isbold ? FontWeight.bold : FontWeight.w500,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
