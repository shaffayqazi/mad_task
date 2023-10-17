import "package:flutter/material.dart";

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double? valueC = 10;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  bool? isSwitch = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView
      (
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            Slider(
              value: valueC!,
              onChanged: (onChanged) {
                setState(() {
                  valueC = onChanged;
                  print(valueC!.truncate());
                });
              },
              min: 0,
              max: 100,
            ),
            SizedBox(
              height: 50,
            ),
            Switch(
                value: isSwitch!,
                onChanged: (onChanged) {
                  setState(() {
                    isSwitch = onChanged;
                    print(isSwitch);
                  });
                }),
            SizedBox(
              height: 50,
            ),
            Text("Slider Value: ${valueC!.truncate()}"),
            SizedBox(
              height: 20,
            ),
            Text("Switch Value: ${isSwitch}"),
            SizedBox(
              height: 50,
            ),
            Form(
              key: formKey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter your name";
                        } else {
                          return null;
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.circular(10)),
                        hintText: "Enter your name",
                        labelText: "Name",
                      ),
                    ),
                  ),
                  TextFormField(
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please enter your age";
                      } else {
                        return null;
                      }
                    },
                    decoration: InputDecoration(
                      hintText: "Enter your age",
                      labelText: "Age",
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(onPressed: () {
                    
                      if (formKey.currentState!.validate()) {
                        print("Validated");
                      } else {
                        print("Not Validated");
                      }
                    
                  }, child: Text("Submit"))
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
