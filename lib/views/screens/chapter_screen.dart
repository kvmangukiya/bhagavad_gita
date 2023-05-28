import 'package:bhagavad_gita/utils/functions.dart';
import 'package:flutter/material.dart';
import '../../controllers/gita_provider.dart';

class ChapterScreen extends StatelessWidget {
  const ChapterScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int selChapter = GitaProvider.selChapter + 1;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.brown.shade700,
        foregroundColor: Colors.white,
        title: Text(
            '$selChapter  ${GitaProvider.chaptersList[selChapter - 1]['name']}'),
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: const Icon(Icons.arrow_back_ios_new_rounded),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon((1 == 0)
                  ? Icons.light_mode_rounded
                  : Icons.dark_mode_rounded)),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.all(16),
              width: double.infinity,
              height: 350,
              decoration: BoxDecoration(
                  border: Border.all(
                    width: 2,
                    color: Colors.brown.withOpacity(0.5),
                  ),
                  borderRadius: BorderRadius.circular(16),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage('assets/images/chapter/$selChapter.png'))),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                '    ${GitaProvider.chaptersList[selChapter - 1]['chapter_summary_hindi']}',
                style: summaryTSB(co: Colors.brown.shade800),
                textAlign: TextAlign.justify,
                softWrap: true,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(16),
              child: Text(
                'Verses : ${GitaProvider.chaptersList[selChapter - 1]['verses_count']}',
                style: summaryTSB(co: Colors.brown.shade800),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
            ),
            ...GitaProvider.verseList.map((e) {
              return (e['chapter_id'] == selChapter)
                  ? Padding(
                      padding: const EdgeInsets.only(
                          left: 16, bottom: 16, right: 16),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(16),
                        onTap: () {
                          GitaProvider.selVerse = e['verse_order'];
                          Navigator.of(context).pushNamed('verse_details');
                        },
                        child: Ink(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.brown.withOpacity(0.1),
                              ),
                              color: Colors.brown.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/tilebkg.png'),
                                  opacity: 0.8)),
                          child: ListTile(
                            title: Text(
                              e['text'],
                              style:
                                  titleTSB(fs: 17, co: Colors.brown.shade800),
                            ),
                            subtitle: Text(
                              GitaProvider
                                      .vTranslationList[e['verse_order'] - 1]
                                  ['description'],
                              style:
                                  titleTSB(fs: 17, co: Colors.brown.shade600),
                            ),
                            trailing: const Icon(Icons.arrow_right_outlined),
                          ),
                        ),
                      ),
                    )
                  : const SizedBox();
            }).toList(),
          ],
        ),
      ),
    );
  }
}
