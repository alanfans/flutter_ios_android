import 'package:dio/dio.dart';
import 'package:flutter_ios_android/firebase_auth/DioManager.dart';

class HttpUrl{

  static final baseUrl = "https://hacpai.com";
  static final loginUri = baseUrl+'/api/v2/login';

  static BaseOptions baseOptions = BaseOptions(
                        connectTimeout: 6000,
                        baseUrl: baseUrl,
                        contentType : "application/json",

                    );
  static Dio dio = Dio(baseOptions);

  static Future<T> request<T>(String url, {String method = "get",Map<String, dynamic> params}) async {
    // 1.单独相关的设置
    Options options = Options();
    options.method = method;
    options.headers = {
      "User-Agent" : "HACPAI APP TEST",
      "Sec-Fetch-Site":	"cross-site",
      "Sec-Fetch-Mode":	"cors",
      "Accept-Encoding":	"gzip, deflate, br"
    };

    // 2.发送网络请求
    try {
     //Response response = await dio.request<T>(url, data: new Map<String, dynamic>.from(params), options: options);
      DioManager().post(HttpUrl.loginUri, params,(data){
        return data;
      },(error){
        print(error.toString());
      });
    } on DioError catch (e) {
      throw e;
    }
  }
}