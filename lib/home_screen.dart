import 'package:flutter/material.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  int count = 0; // هذا الكونتر
  Counter() {
    // داله الكونتر وظيفتها تزيد الكونتر بواحد كل مره
    setState(() {
      // تسوي تحديث كل مره كل ما لف
      count++;
    });
  }

  reset() {
    // داله تسوي ريست ترجع الكونت بصفر
    setState(() {
      count = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(207, 225, 221, 221), // لون الخلفيه
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 2, 2, 2), // هذا لون البار المستطيل الي فوق
        centerTitle: true,
        title: Text(
          "اسْتَغْفِرُوا رَبَّكُمْ إِنَّهُ كَانَ غَفَّارًا ",
          style: TextStyle(
              fontSize: 25, color: Colors.white, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container( // Determine the width and height of the screen based on the real width of the screen 
                  width: MediaQuery.of(context).size.width / 1.50, // this line of code responsible of the 
                  height: MediaQuery.of(context).size.height / 1.50,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(143, 122, 122, 118),
                    shape: BoxShape.circle, // give the circle shape 
                    boxShadow: [ //shadow for our circle 
                      BoxShadow(
                        offset: Offset(1, 9), //
                        blurRadius: 20,
                      ),
                    ],
                  ),
                  child: Center(
                    // this part of code responsible for the counter part in the App
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 40,
                          vertical:
                              30), // السيمتريك هنا تتحكم بالبادينق بمحور الاكس و الواي
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20), //يسوي الحواف
                          color: const Color.fromARGB(184, 255, 255, 255)),
                      child: Text(
                        count.toString(), // Convert count to string 
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Transform.translate( // move the circle around easily 
                  offset: Offset(1, 9), // value here is deafult
                  child: Container(
                    width: 170,
                    height: 160,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        ),
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(1, 9),
                              blurRadius: 20,
                              color: Colors.black),
                        ]),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton( // the arrow button 
                          onPressed: () => Counter(), // call the functin Counter to count 
                          child: Container(
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 17, 17, 17),
                              shape: BoxShape.circle,
                            ),
                          ),
                          style: ElevatedButton.styleFrom( // style always come with ElevatedButton
                              maximumSize: Size(80, 80)),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                              onPressed: () => reset(),//call function to reset the counter
                              child: Icon(Icons.wifi_protected_setup),// icon of the reset 
                              style: ElevatedButton.styleFrom(
                                  foregroundColor: Color.fromARGB(255, 23, 22, 22)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
