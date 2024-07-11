import 'package:flutter/material.dart';

class PaymentStepsPage extends StatefulWidget {
  final String name;
  final String imagePath;

  PaymentStepsPage({required this.name, required this.imagePath});
  @override
  _PaymentStepsPageState createState() => _PaymentStepsPageState();
}

class _PaymentStepsPageState extends State<PaymentStepsPage> {
  int _currentStep = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Steps'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children:[
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Image.asset(
                widget.imagePath,
                width: 100,
                height: 100,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(widget.name)
            ),
             Stepper(
            currentStep: _currentStep,
            onStepContinue: () {
              setState(() {
                if (_currentStep < 5) {
                  _currentStep++;
                } else {
                  // All steps completed
                  // Perform payment confirmation or other actions
                }
              });
            },
            onStepCancel: () {
              setState(() {
                if (_currentStep > 0) {
                  _currentStep--;
                }
              });
            },
            steps: <Step>[
              Step(
                title: const Text('Step 1'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Open ${widget.name} mobile banking application.'),
                    Text('Enter your PIN'),
                  ],
                ),
              ),
              Step(
                title: const Text('Step 2'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Tap Utilities'),
                  ],
                ),
              ),
              Step(
                title: const Text('Step 3'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Tap Utilities Payment'),
                  ],
                ),
              ),
              Step(
                title: const Text('Step 4'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Tap WebiRR'),
                  ],
                ),
              ),
              Step(
                title: const Text('Step 5'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Enter Payment Code'),
                  ],
                ),
              ),
              Step(
                title: const Text('Step 6'),
                content: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Confirm the Payment'),
                  ],
                ),
              ),
            ],
          ),
          ],
        ),
      ),
    );
  }
}