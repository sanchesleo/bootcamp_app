import 'package:ps13si/model/bootcamp_model.dart';

class BootcampRepository{

  Future<List<BootcampModel>> listAllBootcamp(String area) async{
     var listAllBootcamps = <BootcampModel>[];
    await Future.delayed(
      Duration(
        seconds:3,
      ),
    );

    if(area == 'Front End'){
      listAllBootcamps = [
          new BootcampModel(
            id: 1,
            titulo: 'HTML, CSS e JS',
            descricao: 'Aprenda HTML, CSS e JS do zero.',
            data: '15/06/2021',
            imagemCurso: 'assets/images/front_end/html_css_js.jpg',
            area: 'Front End'
          ),
          new BootcampModel(
            id: 2,
            titulo: 'React: Zero to Hero',
            descricao: 'Entenda as principais funcionalidades de uma das maiores bibliotecas de JS do mundo!',
            data: '19/06/2021',
            imagemCurso: 'assets/images/front_end/react_zero_hero.jpg',
            area: 'Front End'
          ),
          new BootcampModel(
            id: 3,
            titulo: 'Psicologia das Cores',
            descricao: 'Entenda como as cores podem influenciar em como o usuário vê as suas aplicações e sites.',
            data: '20/06/2021',
            imagemCurso: 'assets/images/front_end/psicologia_das_cores.jpg',
            area: 'Front End'
          ),
          new BootcampModel(
            id: 4,
            titulo: 'UX/UI Design',
            descricao: 'Domine a criação de layouts para suas aplicações com boas práticas de UX.',
            data: '10/06/2021',
            imagemCurso: 'assets/images/front_end/UX_UI_design.jpg',
            area: 'Front End'
          ),
      ];
    }else if(area == 'Back End'){
      listAllBootcamps = [
                new BootcampModel(
                  id: 5,
                  titulo: 'Cybersecurity Essentials',
                  descricao: 'Domine a segurança de suas aplicações.',
                  data: '01/07/2021',
                  imagemCurso: 'assets/images/back_end/cybersecurity.jpg',
                  area: 'Back End'
                ),
                new BootcampModel(
                  id: 6,
                  titulo: 'Arquitetura e Microserviços',
                  descricao: 'Escolha as melhores arquiteturas e serviços para hospedar as suas aplicações WEB.',
                  data: '22/06/2021',
                  imagemCurso: 'assets/images/back_end/arquitetura_microservices.jpg',
                  area: 'Back End'
                ),
                new BootcampModel(
                  id: 7,
                  titulo: 'AWS na Prática',
                  descricao: 'Conheça a maior plataforma de serviços tecnologia do mundo!',
                  data: '25/06/2021',
                  imagemCurso: 'assets/images/back_end/aws_na_pratica.jpg',
                  area: 'Back End'
                ),
                new BootcampModel(
                  id: 8,
                  titulo: 'Node JS e NPM',
                  descricao: 'Aprenda a desenvolver o Back End de sua aplicação com Node JS e gerenciei suas Libs com NPM.',
                  data: '26/06/2021',
                  imagemCurso: 'assets/images/back_end/node_js.jpg',
                  area: 'Back End'
                ),
            ];
    }else if(area == 'Data Science'){
       listAllBootcamps = [
            new BootcampModel(
              id: 9,
              titulo: 'Big Data and Analytics',
              descricao: 'Como manipular e gerenciar seus dados a partir de conceitos de Big Data.',
              data: '01/08/2021',
              imagemCurso: 'assets/images/data_science/big_data_analytics.jpg',
              area: 'Data Science',
            ),
            new BootcampModel(
              id: 10,
              titulo: 'Python com dados',
              descricao: 'Aprenda a utilizar a linguagem python em projetos voltados ao Data Science.',
              data: '03/08/2021',
              imagemCurso: 'assets/images/data_science/python_tratamento_dados.jpg',
              area: 'Data Science',
            ),
            new BootcampModel(
              id: 11,
              titulo: 'Estatística para Data Science',
              descricao: 'Gere insights e crie oportunidades a partir de estatística.',
              data: '04/08/2021',
              imagemCurso: 'assets/images/data_science/estatitisca_para_data_science.jpg',
              area: 'Data Science',
            )
        ];
    }else{
      listAllBootcamps = [
        new BootcampModel(
                    id: 12,
                    titulo: 'Arvore de Aprendizado',
                    descricao: 'Entenda os conceitos de arvores de aprendizado.',
                    data: '01/09/2021',
                    imagemCurso: 'assets/images/ia/arvore_de_aprendizado.jpg',
                    area: 'IA',
                  ),
            new BootcampModel(
              id: 13,
              titulo: 'IBM Watson e Chatbots',
              descricao: 'Aprenda e conheça as principais features do IBM Watson',
              data: '03/09/2021',
              imagemCurso: 'assets/images/ia/ibm_watson.jpg',
              area: 'IA',
            ),
            new BootcampModel(
              id: 14,
              titulo: 'Machine Learning',
              descricao: 'Nada mais é do que a prática de utilizar algoritmo para analisar uma grande quantidade de dados e a partir disso obter uma análise estatística através do reconhecimento de padrões dessa amostra, e com isso fazer previsões e tomar uma decisão.',
              data: '04/09/2021',
              imagemCurso: 'assets/images/ia/machine_learning.jpg',
              area: 'IA',
            )   
      ];   
    }
    return Future.value(listAllBootcamps);
  }
}