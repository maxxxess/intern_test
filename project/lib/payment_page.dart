import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'package:project/const.dart';
import 'package:project/model/dropdown.dart';
import 'package:project/pages/details.dart';
import 'package:project/pages/slippage.dart';
import 'package:slide_to_act/slide_to_act.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({super.key, this.crypto_listMap});

  final Map<String, dynamic>? crypto_listMap;
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    fetchData();
    super.initState();
  }

  Map<String, dynamic>? crypto_listMap;

  void fetchData() async {
    String link = "http://139.59.57.191:5000/user/getCryptoList";
    var responce = await http.get(Uri.parse(link));
    crypto_listMap = Map<String, dynamic>.from(jsonDecode(responce.body));
    setState(() {});
    print("PRINTTTTTTT${crypto_listMap!["status"]}");
  }

  String? dropdownValue;
  @override
  Widget build(BuildContext context) {
    return crypto_listMap != null
        ? Scaffold(
            backgroundColor: kPrimarybackgroundColor,
            appBar: AppBar(
              leading: IconButton(
                  onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
            body: Column(
              children: [
                Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                  children: [
                    Text('Swap ETH',
                        style: mystyle(20, Colors.white, FontWeight.w600)),
                    Text(
                      'Ethereum Mainnet',
                      style: mystyle(14, Colors.white, FontWeight.w400),
                    )
                  ],
                  
                ),SizedBox(height: 10,),
                Column(
                  children: [
                    Stack(
                      alignment: Alignment.topCenter,
                      children: [
                        Column(
                          children: [
                            Container(
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                margin: EdgeInsets.symmetric(horizontal: 24),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: kPrimaryborderColor),
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.transparent),
                                height:
                                    MediaQuery.of(context).size.height * 0.14,
                                width: MediaQuery.of(context).size.width,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            CircleAvatar(
                                                backgroundImage: NetworkImage(
                                                    '${crypto_listMap?["data"][1]["icon"]}'),
                                                radius: 18),
                                            Text(
                                              '  ${crypto_listMap?["data"][1]["code"]}',
                                              style: mystyle(15, Colors.white,
                                                  FontWeight.w600),
                                            ),
                                            MyDropdownButton()
                                          ],
                                        ),
                                        Column(
                                          children: [
                                            Text(
                                              '${crypto_listMap?["data"][1]["price"]}',
                                              style: mystyle(15, Colors.white,
                                                  FontWeight.w600),
                                            ),
                                            Text(
                                              '₹0.00',
                                              style: mystyle(12, Colors.white,
                                                  FontWeight.w400),
                                            )
                                          ],
                                        )
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          'Balance:0',
                                          style: mystyle(12, Colors.white,
                                              FontWeight.w300),
                                        )
                                      ],
                                    )
                                  ],
                                )),
                            Container(
                              padding: EdgeInsets.symmetric(
                                  vertical: 20, horizontal: 10),
                              margin:
                                  EdgeInsets.only(top: 10, left: 20, right: 20),
                              decoration: BoxDecoration(
                                  border:
                                      Border.all(color: kPrimaryborderColor),
                                  borderRadius: BorderRadius.circular(18),
                                  color: Colors.transparent),
                              height: MediaQuery.of(context).size.height * 0.14,
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          CircleAvatar(
                                              backgroundImage: NetworkImage(
                                                  '${crypto_listMap?["data"][4]["icon"]}'),
                                              radius: 18),
                                          Text(
                                            '  ${crypto_listMap?["data"][4]["code"]}',
                                            style: mystyle(15, Colors.white,
                                                FontWeight.w600),
                                          ),
                                        ],
                                      ),
                                      CircularProgressIndicator()
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Text(
                                        'Balance:0',
                                        style: mystyle(
                                            12, Colors.white, FontWeight.w300),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                        Positioned(
                          child: updown(),
                          top: 95,
                        )
                      ],
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(top: 77, bottom: 10),
                  child: TabBar(
                    labelColor: Colors.white,
                    controller: tabController,
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    tabs: [
                      Tab(
                        text: 'SLIPPAGE',
                      ),
                      Tab(
                        text: 'DETAILS',
                      )
                    ],
                  ),
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 25),
                    margin: EdgeInsets.symmetric(horizontal: 20),
                    decoration: BoxDecoration(
                        border: Border.all(color: Color(0XFF191B1F)),
                        borderRadius: BorderRadius.circular(16)),
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: MediaQuery.of(context).size.width,
                    child: TabBarView(
                      controller: tabController,
                      children: [
                        Slippage(
                          tabController: tabController,
                        ),
                        Details()
                      ],
                    )),
                Container(
                    margin: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.transparent,
                        border: Border.all(
                          width: 1,
                          color: Color(0XFF3E4355),
                        ),
                        borderRadius: BorderRadius.circular(69)),
                    child: SlideAction(
                      onSubmit: () {
                        showModalBottomSheet(
                          backgroundColor: Colors.transparent,
                          context: context,
                          builder: (BuildContext context) {
                            return Container(
                              decoration: BoxDecoration(
                                  color: Color(0xff222529),
                                  borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(24),
                                      topRight: Radius.circular(24))),
                              height: 400,
                              child: Center(
                                child: Column(
                                  children: [
                                    Container(
                                     padding: EdgeInsets.symmetric(horizontal: 20),
                                      margin:
                                          EdgeInsets.symmetric(vertical: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'Select an asset',
                                            style: mystyle(20, Colors.white,
                                                FontWeight.w500),
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              Navigator.of(context).pop();
                                            },
                                            icon: Icon(Icons.close),
                                            iconSize: 15,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: TextField(
                                        style: TextStyle(color: Colors.white),
                                        decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(27),
                                          ),
                                          prefixIcon: Icon(Icons.search),
                                          prefixIconColor: Color(0xff656565),
                                          hintText: 'Search',
                                          fillColor: Colors.black,
                                          filled: true,
                                        ),
                                        textAlign: TextAlign.start,
                                      ),
                                    ),
                                    ListView.builder(
                                      shrinkWrap: true,
                                      itemCount: crypto_listMap?.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder: (context, index) {
                                        return GestureDetector(
                                          onTap: () {},
                                          child: ListTile(
                                            leading: CircleAvatar(
                                              radius: 18,
                                              backgroundImage: NetworkImage(
                                                  "${crypto_listMap!["data"][index]["icon"]}"),
                                            ),
                                            title: Text(
                                              ' ${crypto_listMap?["data"][index]["name"]}',
                                              style: mystyle(17, Colors.white,
                                                  FontWeight.w400),
                                            ),
                                            subtitle: Text(
                                              '  ${crypto_listMap?["data"][index]["code"]}',
                                              style: mystyle(11, Colors.white,
                                                  FontWeight.w400),
                                            ),
                                            trailing: Text(
                                              ' ₹${crypto_listMap?["data"][index]["price"]}',
                                              style: mystyle(15, Colors.white,
                                                  FontWeight.w400),
                                            ),
                                          ),
                                        );
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        );
                      },
                      innerColor: kPrimarybackgroundColor,
                      outerColor: Color(0xff37CBFA),
                      elevation: 8,
                      text: 'Slide to Pay',
                    )),
              ],
            ),
          )
        : CircularProgressIndicator();
  }
}

class updown extends StatelessWidget {
  const updown({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: Color(0Xff2B93B5), borderRadius: BorderRadius.circular(100)),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.arrow_upward,
              size: 20,
            ),
            Icon(
              Icons.arrow_downward,
              size: 20,
            )
          ],
        ),
      ),
    );
  }
}
