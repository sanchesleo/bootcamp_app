import 'package:flutter/material.dart';
import 'package:ps13si/components/footer.dart';
import 'package:ps13si/model/bootcamp_model.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({Key? key}) : super(key: key);

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    final BootcampModel bootcamp = ModalRoute.of(context)!.settings.arguments as BootcampModel;

    final snackBar = SnackBar(content: Text('Bootcamp ${bootcamp.titulo} adicionado com sucesso.'));
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
      ),
      body: buildContainerDetails(context, bootcamp, snackBar),
      bottomSheet: FooterApp(),
    );
  }

  Container buildContainerDetails(BuildContext context, BootcampModel bootcamp, SnackBar snackBar) {
    return Container(
      padding: EdgeInsets.only(bottom: 60),
      decoration: BoxDecoration(
        color: Color.fromRGBO(57, 166, 163, 1),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(top: 20, left: 15, right: 15),
            height: MediaQuery.of(context).size.width * 1.30,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              image: DecorationImage(
                  image:
                      AssetImage(bootcamp.imagemCurso),
                  colorFilter: new ColorFilter.mode(
                      Colors.black.withOpacity(0.9), BlendMode.dstATop),
                  fit: BoxFit.cover),
            ),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(33, 33, 33, 1),
                    ),
                    child: Text(
                      bootcamp.titulo,
                      style: TextStyle(
                          fontSize: 25,
                          color: Color.fromRGBO(238, 238, 238, 1)),
                    ),
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    margin:
                        EdgeInsets.symmetric(vertical: 100, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(33, 33, 33, 1),
                    ),
                    child: Text(
                      'Conteúdo: ${bootcamp.descricao}\n\nData do Bootcamp: ${bootcamp.data}.\n\nÁrea: ${bootcamp.area}.\n\nLink do Bootcamp: www.google.com',
                      style: TextStyle(
                        fontSize: 20,
                        color: Color.fromRGBO(238, 238, 238, 1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Dismissible(
            key: Key(bootcamp.id.toString()),
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart){
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }else if(direction == DismissDirection.startToEnd){
                Navigator.pop(context);
              }
            },
            secondaryBackground: Container(
              alignment: AlignmentDirectional.centerEnd,
              decoration: BoxDecoration(
                color: Color.fromRGBO(238, 238, 238, 1),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 0, 25, 0),
                child: Icon(
                  Icons.check_box,
                  color: Color.fromRGBO(57, 166, 163, 1),
                ),
              ),
            ),
            background: Container(
              alignment: AlignmentDirectional.centerStart,
              decoration: BoxDecoration(
                color: Color.fromRGBO(33, 33, 33, 1),
              ),
              child: Padding(
                padding: EdgeInsets.fromLTRB(25, 0, 0, 0),
                child: Icon(
                  Icons.close_sharp,
                  color: Colors.redAccent,
                ),
              ),
            ),
            child: Card(
              margin: EdgeInsets.symmetric(horizontal: 15, vertical: 40),
              elevation: 15,
              color: Color.fromRGBO(238, 238, 238, 1),
              shadowColor: Color.fromRGBO(57, 166, 163, 1),
              child: ListTile(
                trailing: Icon(
                  Icons.arrow_forward_ios_sharp,
                  size:30,
                  color: Colors.green
                ),
                leading: Icon(
                  Icons.arrow_back_ios,
                  size:30,
                  color: Colors.red
                ),
                title: Text(
                  'Adicionar Bootcamp',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: Color.fromRGBO(33, 33, 33, 1),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
