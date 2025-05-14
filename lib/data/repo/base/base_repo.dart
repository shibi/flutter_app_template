
import 'package:flutter_app_template/data/service/api_service.dart';

abstract class BaseRepo{

  final ApiService apiService;

  BaseRepo({required this.apiService});


}