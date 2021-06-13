import 'package:flutter/material.dart';
import 'package:ps13si/components/footer.dart';

class ScreenArea extends StatefulWidget {
  const ScreenArea({Key? key}) : super(key: key);

  @override
  _ScreenAreaState createState() => _ScreenAreaState();
}

class _ScreenAreaState extends State<ScreenArea> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  GlobalKey<FormState> formKey = new GlobalKey<FormState>();

  var listaAreas = <String>['Front End', 'Back End', 'Data Science', 'IA'];

  var areaSelecionada;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
      drawer: MyDrawerArea(),
      body: Container(
        decoration: BoxDecoration(
          color: Color.fromRGBO(57, 166, 163, 1),
          border: Border.all(
            color: Color.fromRGBO(33, 33, 33, 1),
            width: 5
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Text(
                'Bootcamp Alunos Destemidos',
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color.fromRGBO(238, 238, 238, 1), fontSize: 40),
              ),
            ),
            Form(
              key: formKey,
              child: Container(
                margin: EdgeInsets.only(top: 50),
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 120),
                      child: DropdownButtonFormField<String>(
                        value: areaSelecionada,
                        onSaved: (newValue) => areaSelecionada = newValue,
                        onChanged: (newValue) {
                          setState(() {
                            areaSelecionada = newValue;
                          });
                        },
                        hint: Text(
                          'Selecione a área',
                          style: TextStyle(
                              color: Color.fromRGBO(238, 238, 238, 1),
                              fontSize: 20),
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(0),
                          ),
                          fillColor: Color.fromRGBO(33, 33, 33, 1),
                          filled: true,
                          contentPadding: EdgeInsets.all(10),
                        ),
                        validator: (value) =>
                            value == null ? 'Selecione uma área' : null,
                        items: listaAreas.map((String area) {
                          return DropdownMenuItem(
                            value: area,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Color.fromRGBO(33, 33, 33, 1)),
                              child: Text(
                                area,
                                style: TextStyle(
                                  color: Color.fromRGBO(238, 238, 238, 1),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(vertical: 35),
                      child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color.fromRGBO(238, 238, 238, 1)),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.symmetric(horizontal: 40,vertical:10),
                          ),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.zero,
                              side: BorderSide(
                                color: Color.fromRGBO(33, 33, 33, 1),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          'Explorar',
                          style: TextStyle(
                              color: Color.fromRGBO(33, 33, 33, 1),
                              fontSize: 22),
                        ),
                        onPressed: () {
                          if(formKey.currentState!.validate()){
                            formKey.currentState!.save();
                            print(areaSelecionada);

                            Navigator.pushNamed(
                              context,
                              '/screen-bootcamp',
                              arguments: areaSelecionada
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
      bottomSheet: FooterApp(),
    );
  }
}

class MyDrawerArea extends StatelessWidget {
  const MyDrawerArea({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromRGBO(57, 166, 163, 1),
            ),
            child: Container(
              child: Center(
                child: Text(
                  'PS13SI - Selecione uma área e se divirta!',
                  style: TextStyle(
                    color: Color.fromRGBO(33, 33, 33, 1),
                    fontSize: 25,
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
