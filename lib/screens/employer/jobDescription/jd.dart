import 'package:flutter/material.dart';
import 'package:highfives_ui/screens/utils/pdfrender.dart';
import 'dart:html' as html;
import 'dart:js' as js;

class EmployerJobDescriptions extends StatelessWidget {
  List<dynamic> _jobDescriptions;
  EmployerJobDescriptions(this._jobDescriptions);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        _buildHeadings(),
        Container(
          width: size.width,
          height: size.height,
          child: Center(
            child: ListView(
              children: _buildAllJDs(context, _jobDescriptions),
            ),
          ),
        ),
      ],
    );
  }
}

Widget _buildHeadings() {
  return Container(
    height: 30,
    padding: EdgeInsets.symmetric(horizontal: 20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          flex: 1,
          child: Center(child: Text('No.')),
        ),
        Expanded(
          flex: 4,
          child: Center(child: Text('Titile')),
        ),
        Expanded(
          flex: 2,
          child: Center(child: Text('Created By')),
        ),
        Expanded(
          flex: 1,
          child: Center(child: Text('')),
        ),
      ],
    ),
  );
}

List<Widget> _buildAllJDs(BuildContext context, List<dynamic> jobDescriptions) {
  List<Widget> jds = List<Widget>();
  if (jobDescriptions != null && jobDescriptions.length > 0) {
    for (int i = 0; i < jobDescriptions.length; i++) {
      var jd = Map<String, dynamic>.from(jobDescriptions[i]);
      jds.add(_buildSingleJobDescription(context, jd, i + 1));
    }
  }
  return jds;
}

Widget _buildSingleJobDescription(BuildContext context,
    Map<String, dynamic> jobDescription, int indexNumber) {
  return Container(
    height: 100,
    child: Card(
      color: Theme.of(context).primaryColor,
      elevation: 5,
      shadowColor: Theme.of(context).accentColor,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.3),
      ),
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(color: Theme.of(context).accentColor, width: 10),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              flex: 1,
              child: Center(
                child: Text(indexNumber.toString()),
              ),
            ),
            Expanded(
              flex: 4,
              child: Center(
                  child: Text(
                jobDescription["jobProfile"],
                overflow: TextOverflow.ellipsis,
              )),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Text('Author Name ?'),
              ),
            ),
            Expanded(
              flex: 1,
              child: Center(
                child: Row(
                  children: [
                    InkWell(
                      onTap: () {
                        js.context
                            .callMethod("open", [jobDescription["pdfUrl"]]);
                      },
                      child: Icon(
                        Icons.open_in_browser,
                        color: Theme.of(context).accentColor,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 10),
                    InkWell(
                      onTap: () {
                        final url = jobDescription["pdfUrl"];
                        final anchor = html.document.createElement('a')
                            as html.AnchorElement
                          ..href = url
                          ..style.display = 'none'
                          ..download = 'some_name.pdf';
                        html.document.body.children.add(anchor);
                        anchor.click();
                        html.document.body.children.remove(anchor);
                        html.Url.revokeObjectUrl(url);
                      },
                      child: Icon(
                        Icons.download_rounded,
                        color: Theme.of(context).accentColor,
                        size: 30,
                      ),
                    ),
                    SizedBox(width: 10),
                    Icon(
                      Icons.delete,
                      color: Theme.of(context).accentColor,
                      size: 30,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
