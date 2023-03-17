import 'package:get/get.dart';
import '../models/discover_models.dart';

class ApiService extends GetConnect {
  static String baseURL = 'https://api.themoviedb.org/3';
  static String apiKey = '0f57fbf8d0e26c00c866487b92ee1efc';

  Future<DiscoverModels?> getDiscoverMovies() async {
    var response = await get('$baseURL/discover/movie?api_key=$apiKey');
    if (response.status.hasError) {
      return null;
    } else {
      return DiscoverModels.fromJson(response.body);
    }
  }
}

// enum EndPoint { getDiscover, getMovieDetail, getVideo, getReview }

// class ApiService extends GetConnect {
//   static const String baseURl = "https://api.themoviedb.org/3/";
//   static const String apiKey = '0f57fbf8d0e26c00c866487b92ee1efc';

//   String getEndPointUrl(EndPoint endpoint) {
//     switch (endpoint) {
//       case EndPoint.getDiscover:
//         return 'movie/popular';
//       case EndPoint.getMovieDetail:
//         return '';
//       case EndPoint.getReview:
//         return '';
//       case EndPoint.getVideo:
//         return '';
//     }
//   }

//   Map<String, String> getParameter(EndPoint endpoint) {
//     switch (endpoint) {
//       case EndPoint.getDiscover:
//         return {
//           'api_key': apiKey,
//         };
//       default:
//         return {};
//     }
//   }

//   // Future<Response<dynamic>> getDiscover() async {
//   //   final service = ApiService();
//   //   const endpoint = EndPoint.getDiscover;
//   //   final urlEndpoint = service.getEndPointUrl(endpoint);
//   //   Map<String, String> param = getParameter(endpoint);
//   //   return await get(baseURl + urlEndpoint + param.toString());
//   // }

//   void getDiscover(Function(SlideShowModel) completion) async {
//     final service = ApiService();
//     const endpoint = EndPoint.getDiscover;
//     final urlEndpoint = service.getEndPointUrl(endpoint);
//     Map<String, String> param = getParameter(endpoint);
//     Uri urlParse =
//         Uri.parse(baseURl + urlEndpoint).replace(queryParameters: param);
//     final body = FormData({});

//     try {
//       http.Response response = await http.get(urlParse);

//       if (response.statusCode == 200) {
//         var result = jsonDecode(response.body);

//         SlideShowModel resultData =
//             SlideShowModel.fromJson(json.decode(response.body));
//         completion(resultData);
//       }
//     } catch (e) {
//       print('error fetching data $e');
//     }
//   }
// }
