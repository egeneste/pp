import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';

import 'flight_map.dart';
//
// class Flight extends ChangeNotifier{
//   String id;
//   double riser;
//   double bevel;
//   int numberOfStep;
//
//   Flight({required this.id, required this.riser, required this.bevel, required this.numberOfStep});
//
//   factory Flight.copy(Flight flight) {
//     return Flight(id: flight.id, riser: flight.riser, bevel: flight.bevel, numberOfStep: flight.numberOfStep);
//   }
// }
//
//
// import 'package:flutter/cupertino.dart';
//
// import '../models/poste.dart';
// import '../models/poste_de_tramo.dart';

class Flight extends ChangeNotifier {
  String id;

  double riser;
  double bevel;
  double topCrotchDistance;
  double bottomCrotchDistance;

  bool topCrotch;
  bool bottomCrotch;
  bool bottomCrotchPost;
  bool onHold;

  int numberOfSteps;

  List<Post> bottomPostList;
  List<Post> topPostList;
  List<RampPost> rampPostList;

  Flight({
    this.id = '',
    this.riser = 6.7835,
    this.bevel = 7.3154,
    this.topCrotch = true,
    this.topCrotchDistance = 0.0,
    this.bottomCrotch = true,
    this.bottomCrotchDistance = 0.0,
    this.bottomCrotchPost = false,
    this.numberOfSteps = 12,
    this.bottomPostList = const <Post>[],
    this.rampPostList = const <RampPost>[],
    this.topPostList = const <Post>[],
    this.onHold = true,
  });

  factory Flight.copy(Flight obj) {
    return Flight(
        id: obj.id,
        riser: obj.riser,
        bevel: obj.bevel,
        topCrotch: obj.topCrotch,
        topCrotchDistance: obj.topCrotchDistance,
        bottomCrotch: obj.bottomCrotch,
        bottomCrotchDistance: obj.bottomCrotchDistance,
        bottomCrotchPost: obj.bottomCrotchPost,
        numberOfSteps: obj.numberOfSteps,
        bottomPostList: obj.bottomPostList,
        rampPostList: obj.rampPostList,
        topPostList: obj.topPostList);
  }

  void updateFlight(Map flt) {
    riser = double.parse(flt['riser']);
    bevel = double.parse(flt['bevel']);
    topCrotchDistance = double.parse(flt['topCrotchLength']);
    bottomCrotchDistance = double.parse(flt['bottomCrotchLength']);

    topCrotch = flt['topCrotch'];
    bottomCrotch = flt['bottomCrotch'];
    bottomCrotchPost = flt['hasBottomCrotchPost'];
    numberOfSteps = int.parse(flt['stairsCount']);

    bottomPostList = flt['lowerFlatPost'];
    rampPostList = flt['rampPost'];
    topPostList = flt['upperFlatPost'];
    notifyListeners();
  }

  Map toJson() {

    List<Map> bottomPosts = bottomPostList.map((e) => e.toJson()).toList();
    List<Map> topPosts = topPostList.map((e) => e.toJson()).toList();
    List<Map> rampPosts = rampPostList.map((e) => e.toJson()).toList();

    return {
      "id": id,
      "riser": riser,
      "bevel": bevel,
      "topCrotchDistance": topCrotchDistance,
      "bottomCrotchDistance": bottomCrotchDistance,
      "topCrotch": topCrotch,
      "bottomCrotch": bottomCrotch,
      "bottomCrotchPost": bottomCrotchPost,
      "numberOfSteps" : numberOfSteps,
      "bottomPostList": bottomPosts,
      "topPostList": topPosts,
      "rampPostList": rampPosts,
    };
  }
// set setFlightName (String flightName) {
//   _flightName = flightName;
//   notifyListeners();
// }

}

class PostObj {}

class RampPostObj {}
