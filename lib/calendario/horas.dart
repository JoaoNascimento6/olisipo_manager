import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../servidor/servidor.dart';

class HorasPage extends StatefulWidget {
  const HorasPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<HorasPage> createState() => _HorasPageState();
}

class _HorasPageState extends State<HorasPage> {
  late DateTime _selectedDay;
  late DateTime? _rangeStart;
  late DateTime? _rangeEnd;
  late CalendarFormat _calendarFormat;
  late RangeSelectionMode _rangeSelectionMode;

  var se = Servidor();

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedDay = now;
    _rangeStart = now;
    _rangeEnd = now;
    _calendarFormat = CalendarFormat.month;
    _rangeSelectionMode = RangeSelectionMode.toggledOn;
  }

  void _onDaySelected(DateTime selectedDay, DateTime? focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _rangeStart = focusedDay ?? selectedDay;
      _rangeEnd = focusedDay ?? selectedDay;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Center(
        child: Container(
          width: screenWidth - 30,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              TableCalendar(
                calendarFormat: _calendarFormat,
                focusedDay: _selectedDay,
                firstDay: DateTime.now().subtract(Duration(days: 365)),
                lastDay: DateTime.now().add(Duration(days: 365)),
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                rangeSelectionMode: _rangeSelectionMode,
                onDaySelected: _onDaySelected,
                onRangeSelected: (start, end, focusedDay) {
                  setState(() {
                    _rangeStart = start;
                    _rangeEnd = end;
                    _selectedDay = focusedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  _rangeStart = focusedDay;
                  _rangeEnd = focusedDay;
                  _selectedDay = focusedDay;
                },
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Mês',
                },
                headerStyle: HeaderStyle(
                  titleCentered: true,
                ),
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                calendarBuilders: CalendarBuilders(
                  selectedBuilder: (context, date, events) {
                    return Container(
                      margin: const EdgeInsets.all(4.0),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color:
                            Colors.green, // Cor de fundo para data selecionada
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        date.day.toString(),
                        style: TextStyle(color: Colors.white),
                      ),
                    );
                  },
                ),
                calendarStyle: CalendarStyle(
                  selectedDecoration: BoxDecoration(
                    color: Colors.green, // Cor de fundo para data selecionada
                    shape: BoxShape.circle,
                  ),
                  rangeStartDecoration: BoxDecoration(
                    color: Colors.green, // Cor para o início do intervalo
                    shape: BoxShape.circle,
                  ),
                  rangeEndDecoration: BoxDecoration(
                    color: Colors.green, // Cor para o fim do intervalo
                    shape: BoxShape.circle,
                  ),
                  rangeHighlightColor: Colors.green
                      .withOpacity(0.2), // Cor para destacar o intervalo
                ),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: screenWidth - 50,
                      decoration: BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: Colors.green,
                            width: 1.0,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          SizedBox(width: 16),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF32D700),
                            ),
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Horas em Trabalho:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          SizedBox(
                            width: screenWidth - 300,
                            child: TextFormField(
                              readOnly: true,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Horas',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 30),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          se.inserirHoras(
                            1,
                            '2023-12-18',
                            'Novembro',
                            "11:00:00",
                            false,
                            2023,
                          );
                        } catch (e) {
                          print('Erro ao enviar horas: $e');
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Erro ao enviar horas'),
                                content: Text(
                                    'Ocorreu um erro ao enviar a submissão de horas.'),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text('OK'),
                                  ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100),
                        ),
                      ),
                      child: Ink(
                        width: screenWidth - 60,
                        height: 52,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: const Color(0xFF32D700),
                        ),
                        child: Center(
                          child: Text(
                            'Enviar',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
