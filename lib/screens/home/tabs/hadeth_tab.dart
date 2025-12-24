import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../../../models/hadeth_model.dart';
import '../../hadeth_details/hadeth_details.dart';

class HadethTab extends StatefulWidget {
  const HadethTab({super.key});

  @override
  State<HadethTab> createState() => _HadethTabState();
}

class _HadethTabState extends State<HadethTab> {
  List<HadethModel> allAhadithData = [];

  @override
  void initState() {
    super.initState();
    loadHadithFile();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          fit: BoxFit.fill,
          image: AssetImage("assets/images/hadeth_bg.png"),
        ),
      ),
      child: CarouselSlider(
        options: CarouselOptions(height: double.infinity),
        items: allAhadithData.map((model) {
          return Builder(
            builder: (BuildContext context) {
              return Container(
                padding: EdgeInsets.only(top: 215),
                child: Stack(
                  alignment: Alignment.topCenter,
                  children: [
                    Image.asset("assets/images/hadith_card.png"),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 45),
                          child: Text(
                            model.title,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: model.content.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    HadethDetails.routeName,
                                    arguments: model,
                                  );
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Text(
                                    model.content[index],
                                    maxLines: 8,
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              );
            },
          );
        }).toList(),
      ),
    );
  }

  Future<void> loadHadithFile() async {
    String hadethFile = await rootBundle.loadString("assets/files/ahadeth.txt");
    List<String> allAhadeth = hadethFile.split("#");

    for (int i = 0; i < allAhadeth.length; i++) {
      String hadethOne = allAhadeth[i];
      List<String> hadethLines = hadethOne.trim().split("\n");
      String title = hadethLines[0];
      hadethLines.removeAt(0);
      List<String> hadethContent = hadethLines;
      allAhadithData.add(HadethModel(title, hadethContent));
    }

    setState(() {});
  }
}
