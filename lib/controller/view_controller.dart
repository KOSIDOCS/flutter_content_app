import 'package:content_app/model/content_model.dart';
import 'package:content_app/service/network.dart';

/* [ViewController] used to pass data to the UI view*/
class ViewController {
  List<ContentModel> allContents =
      []; //  store all the content from the data source.

  // return the total contents
  int get totalContents {
    return allContents.length;
  }

  // return all the contents
  List<ContentModel> get getContents {
    return allContents;
  }

  // make http call to the url and return all the datas.
  Future<dynamic> getAllContent() async {
    var url =
        'https://storage.googleapis.com/hashiona-public/interviews/contentItems';

    try {
      NetworkHelper networkHelper = NetworkHelper(url);

      List data = await networkHelper.getData();

      // store the data in a list.
      for (var item in data) {
        allContents.add(
          ContentModel(
            type: item['type'],
            id: item['id'],
            titile: item['titile'] ?? item['name'],
            content: item['content'],
            imageUrl: item['imageUrl'],
          ),
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
