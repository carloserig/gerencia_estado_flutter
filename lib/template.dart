import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_default_state_manager/setState/widgets/imc_gauge.dart';
import 'package:flutter_default_state_manager/setState/widgets/imc_gauge_range.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class ImcSetstatePage extends StatefulWidget {

  const ImcSetstatePage({ Key? key }) : super(key: key);

  @override
  State<ImcSetstatePage> createState() => _ImcSetstatePageState();
}

class _ImcSetstatePageState extends State<ImcSetstatePage> {

   final pesoEC = TextEditingController();
   final alturaEC = TextEditingController();

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
               child: Padding(
                 padding: const EdgeInsets.all(8.0),
                 child: Column(
                   children: [
                     ImcGauge(imc: 0),
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
                     ),
                     SizedBox(height: 20,),
                     ElevatedButton(
                       onPressed: () {}, 
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