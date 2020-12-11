import 'package:bookingsAfricaApp/core/enum/view_state.dart';
import 'package:bookingsAfricaApp/ui/shared/ui_helper.dart';
import 'package:bookingsAfricaApp/ui/view_model.dart/base_view_model.dart';
import 'package:bookingsAfricaApp/ui/view_model.dart/home_screenVm.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return BaseViewModel<HomeScreenVM>(
      providerReady: (provider) => {
        provider.getUserList(),
      },
      builder: (context, provider, child) => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            leading: Padding(
              padding: EdgeInsets.only(left: 12.0),
              child: Image.asset(
                'assets/images/booking.png',
              ),
            ),
            actions: [
              Padding(
                padding: EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.settings,
                  color: Constants.kcolor4,
                ),
              )
            ],
          ),
          body: provider.getState == ViewState.BUSY
              ? Center(
                  child: CircularProgressIndicator(
                  strokeWidth: 3,
                ))
              : Container(
                  height: size.height,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: size.width / 50,
                            vertical: size.height / 200),
                        width: size.width,
                        height: size.height / 15,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: TextFormField(
                          autofocus: false,
                          onChanged: (value) => provider.searchProducts(value),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: Constants.kcolor4,
                            ),
                            border: InputBorder.none,
                            labelText: 'Cinematographer',
                            labelStyle: TextStyle(
                                color: Constants.kcolor4,
                                fontWeight: FontWeight.bold),
                            contentPadding: EdgeInsets.all(10.0),
                          ),
                        ),
                      ),
                      Container(
                        height: size.height / 20,
                        child: ListTile(
                          leading: Text('48 RESULTS .'),
                          title: Container(
                            decoration: BoxDecoration(
                              border: Border.all(color: Constants.kcolor5),
                              borderRadius: BorderRadius.circular(50),
                            ),
                            child: Center(child: Text('TOP RATED ')),
                          ),
                          trailing: Text(
                            "ADVANCE FILTER",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                            scrollDirection: Axis.vertical,
                            itemCount: provider.userList.length,
                            itemBuilder: (context, index) {
                              return Center(
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                      horizontal: size.width / 20,
                                      vertical: size.height / 25),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(20))),
                                  height: size.height / 3,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: size.height / 5,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.only(
                                              topRight: Radius.circular(12),
                                              topLeft: Radius.circular(12)),
                                          image: DecorationImage(
                                            image: AssetImage(
                                                provider.imageList[index]),
                                            // image: NetworkImage(
                                            //     "https://images.unsplash.com/photo-1589366024857-dd4d288e3313?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=750&q=80"),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Column(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Align(
                                                alignment: Alignment.topRight,
                                                child: Row(
                                                  children: [
                                                    Container(height: 10),
                                                    Spacer(),
                                                    Text(
                                                      "5.0",
                                                      style: TextStyle(
                                                          color:
                                                              Constants.kColor2,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      width: 10,
                                                    ),
                                                    Image.asset(
                                                        'assets/images/star.png'),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Spacer(),
                                            Align(
                                              alignment: Alignment.bottomLeft,
                                              child: ListTile(
                                                leading: CircleAvatar(
                                                    radius: 45,
                                                    backgroundColor:
                                                        Colors.white,
                                                    child: provider.userList ==
                                                            null
                                                        ? Image.network(provider
                                                            .userList[index]
                                                            .avater)
                                                        : Text('EM')),
                                                title: Text(
                                                  provider.userList[index]
                                                          .first_name +
                                                      " " +
                                                      provider.userList[index]
                                                          .last_name,
                                                  style: TextStyle(
                                                      color: Constants.kColor2,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                subtitle: Text(
                                                  'EMAIL',
                                                  style: TextStyle(
                                                      color: Constants.kColor2,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Align(
                                                alignment: Alignment.topLeft,
                                                child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      SizedBox(height: 10),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left:
                                                                    size.width /
                                                                        10),
                                                        child: Text(
                                                          provider
                                                              .userList[index]
                                                              .email,
                                                          style: TextStyle(
                                                              color: Constants
                                                                  .kcolor4),
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left:
                                                                    size.width /
                                                                        10),
                                                        child: Text(
                                                          "ID",
                                                          style: TextStyle(
                                                              color: Constants
                                                                  .kcolor3,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                      SizedBox(height: 10),
                                                      Divider(),
                                                    ])),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Text(
                                                    "View Profile",
                                                    style: TextStyle(
                                                        color:
                                                            Constants.kcolor4,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              );
                            }),
                      ),
                    ],
                  ))),
    );
  }
}
