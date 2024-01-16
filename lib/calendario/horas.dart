import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  int horasUteis = 0;
  int horasInseridasValue = 0;

  var se = Servidor();
  late TextEditingController _horasController;

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    final firstDayOfMonth = DateTime(now.year, now.month, 1);
    final lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
    _selectedDay = now;
    _rangeStart = firstDayOfMonth;
    _rangeEnd = lastDayOfMonth;
    _calendarFormat = CalendarFormat.month;
    horasUteis = calcularHorasUteis(_rangeStart!, _rangeEnd!);
    _horasController = TextEditingController();
  }

  int calcularHorasUteis(DateTime start, DateTime end) {
    int horasUteis = 0;
    for (DateTime day = start;
        day.isBefore(end) || day.isAtSameMomentAs(end);
        day = day.add(Duration(days: 1))) {
      if (day.weekday != DateTime.saturday && day.weekday != DateTime.sunday) {
        horasUteis += 8;
      }
    }
    return horasUteis;
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
                rangeStartDay: _rangeStart,
                rangeEndDay: _rangeEnd,
                onPageChanged: (focusedDay) {
                  _rangeStart = focusedDay;
                  _rangeEnd = focusedDay;
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
                          SizedBox(width: 3),
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
                            'Horas úteis do mês: $horasUteis',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 16),
                          ),
                          SizedBox(width: 8),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Horas mensais efetuadas:',
                      style: TextStyle(
                        color: Color.fromARGB(255, 101, 101, 101),
                        fontSize: 16,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color.fromARGB(153, 238, 238, 238),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextField(
                              controller: _horasController,
                              keyboardType: TextInputType.number,
                              onChanged: (value) {
                                // Atualize horasInseridasValue quando o texto é alterado
                                setState(() {
                                  horasInseridasValue =
                                      int.tryParse(value) ?? 0;
                                });
                              },
                              decoration: InputDecoration(
                                hintText: 'Insira as horas mensais efetuadas',
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
                          ],
                        ),
                      ),
                    ),
                    Visibility(
                      visible: horasUteis != horasInseridasValue,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          horasInseridasValue != horasUteis
                              ? Padding(
                                  padding: const EdgeInsets.only(top: 8.0),
                                  child: Text(
                                    horasInseridasValue != horasUteis
                                        ? 'Parece que não tem as $horasUteis horas de trabalho deste mês.'
                                        : '',
                                    style: TextStyle(
                                        color: Colors.red, fontSize: 15),
                                  ),
                                )
                              : SizedBox(),
                          SizedBox(height: 10),
                          InkWell(
                            onTap: () {
                              _showModalInfoProfissional(context);
                            },
                            child: Row(
                              children: [
                                Text(
                                  'Insira as horas faltadas',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(width: 8),
                                Icon(Icons.add)
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        try {
                          horasInseridasValue =
                              int.tryParse(_horasController.text) ?? 0;

                          if (horasInseridasValue != horasUteis) {
                            setState(() {});
                            return;
                          }
                          DateTime dataAtual = DateTime.now();
                          String nomeMes =
                              DateFormat('MMMM', 'pt_BR').format(dataAtual);
                          int anoInsercao = dataAtual.year;

                          se.inserirHoras(
                            await se.obterTokenLocalmente(),
                            1,
                            '${dataAtual.year}-${dataAtual.month}-${dataAtual.day}',
                            nomeMes,
                            horasInseridasValue,
                            false,
                            anoInsercao,
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

Future<DateTime?> _selectDate(BuildContext context) async {
  DateTime currentDate = DateTime.now();
  DateTime? selectedDate = await showDatePicker(
    context: context,
    initialDate: currentDate,
    firstDate: DateTime(currentDate.year - 1),
    lastDate: DateTime(currentDate.year + 1),
  );
  return selectedDate;
}

void _showModalInfoProfissional(BuildContext context) {
  TextEditingController dataController = TextEditingController();
  TextEditingController horasController = TextEditingController();
  TextEditingController justificacaoController = TextEditingController();
  int horasFaltasValue = 0;

  var se = Servidor();

  showModalBottomSheet<void>(
    context: context,
    builder: (BuildContext context) {
      final screenWidth = MediaQuery.of(context).size.width;
      return SizedBox(
        height: 420,
        child: Container(
          padding: EdgeInsets.all(20),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: Text(
                  'Adicionar Faltas',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: dataController,
                readOnly: true,
                onTap: () async {
                  DateTime? selectedDate = await _selectDate(context);
                  if (selectedDate != null) {
                    dataController.text =
                        DateFormat('yyyy-MM-dd').format(selectedDate);
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Selecione a data',
                  labelText: 'Selecione a Data',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: horasController,
                keyboardType: TextInputType.number,
                onTap: () {
                  if (horasController.text == 'Insira as horas da falta') {
                    horasController.clear();
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Insira as horas faltadas',
                  labelText: 'Horas Faltadas',
                ),
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: justificacaoController,
                onTap: () {
                  if (justificacaoController.text ==
                      'Insira a justificação da falta') {
                    justificacaoController.clear();
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Insira a justificação da falta',
                  labelText: 'Justificação',
                ),
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () async {
                  try {
                    horasFaltasValue = int.tryParse(horasController.text) ?? 0;

                    se.inserirFaltas(
                      await se.obterTokenLocalmente(),
                      1,
                      dataController.text,
                      horasFaltasValue,
                      justificacaoController.text,
                      false,
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
      );
    },
  );
}
