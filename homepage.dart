import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {
  Dataservice data = Dataservice();
  AutoGenerate? response;
  weatherstatus? _status;
  @override
  void initState() {
    super.initState();
    data.gazetteered("karachi");
  }

  Future<void> getData() async {
    response = await data.gazetteered("karachi");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff0b2545),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: FutureBuilder(
            future: getData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return Stack(
                  children: [
                    Align(
                      alignment: Alignment(0.85, -0.85),
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                      ),
                    ),
                    Column(
                      children: [
                        SizedBox(
                          height: 110,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${response?.name}",
                              style: TextStyle(
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Icon(
                              Icons.location_on_sharp,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "${response?.main}",
                              style: GoogleFonts.dosis(
                                  fontSize: 100, color: Colors.white),
                            ),
                            Text(
                              "°",
                              style: GoogleFonts.dosis(
                                fontSize: 40,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              "c",
                              style: GoogleFonts.dosis(
                                  fontSize: 80, color: Colors.white),
                            ),
                          ],
                        ),
                        Text(
                          "${response?.main.tempMax}/${response?.main.tempMin}°C",
                          style: TextStyle(fontSize: 18, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.all(20.0),
                          child: Align(
                            alignment: Alignment(-0.5, 0),
                            child: Container(
                              child: Image.asset(
                                "assets/wind-turbine.png",
                                height: 100,
                                width: 100,
                              ),
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.only(top: 10),
                              child: Align(
                                alignment: Alignment(-0.7, 0.1),
                                child: Container(
                                    child: Text(
                                  "Wind\nDirection" + "            ",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                )),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.only(top: 40),
                              child: Align(
                                alignment: Alignment(-0.7, 0.3),
                                child: Container(
                                    child: Text(
                                  "Wind\nSpeed" +
                                      "            ${response?.wind}",
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.white),
                                )),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    // Container(
                    //     alignment: Alignment(-0.65, 0.7),
                    //     child: CircularPercentIndicator(
                    //       radius: 140,
                    //       animation: true,
                    //       animationDuration: 750,
                    //       lineWidth: 10,
                    //       percent: 0.4,
                    //       progressColor: Colors.white,
                    //       backgroundColor: Colors.grey.shade600,
                    //       circularStrokeCap: CircularStrokeCap.round,
                    //       center: Text(
                    //         "40%",
                    //         style: TextStyle(fontSize: 40, color: Colors.white),
                    //       ),
                    //     )),
                  ],
                );
              }
              return Container();
            }),
      ),
    );
  }
}
