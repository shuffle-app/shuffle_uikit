import 'package:flutter/material.dart';
import 'package:shuffle_uikit/shuffle_uikit.dart';

class PhotoViewerPage extends StatefulWidget {
  const PhotoViewerPage({super.key});

  @override
  State<PhotoViewerPage> createState() => _PhotoViewerPageState();
}

class _PhotoViewerPageState extends State<PhotoViewerPage> {
  final List<String> images = [
    GraphicsFoundation.instance.png.leto1.path,
    GraphicsFoundation.instance.png.leto2.path,
    GraphicsFoundation.instance.png.leto3.path,
  ];

  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    return BlurredAppBarPage(
      title: 'Photo Gallery',
      autoImplyLeading: true,
      children: [
        SizedBox(
          width: 1.sw,
          height: 1.sh,
          child: GridView.builder(
            padding: EdgeInsets.all(EdgeInsetsFoundation.all8),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 8.0,
              mainAxisSpacing: 8.0,
            ),
            itemCount: images.length,
            itemBuilder: (context, index) {
              final String heroTag = 'photo-$index';

              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                  });

                  Navigator.of(context)
                      .push(
                    MaterialPageRoute(
                      builder: (_) => PhotoDialog(
                        tag: heroTag,
                        images: images,
                        initialIndex: index,
                      ),
                    ),
                  )
                      .then((_) {
                    setState(() {
                      selectedIndex = null;
                    });
                  });
                },
                child: HeroMode(
                  enabled: selectedIndex != index,
                  child: Hero(
                    transitionOnUserGestures: true,
                    tag: heroTag,
                    child: ImageWidget(
                      link: images[index],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
