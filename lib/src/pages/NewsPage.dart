import 'package:colvidental/src/Constantes/AppTextStyles.dart';
import 'package:flutter/material.dart';

class NewsPage extends StatefulWidget {
  NewsPage({Key? key}) : super(key: key);

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> news = List.generate(
        10,
        (index) => Container(
              padding: const EdgeInsets.all(15),
              margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 0.5,
                      //spreadRadius: 0.5,
                    )
                  ],
                  color: Colors.white),
              width: double.infinity,
              child: Column(
                children: [
                  Text(
                    "Title $index de news",
                    style: AppTextStyle.tittle,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                      "Cuerpo de la noticia, debemos de tener en cuenta que es un cuerpo genérico usado para ver el funcionamiento de la app"),
                  const SizedBox(
                    height: 10,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: FadeInImage(
                        height: size.height * 0.2,
                        fit: BoxFit.cover,
                        placeholder: AssetImage("assets/dentalLoading.gif"),
                        image: AssetImage("assets/news.jpeg")),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Pie de la publicación",
                    style: AppTextStyle.foot,
                  )
                ],
              ),
            ));
    return ListView(
      children: news,
    );
  }
}
