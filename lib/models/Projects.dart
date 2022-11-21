import 'package:flutter/cupertino.dart';
import 'package:json_annotation/json_annotation.dart';
import '/models/project.dart';

//import 'package:json_annotation/json_annotation.dart';




class Projects extends ChangeNotifier {
  List<Project> _projects = [];

  void addProject(Project project) {
    _projects.add(project);
    notifyListeners();
  }

  void removeProject(Project project) {
    _projects.remove(project);
    notifyListeners();
  }

  get projects {
    return [..._projects];
  }


}
