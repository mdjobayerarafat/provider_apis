import 'package:flutter/material.dart';
import 'package:provider_apis/model/post_model.dart';
import 'package:provider_apis/service/provider_service.dart';

class ProviderOperation extends ChangeNotifier{
  final sevice = ProviderService();
  bool isLoding = false;
  List<Post> _posts=[];
  List<Post> get posts => _posts;
  getAllPosts() async {
    isLoding = true;
    notifyListeners();
    final res = await sevice.getAll();
    _posts = res;
    isLoding = false;
    notifyListeners();
  }

  SendActivity(var body) async {
    isLoding = true;
    notifyListeners();
    final res = await sevice.postMethod(body);
    var data = res;
    isLoding = false;
    notifyListeners();
  }

}