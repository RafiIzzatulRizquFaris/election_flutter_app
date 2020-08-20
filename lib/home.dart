import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:election_flutter_app/info_candidate_contract.dart';
import 'package:election_flutter_app/info_candidate_presenter.dart';
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
                              padding: EdgeInsets.only(top: 16, left: 10, bottom: 16, right: 10,  ),
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
                                "Pilihanmu menentukan masa depan sekolahmu",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
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
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
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
//                                padding: EdgeInsets.only(top: 6, bottom: 6,),
                                width: MediaQuery.of(context).size.width,
                                child: RaisedButton(
                                  onPressed: () {},
                                  elevation: 8,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
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
                                      "Button",
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
        shadowColor: Colors.black26,
        elevation: 8,
        color: Colors.blueAccent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: ClipRRect(
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  child: Image.network(
                    infoCandidateList[i].data["candidate_photo"],
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Deva Abel Khan (XII RPL 1)",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 10,
                left: 10,
                bottom: 16,
                right: 10,
              ),
              child: Text(
                "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
                textAlign: TextAlign.start,
              ),
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
    });
    print(index);
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
