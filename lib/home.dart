import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:election_flutter_app/contract/info_candidate_contract.dart';
import 'package:election_flutter_app/presenter/info_candidate_presenter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return HomeScreen();
  }
}

class HomeScreen extends State<Home>
    with TickerProviderStateMixin
    implements InfoCandidateContractView {
  InfoCandidatePresenter infoCandidatePresenter;
  List<DocumentSnapshot> infoCandidateList = List<DocumentSnapshot>();
  int index = 0;
  String chosenId = "1";
  bool showDesc = false;

//  CardController cardController;
  var isLoading;

  HomeScreen() {
    infoCandidatePresenter = InfoCandidatePresenter(this);
  }

  @override
  void initState() {
    super.initState();
    infoCandidatePresenter.loadData();
    isLoading = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.white,
              Colors.white70,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
        child: infoCandidateList == null
            ? CircularProgressIndicator(
                backgroundColor: Colors.blueAccent,
              )
            : Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                color: Colors.blue,
                child: SafeArea(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10),
                        child: Row(
                          children: [
                            Padding(
                              padding: EdgeInsets.only(
                                top: 16,
                                left: 10,
                                bottom: 16,
                                right: 10,
                              ),
                              child: RotatedBox(
                                quarterTurns: -1,
                                child: Text(
                                  "VOTE",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 38,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Pilihanmu menentukan\nmasa depan sekolahmu",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 24,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.only(
                            top: 10,
                            bottom: 10,
                          ),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20),
                              topRight: Radius.circular(20),
                            ),
                          ),
                          child: Column(
                            children: [
                              Expanded(
                                child: PageView.builder(
                                  itemBuilder: pageViewBuilder,
                                  itemCount: infoCandidateList.length,
                                  controller: PageController(
                                    viewportFraction: 0.8,
                                  ),
                                  onPageChanged: pageViewOnChange,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                  top: 10,
                                  bottom: 10,
                                  left: 16,
                                  right: 16,
                                ),
                                width: MediaQuery.of(context).size.width,
                                child: RaisedButton(
                                  onPressed: () {},
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  hoverColor: Colors.blue,
                                  focusColor: Colors.blue,
                                  splashColor: Colors.amberAccent,
                                  color: Colors.blueAccent,
                                  textColor: Colors.white,
                                  child: Padding(
                                    padding: EdgeInsets.only(
                                      top: 10,
                                      bottom: 10,
                                    ),
                                    child: Text(
                                      "Pilih Nomor $chosenId",
                                      style: TextStyle(
                                        fontSize: 20,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }

  Widget pageViewBuilder(BuildContext context, int i) {
    return Transform.scale(
      scale: i == index ? 1 : 0.9,
      child: Card(
        shadowColor: Colors.black.withOpacity(0.5),
        elevation: 10,
        color: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: Stack(
          children: [
            Column(
              children: [
                Expanded(
                  child: SizedBox.expand(
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      child: FittedBox(
                        child: Image.network(
                          infoCandidateList[i].data["candidate_photo"],
//                        fit: BoxFit.cover,
                        ),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20)),
                    color: Colors.blueAccent,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        spreadRadius: 0,
                        blurRadius: 10,
                        offset: Offset(0, -20), // changes position of shadow
                      ),
                    ],
                  ),
                  child: FlatButton(
                    splashColor: Colors.amberAccent,
                    onPressed: onClickDesc,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.blueAccent,
                      ),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              infoCandidateList[i].data["candidate_name"],
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              textAlign: TextAlign.start,
                            ),
                          ),
                          Padding(
                            padding: showDesc
                                ? EdgeInsets.all(10)
                                : EdgeInsets.all(0),
                            child: showDesc ? expandedDesc(i) : null,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  setInfoCandidate(List<DocumentSnapshot> value) {
    print(value[0].data["candidate_name"]);
    setState(() {
      infoCandidateList = value;
      isLoading = false;
    });
    print(infoCandidateList[0].data["candidate_photo"]);
  }

  @override
  setOnErrorInfoCandidate(String error) {
    print(error);
  }

  void pageViewOnChange(int value) {
    setState(() {
      index = value;
      chosenId = infoCandidateList[value].data["candidate_id"];
    });
    print(chosenId);
  }

  void onClickDesc() {
    if (!showDesc) {
      setState(() {
        showDesc = true;
      });
    } else {
      setState(() {
        showDesc = false;
      });
    }
  }

  expandedDesc(int i) {
    return Text(
      infoCandidateList[i].data["candidate_name"],
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.normal,
        fontSize: 16,
      ),
      textAlign: TextAlign.start,
    );
  }
}

//  infoCard() {
//    print(infoCandidateList.length);
//    return TinderSwapCard(
//      cardBuilder: (BuildContext context, int index) {
//        return Card(
//          child:
//          Image.network(infoCandidateList[index].data["candidate_photo"]),
//        );
//      },
//      totalNum: infoCandidateList.length,
//      stackNum: infoCandidateList.length,
//      cardController: cardController = CardController(),
//      swipeUpdateCallback: updateCallback,
//      swipeCompleteCallback: completeCallback,
//      orientation: AmassOrientation.BOTTOM,
//      swipeEdge: 4.0,
//      maxWidth: MediaQuery.of(context).size.width * 0.9,
//      maxHeight: MediaQuery.of(context).size.width * 0.9,
//      minWidth: MediaQuery.of(context).size.width * 0.8,
//      minHeight: MediaQuery.of(context).size.width * 0.8,
//    );
//  }
//
//  void updateCallback(DragUpdateDetails details, Alignment align) {
//    if (align.x < 0) {
//      print("Card is LEFT swiping");
//    } else if (align.x > 0) {
//      print("Card is RIGHT swiping");
//    } else if (align.y > 0) {
//      print("Card is TOP swiping");
//    } else if (align.y < 0) {
//      print("Card is BOTTOM swiping");
//    }
//  }
//
//  void completeCallback(CardSwipeOrientation orientation, int index) {
//    print(index.toString());
//  }
