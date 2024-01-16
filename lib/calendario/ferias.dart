// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import '../servidor/servidor.dart';

class FeriasPage extends StatefulWidget {
  const FeriasPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<FeriasPage> createState() => _FeriasPageState();
}

class _FeriasPageState extends State<FeriasPage> {
  late DateTime _selectedDay;
  late DateTime? _rangeStart;
  late DateTime? _rangeEnd;
  late CalendarFormat _calendarFormat;
  late RangeSelectionMode _rangeSelectionMode;

  TextEditingController _startDateController = TextEditingController();
  TextEditingController _endDateController = TextEditingController();

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

    _startDateController.text = '';
    _endDateController.text = '';
  }

  void _onDaySelected(DateTime selectedDay, DateTime? focusedDay) {
    final DateTime today = DateTime.now();

    setState(() {
      _selectedDay = selectedDay;
      _rangeStart = focusedDay ?? selectedDay;
      _rangeEnd = focusedDay ?? selectedDay;

      _startDateController.text = DateFormat('dd/MM/yyyy').format(_rangeStart!);
      _endDateController.text = DateFormat('dd/MM/yyyy').format(_rangeEnd!);
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
                    _rangeStart = start ?? DateTime.now();
                    if (end != null) {
                      if (_rangeEnd != end) {
                        _rangeEnd = end;
                        _endDateController.text =
                            DateFormat('dd/MM/yyyy').format(_rangeEnd!);
                      }
                    }
                    _selectedDay = focusedDay ?? DateTime.now();
                    _startDateController.text =
                        DateFormat('dd/MM/yyyy').format(_rangeStart!);
                  });
                },
                enabledDayPredicate: (day) {
                  final DateTime today = DateTime.now();
                  final DateTime startDateRestriction =
                      today.add(Duration(days: 7));

                  return !day.isBefore(startDateRestriction);
                },
                availableCalendarFormats: const {
                  CalendarFormat.month: 'Mês',
                },
                onPageChanged: (focusedDay) {
                  _rangeStart = focusedDay;
                  _rangeEnd = focusedDay;
                  _selectedDay = focusedDay;
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
                      width: screenWidth - 100,
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
                            'Data de Início:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          SizedBox(
                            width: screenWidth - 250,
                            child: TextFormField(
                              controller: _startDateController,
                              readOnly: true,
                              onTap: () {
                                // Lógica para abrir o calendário ou selecionar a data
                                // Isso pode variar dependendo da sua implementação
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'DD/MM/AAAA',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    Container(
                      width: screenWidth - 100,
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
                            'Data de Fim:',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(width: 8),
                          SizedBox(
                            width: screenWidth - 250,
                            child: TextFormField(
                              controller: _endDateController,
                              readOnly: true,
                              onTap: () {
                                // Lógica para abrir o calendário ou selecionar a data
                                // Isso pode variar dependendo da sua implementação
                              },
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: 'DD/MM/AAAA',
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          final DateFormat inputFormat =
                              DateFormat('dd/MM/yyyy');
                          final DateFormat outputFormat =
                              DateFormat('yyyy-MM-dd');

                          // Formatando as datas para o formato desejado
                          final String startDateFormatted = outputFormat.format(
                              inputFormat.parse(_startDateController.text));
                          final String endDateFormatted = outputFormat.format(
                              inputFormat.parse(_endDateController.text));
                          final String currentDateFormatted =
                              outputFormat.format(DateTime.now());

                          se.inserirFerias(
                            await se.obterTokenLocalmente(),
                            1,
                            startDateFormatted,
                            endDateFormatted,
                            currentDateFormatted,
                            false,
                          );
                        } catch (e) {
                          print('Erro ao enviar férias: $e');
                          showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                title: Text('Erro ao enviar férias'),
                                content: Text(
                                    'Ocorreu um erro ao enviar a submissão de férias.'),
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
