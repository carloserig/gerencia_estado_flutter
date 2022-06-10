import 'dart:math';

import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_default_state_manager/setState/widgets/imc_gauge.dart';
import 'package:flutter_default_state_manager/setState/widgets/imc_gauge_range.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcSetstatePage extends StatefulWidget {

  const ImcSetstatePage({ Key? key }) : super(key: key);

  @override
  State<ImcSetstatePage> createState() => _ImcSetstatePageState();
}

class _ImcSetstatePageState extends State<ImcSetstatePage> {

   final pesoEC = TextEditingController();
   final alturaEC = TextEditingController();
   final formKey = GlobalKey<FormState>();
   var imc = 0.0;

   Future<void> _calcularIMC({required double peso, required double altura}) async {
     setState(() {
       imc = 0.0;
     });
    
    await Future.delayed(Duration(seconds: 1));

     setState(() {
       imc = peso/pow(altura, 2);
     });
   }

   @override
   void dispose() {
     pesoEC.dispose();
     alturaEC.dispose();
     super.dispose();
   }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
           appBar: AppBar(title: const Text('Imc SetState'),),
           body: SingleChildScrollView(
             child: Form(
               key: formKey,
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                     ImcGauge(imc: imc),
                     SizedBox(height: 20,),
                     TextFormField(
                       controller: pesoEC,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(labelText: 'Peso'),
                       inputFormatters: [
                         CurrencyTextInputFormatter(
                           locale: 'pr_BR',
                           symbol: '',
                           turnOffGrouping: true,
                           decimalDigits: 2,
                         ),
                       ],
                       validator: (String? value) {
                         if (value == null || value.isEmpty) {
                           return 'Peso obrigatório';
                         }
                       }
                     ),
                     TextFormField(
                       controller: alturaEC,
                       keyboardType: TextInputType.number,
                       decoration: InputDecoration(labelText: 'Altura'),
                       inputFormatters: [
                         CurrencyTextInputFormatter(
                           locale: 'pr_BR',
                           symbol: '',
                           turnOffGrouping: true,
                           decimalDigits: 2,
                         ),
                       ],
                       validator: (String? value) {
                         if (value == null || value.isEmpty) {
                           return 'Altura obrigatório';
                         }
                       }
                     ),
                     SizedBox(height: 20,),
                     ElevatedButton(
                       onPressed: () {
                        var formValid = formKey.currentState?.validate() ?? false;
                        if (formValid) {
                          var formater = NumberFormat.simpleCurrency(
                            locale: 'pt_BR', decimalDigits: 2);
                          double peso = formater.parse(pesoEC.text) as double;
                          double altura = formater.parse(alturaEC.text) as double;
                          _calcularIMC(peso: peso, altura: altura);
                        }
                       }, 
                       child: Text('Calcular IMC'),
                       ),
                   ],
                 )
               ),
             ),
           ),
       );
  }
}