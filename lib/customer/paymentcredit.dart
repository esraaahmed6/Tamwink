import 'package:credit_card/credit_card_form.dart';
import 'package:credit_card/credit_card_model.dart';
import 'package:credit_card/credit_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';


class Payment extends StatefulWidget {
  static const routePay= '/payment-screen';
  @override
  State<StatefulWidget> createState() => _PaymentState();

}
class _PaymentState extends State<Payment> {
  String cardNumber= '';
  String expiryData = '';
  String cardHolderName = '';
  String cvvCode = '';
  bool isCvvFocused=false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return
      Directionality( textDirection: TextDirection.rtl,
        child:
        Scaffold(
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: Column(
              children: <Widget>[
                CreditCardWidget(cardNumber: cardNumber, expiryDate: expiryData, cardHolderName: cardHolderName, cvvCode: cvvCode, showBackView: isCvvFocused,
                  height: 200,
                  width: MediaQuery.of(context).size.width,
                  animationDuration: Duration(microseconds: 1000),

                ),
                new OutlineButton(
                  onPressed: null,
                  child: Text(
                    'تأكيد عملية الدفع',
                    style: TextStyle(color: Colors.orange[900]),
                  ),
                  shape: new RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                ),
                Expanded(child: SingleChildScrollView(
                  child: CreditCardForm(onCreditCardModelChange: onChange),
                ),
                ),

              ],
            ),

          ),
        ),
      );
  }
  void onChange(CreditCardModel model){
    setState(() {
      cardNumber= model.cardNumber;
      expiryData = model.expiryDate;
      cardHolderName = model.cardNumber;
      cvvCode= model.cvvCode;
      isCvvFocused = model.isCvvFocused;
    });
  }
}