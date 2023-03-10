import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

class AddRecordPageContent extends StatefulWidget {
  const AddRecordPageContent({
    super.key,
    required this.onSave,
  });

  final Function onSave;

  @override
  State<AddRecordPageContent> createState() => _AddRecordPageContentState();
}

class _AddRecordPageContentState extends State<AddRecordPageContent> {
  var plantName = '';
  var fieldArea = '';
  var fieldNumber = '';
  var protectionArea = '';
  var recordDate = '';
  var productName = '';
  var dose = '';
  var treatmentCouse = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              // TextField(
              //   keyboardType: TextInputType.multiline,
              //   minLines: 1,
              //   maxLines: 5,
              //   decoration: const InputDecoration(
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.all(
              //         Radius.circular(20),
              //       ),
              //     ),
              //     hintText: 'Podaj datę i godzinę zabiegu',
              //   ),
              //   onChanged: (newValue) {
              //     setState(() {
              //       recordDate = newValue;
              //     });
              //   },
              // ),
              //
              DateTimePicker(
                initialValue: '',
                icon: const Icon(Icons.date_range_outlined),
                firstDate: DateTime(2000),
                lastDate: DateTime(2100),
                dateLabelText: 'Wybierz datę',
                onChanged: (newValue) {
                  setState(() {
                    recordDate = newValue;
                  });
                },
                validator: (val) {
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  hintText: 'Podaj nazwę rośliny',
                ),
                onChanged: (newValue) {
                  setState(() {
                    plantName = newValue;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  hintText: 'Numer ewid. działki/pola',
                ),
                onChanged: (newValue) {
                  setState(() {
                    fieldNumber = newValue;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  hintText: 'Podaj powierzchnię uprawy',
                ),
                onChanged: (newValue) {
                  setState(() {
                    fieldArea = newValue;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  hintText: 'Podaj powierzchnię wykonania zabiegu',
                ),
                onChanged: (newValue) {
                  setState(() {
                    protectionArea = newValue;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  hintText: 'Podaj nazwę zastosowanego środka',
                ),
                onChanged: (newValue) {
                  setState(() {
                    productName = newValue;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  hintText: 'Podaj dawkę ś.o.r. kg/l',
                ),
                onChanged: (newValue) {
                  setState(() {
                    dose = newValue;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                decoration: const InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  hintText: 'Podaj przyczynę zastosowania ś.o.r',
                ),
                onChanged: (newValue) {
                  setState(() {
                    treatmentCouse = newValue;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              ElevatedButton(
                onPressed: plantName.isEmpty ||
                        fieldArea.isEmpty ||
                        protectionArea.isEmpty ||
                        recordDate.isEmpty ||
                        productName.isEmpty ||
                        dose.isEmpty ||
                        treatmentCouse.isEmpty
                    ? null
                    : () {
                        FirebaseFirestore.instance.collection('records').add({
                          'recordDate': recordDate,
                          'plantName': plantName,
                          'fieldNumber': fieldNumber,
                          'fieldArea': fieldArea,
                          'protectionArea': protectionArea,
                          'productName': productName,
                          'dose': dose,
                          'treatmentCouse': treatmentCouse,
                        });
                        widget.onSave();
                      },
                child: const Text('Dodaj'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
