import 'package:flutter/material.dart';
import 'package:ps13si/components/footer.dart';
import 'package:ps13si/model/bootcamp_model.dart';
import 'package:ps13si/repository/bootcamp_repository.dart';

class BootcampScreen extends StatefulWidget {
  const BootcampScreen({Key? key}) : super(key: key);

  @override
  _BootcampScreenState createState() => _BootcampScreenState();
}

class _BootcampScreenState extends State<BootcampScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final String areaSelecionada = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(33, 33, 33, 1),
        title: RichText(
          text: TextSpan(
            style: TextStyle(
                color: Color.fromRGBO(238, 238, 238, 1),
                fontSize: 30,
                letterSpacing: 5),
            children: [
              TextSpan(text: "PS"),
              TextSpan(
                text: "13",
                style: TextStyle(
                  color: Color.fromRGBO(57, 166, 163, 1),
                ),
              ),
              TextSpan(text: "SI"),
            ],
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.reorder,
              color: Color.fromRGBO(57, 166, 163, 1), size: 35),
          onPressed: () => _scaffoldKey.currentState!.openDrawer(),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromRGBO(57, 166, 163, 1),
              ),
              child: Container(
                child: Center(
                  child: Text(
                    'PS13SI',
                    style: TextStyle(
                      color: Color.fromRGBO(238, 238, 238, 1),
                      fontSize: 25,
                    ),
                  ),
                ),
              ),
            ),
            Card(
              elevation: 15,
              color: Color.fromRGBO(57, 166, 163, 1),
              child: ListTile(
                title: Text('Selecione uma nova área'),
                leading: Icon(Icons.aod),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
              ),
            ),
          ],
        ),
      ),
      body: Container(
        padding: EdgeInsets.only(bottom:60),
        decoration: BoxDecoration(
          color: Color.fromRGBO(57, 166, 163, 1),
        ),
        child: FutureBuilder<List<BootcampModel>>(
          future: BootcampRepository().listAllBootcamp(areaSelecionada),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              var dados = snapshot.data;
              return buildListView(dados!);
            } else {
              return Center(
                child: CircularProgressIndicator(
                  valueColor: new AlwaysStoppedAnimation<Color>(
                    Color.fromRGBO(33, 33, 33, 1),
                  ),
                ),
              );
            }
          },
        ),
      ),
      bottomSheet: FooterApp(),
    );
  }

  ListView buildListView(List<BootcampModel> bootcamps) {
    return ListView.builder(
      itemCount: bootcamps.length,
      itemBuilder: (BuildContext ctx, int index) {
        return buildCardBootcamp(bootcamps[index]);
      },
    );
  }

  Align buildCardBootcamp(BootcampModel bootcamp) {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 20, left: 10, right: 10),
        height: 251,
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(33, 33, 33, 1),
            width: 10,
          ),
          color: Color.fromRGBO(238, 238, 238, 1),
          image: DecorationImage(
            image: AssetImage(bootcamp.imagemCurso),
            fit: BoxFit.cover,
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.9), BlendMode.dstATop),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.center,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                decoration: BoxDecoration(
                  color: Color.fromRGBO(33, 33, 33, 1),
                ),
                child: Text(
                  bootcamp.titulo,
                  style: TextStyle(
                      fontSize: 25, color: Color.fromRGBO(238, 238, 238, 1)),
                ),
              ),
            ),
            Container(
              child: ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromRGBO(238, 238, 238, 1)),
                  padding: MaterialStateProperty.all<EdgeInsets>(
                    EdgeInsets.symmetric(horizontal: 40, vertical: 10),
                  ),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.zero,
                      side: BorderSide(
                        color: Color.fromRGBO(33, 33, 33, 1),
                      ),
                    ),
                  ),
                ),
                child: Text(
                  'VER DETALHES',
                  style: TextStyle(
                      color: Color.fromRGBO(33, 33, 33, 1), fontSize: 12),
                ),
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/screen-details',
                    arguments: bootcamp
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
