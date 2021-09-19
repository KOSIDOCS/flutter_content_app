import 'package:content_app/controller/view_controller.dart';
import 'package:content_app/view/content_details_page.dart';
import 'package:content_app/widgets/content_card.dart';
import 'package:flutter/material.dart';

class ContentListPage extends StatefulWidget {
  const ContentListPage({Key? key}) : super(key: key);

  @override
  _ContentListPageState createState() => _ContentListPageState();
}

class _ContentListPageState extends State<ContentListPage> {
  ViewController viewController = ViewController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: FutureBuilder(
          future: viewController.getAllContent(),
          builder: (BuildContext context, data) {
            return ListView.builder(
              itemCount: viewController.totalContents,
              itemBuilder: (BuildContext context, index) {
                var content = viewController.getContents[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            ContentDetailsPage(content: content),
                      ),
                    );
                  },
                  child: ContentCard(
                    content: content,
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
