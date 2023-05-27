import 'package:bhagavad_gita/utils/functions.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../controllers/geeta_provider.dart';

class BhagvatGeeta extends StatefulWidget {
  const BhagvatGeeta({Key? key}) : super(key: key);

  @override
  State<BhagvatGeeta> createState() => _BhagvatGeetaState();
}

class _BhagvatGeetaState extends State<BhagvatGeeta> {
  @override
  initState() {
    super.initState();
    Provider.of<GeetaProvider>(context, listen: false).chaptersJson();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<GeetaProvider>(
      builder: (context, gp, child) => Scaffold(
        body: GeetaProvider.chaptersList.isEmpty
            ? const Center(child: CircularProgressIndicator())
            : CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                    pinned: true,
                    snap: false,
                    floating: false,
                    expandedHeight: 120,
                    collapsedHeight: 60,
                    backgroundColor: Colors.brown.shade700,
                    foregroundColor: Colors.white,
                    flexibleSpace: FlexibleSpaceBar(
                      expandedTitleScale: 1,
                      title: const Text('Bhagavad Gita'),
                      background: Image.asset(
                        "assets/images/appbar.png",
                        opacity: const AlwaysStoppedAnimation(.6),
                        fit: BoxFit.cover,
                      ),
                    ),
                    leading: IconButton(
                      icon: const Icon(Icons.menu),
                      onPressed: () {},
                    ),
                    actions: const [
                      Icon(1 == 0
                          ? Icons.light_mode_rounded
                          : Icons.dark_mode_rounded),
                      SizedBox(width: 16),
                    ],
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container(
                          margin: const EdgeInsets.all(1),
                          decoration: BoxDecoration(
                              border: Border.all(
                                width: 2,
                                color: Colors.black.withOpacity(0.1),
                              ),
                              borderRadius: BorderRadius.circular(16),
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image:
                                      AssetImage('assets/images/tilebkg.png'))),
                          child: ListTile(
                            leading: const FlutterLogo(size: 30.0),
                            title: Text(
                              GeetaProvider.chaptersList[index]['name'],
                              style: titleTSB(co: Colors.brown.shade800),
                            ),
                            trailing: const Icon(Icons.arrow_right_outlined),
                          ),
                        );
                      },
                      childCount: 18,
                    ),
                  ),
                ],
              ),
      ),
    );
  }
}
