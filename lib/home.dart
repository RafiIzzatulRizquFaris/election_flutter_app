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
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.all(16),
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "Pilihanmu menentukan masa depan sekolahmu",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(30),
                              topRight: Radius.circular(30),
                            ),
                          ),
                          child: Text("Section Two",),
                        ),
                      ),
                    ],
                  ),
                ),
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
}
