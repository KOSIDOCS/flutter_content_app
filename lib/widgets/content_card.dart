import 'package:flutter/material.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({Key? key, this.content}) : super(key: key);

  final dynamic content;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 130.0,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.all(4.0),
          margin: EdgeInsets.only(
            top: 40.0,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(8.0),
            child: Image.network(
              content.imageUrl!,
              width: 120.0,
              height: 130.0,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) =>
                  (loadingProgress == null)
                      ? child
                      : CircularProgressIndicator(),
              errorBuilder: (context, error, stackTrace) => Image.network(
                "http://via.placeholder.com/350x150",
                width: 120.0,
                height: 130.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 4.0),
            child: Text(
              content.titile!,
              textAlign: TextAlign.start,
              style:
                  TextStyle(fontWeight: FontWeight.normal, color: Colors.white),
            ),
          ),
        ),
      ],
    );
  }
}
