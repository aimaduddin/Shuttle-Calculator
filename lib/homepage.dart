import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  final _formKey = GlobalKey<FormState>();
  final hallC = TextEditingController();
  final playersC = TextEditingController();
  final shuttleC = TextEditingController();
  final priceShutttleC = TextEditingController();

  double total = 0.00;

  int typeOfCalculationRadio = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1D191C),
      body: SingleChildScrollView(
        child: Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.fromLTRB(30, 80, 30, 0),
          child: Column(
            children: [
              // Main Title
              Text(
                'Shuttle Calculator',
                style: GoogleFonts.montserrat(
                    fontSize: 40.0,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              // Apps description
              Padding(
                padding: const EdgeInsets.only(left: 47, right: 47),
                child: Text(
                  'This app is to calculate total fees, need to pay by each players',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.montserrat(
                      fontSize: 16.0,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              // Form Fields
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 15.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      RowTextInput(
                          label: 'Hall',
                          textController: hallC,
                          errorMessage: 'Please enter hall fees in RM',
                          hintText: '30.00'),
                      SizedBox(
                        height: 30,
                      ),
                      RowTextInput(
                        label: 'Players',
                        textController: playersC,
                        errorMessage: 'Please enter how many players played',
                        hintText: '10',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RowTextInput(
                        label: 'Shuttle',
                        textController: shuttleC,
                        errorMessage: 'Please enter quantity shuttlecocks used',
                        hintText: '3',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      RowTextInput(
                        label: 'Price / Shuttle',
                        textController: priceShutttleC,
                        errorMessage: 'Please enter price per shuttlecock',
                        hintText: '2.00',
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [individualRB(), groupRB()],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          resetButton(),
                          calculateButton(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'TOTAL (RM)',
                style:
                    GoogleFonts.montserrat(fontSize: 14, color: Colors.white),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                total.toStringAsFixed(2),
                style: GoogleFonts.montserrat(
                    fontSize: 50,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Developed By : Aima Aimaduddin bin Bollhasan',
                style: GoogleFonts.montserrat(
                  fontSize: 13,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Container calculateButton() {
    return Container(
      height: 50,
      width: 150,
      child: RaisedButton(
        onPressed: () => calculation(typeOfCalculationRadio),
        color: Color(0xff28A745),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'CALCULATE',
          style: GoogleFonts.montserrat(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Container resetButton() {
    return Container(
      height: 50,
      width: 150,
      child: RaisedButton(
        onPressed: () {
          resetFormFields();
        },
        color: Color(0xffDC3545),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30.0),
        ),
        child: Text(
          'RESET',
          style: GoogleFonts.montserrat(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Container groupRB() {
    return Container(
      child: Row(
        children: [
          Text(
            'Group',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Radio(
              value: 2,
              groupValue: typeOfCalculationRadio,
              onChanged: (value) {
                setState(() {
                  typeOfCalculationRadio = value;
                });
              }),
        ],
      ),
    );
  }

  Container individualRB() {
    return Container(
      child: Row(
        children: [
          Text(
            'Individual',
            style: GoogleFonts.montserrat(
              fontSize: 18,
              color: Colors.white,
            ),
          ),
          Radio(
              value: 1,
              groupValue: typeOfCalculationRadio,
              onChanged: (value) {
                setState(() {
                  typeOfCalculationRadio = value;
                });
              }),
        ],
      ),
    );
  }

  void resetFormFields() {
    hallC.clear();
    playersC.clear();
    shuttleC.clear();
    priceShutttleC.clear();
    setState(() {
      total = 0.0;
    });
  }

  void calculation(int typeOfCalculation) {
    if (_formKey.currentState.validate()) {
      setState(() {
        double hall, priceShuttle;
        int players, shuttle;
        hall = double.parse(hallC.text);
        priceShuttle = double.parse(priceShutttleC.text);
        players = int.parse(playersC.text);
        shuttle = int.parse(shuttleC.text);

        if (typeOfCalculation == 1) {
          total = hall / players + (shuttle * priceShuttle);
        } else {
          total = (hall + (shuttle * priceShuttle)) / players;
        }
      });
    }
  }
}

class RowTextInput extends StatelessWidget {
  const RowTextInput({
    Key key,
    @required this.textController,
    @required this.errorMessage,
    @required this.hintText,
    @required this.label,
  }) : super(key: key);

  final TextEditingController textController;
  final String errorMessage;
  final String hintText;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      child: Row(
        children: [
          Expanded(
            child: Text(
              '$label : ',
              textAlign: TextAlign.center,
              style: GoogleFonts.montserrat(
                  fontSize: 20.0,
                  fontWeight: FontWeight.w600,
                  color: Colors.white),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: textController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value.isEmpty) {
                  return errorMessage;
                }
                return null;
              },
              style: GoogleFonts.montserrat(
                fontSize: 16.0,
                color: Colors.white,
              ),
              decoration: InputDecoration(
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xff707070),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Color(0xffADD7F6),
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.red,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                hintText: hintText,
                hintStyle: GoogleFonts.montserrat(
                  fontSize: 16.0,
                  fontWeight: FontWeight.w300,
                  color: Color(0xffA9A9A9),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
