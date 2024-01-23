import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../servidor/servidor.dart';

class ReuniaoPage extends StatefulWidget {
  const ReuniaoPage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<ReuniaoPage> createState() => _ReuniaoPageState();
}

class _ReuniaoPageState extends State<ReuniaoPage> {
  late DateTime _selectedDay;
  late CalendarFormat _calendarFormat;

  TextEditingController motivoController = TextEditingController();
  TextEditingController diaController = TextEditingController();
  TextEditingController horaController = TextEditingController();

  var se = Servidor();
  late String selectedTime = 'Selecione';

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    _selectedDay = now.add(Duration(days: 1));
    _calendarFormat = CalendarFormat.month;
    selectedTime = 'Selecione';
  }

  void _onDaySelected(DateTime selectedDay, DateTime? focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      diaController.text = selectedDay.toString();
    });
  }

  List<String> _generateTimeItems() {
    List<String> timeItems = ['Selecione'];
    for (int hour = 9; hour <= 17; hour++) {
      for (int minute = 0; minute < 60; minute += 30) {
        String hourStr = hour.toString().padLeft(2, '0');
        String minuteStr = minute.toString().padLeft(2, '0');
        timeItems.add('$hourStr:$minuteStr');
      }
    }
    return timeItems;
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF32D700),
        title: Text('Reunião',style: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Container(
            width: screenWidth,
            padding: EdgeInsets.all(25),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TableCalendar(
                  calendarFormat: _calendarFormat,
                  focusedDay: _selectedDay,
                  firstDay: DateTime.now().add(Duration(days: 1)),
                  lastDay: DateTime.now().add(Duration(days: 365)),
                  selectedDayPredicate: (day) {
                    return isSameDay(_selectedDay, day);
                  },
                  onDaySelected: _onDaySelected,
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
                          color: Colors
                              .green,
                          shape: BoxShape.circle,
                        ),
                        child: Text(
                          date.day.toString(),
                          style: TextStyle(color: Colors.white),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 30),
                Container(
                  width: screenWidth - 50,
                  padding: EdgeInsets.only(left: 10),
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
                        'Horário',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                DropdownButton<String>(
                  padding: EdgeInsets.only(left: 35),
                  hint: Text('Horário'),
                  value: selectedTime,
                  onChanged: (String? newValue) {
                    setState(() {
                      selectedTime = newValue!;
                      horaController.text = selectedTime;
                    });
                  },
                  items: _generateTimeItems().map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Center(
                        child: Text(
                          value,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    );
                  }).toList(),
                ),
                SizedBox(height: 20),
                Container(
                  width: screenWidth - 50,
                  padding: EdgeInsets.only(left: 10),
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
                        'Motivo',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(153, 238, 238, 238),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  child: TextFormField(
                    controller: motivoController,
                    maxLines: null,
                    keyboardType: TextInputType.multiline,
                    decoration: InputDecoration(
                      hintText: 'Escreva o motivo da reunião...',
                      hintStyle: TextStyle(
                        color: const Color(0xFFBDBDBD),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 14),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                SizedBox(height: 30),
                ElevatedButton(
                  onPressed: () async {
                    if (!diaController.text.isNotEmpty ||
                        !motivoController.text.isNotEmpty ||
                        !horaController.text.isNotEmpty) {
                      final snackBar = SnackBar(
                        content:
                            Text('Preencha todos os campos antes de enviar.'),
                      );
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      return;
                    }

                    try {
                      await se.inserirReuniao(
                        await se.obterTokenLocalmente(),
                        diaController.text,
                        motivoController.text,
                        horaController.text,
                      );

                      setState(() {
                        diaController.clear();
                        motivoController.clear();
                        horaController.clear();
                        _selectedDay = DateTime.now().add(Duration(days: 1));
                        selectedTime = 'Selecione';
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Reunião marcada com sucesso!'),
                        ),
                      );
                    } catch (e) {
                      print('Erro ao criar reunião: $e');
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Erro ao criar Reunião!'),
                            content: Text(
                                'Dados inválidos para a criação de uma reunião.',
                                style: TextStyle(fontSize: 17)),
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
                        'Marcar Reunião',
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
                SizedBox(height: 90)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
