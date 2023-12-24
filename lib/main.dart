import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.blue),
      home: BasicsPage(),
    );
  }
}

class BasicsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Profile Facebook")),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Image.asset(
                  "images/cover.jpg",
                  height: 200,
                  fit: BoxFit.cover,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 125),
                  child: CircleAvatar(
                    radius: 75,
                    backgroundColor: Colors.white,
                    child: myProfilPic(72),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Spacer(),
                Text("Mamadou Diallo",
                    style: TextStyle(
                        fontSize: 25,
                        fontStyle: FontStyle.italic,
                        fontWeight: FontWeight.bold)),
                Spacer()
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                "Un jour les chats domineront le monde mais pas aujourd'hui,c'est l'heure de la sieste",
                style:
                    TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
                textAlign: TextAlign.center,
              ),
            ),
            Row(
              children: [
                Expanded(child: buttonContainer(text: "Modifier le profil")),
                buttonContainer(icon: Icons.border_color),
              ],
            ),
            Divider(
              thickness: 2,
            ),
            SectionTitleText("A propos de moi"),
            AboutRow(icon: Icons.house, text: "Ouest Foire Dakar"),
            AboutRow(icon: Icons.work, text: "Developper FullStack"),
            AboutRow(
                icon: Icons.favorite, text: "En Couple avec mon ordinateur"),
            Divider(
              thickness: 2,
            ),
            SectionTitleText("Mes amis"),
            Row(
              children: [
              //  FrindsImage("Noel", "images/cat.jpg", width/3)
                allFriends(width/3.5),
              ],
            ),
            Divider(
              thickness: 2,
            ),
            SectionTitleText("Mes Posts"),
            post(timee: "5 heures", image: "images/carnaval.jpg", desc: "Petit tour au magic word,on s'est bien amusée en plus il y ' avait grand monde bref le kiff"),
            post(timee: "2 jours", image: "images/mountain.jpg", desc: "La montagne sa vous gange",comments: 38,likes: 59),
            post(timee: "Une semaine", image: "images/work.jpg", desc: "Retour au boulot ",likes: 12,comments: 60),
            post(timee: "5 ans", image: "images/playa.jpg", desc: "Le boulot en remote, Ceci sera la preuve que ce sera mon  bureau  pour les prochaines semaines",comments: 70,likes: 65),



          ],
        ),
      ),
    );
  }

  CircleAvatar myProfilPic(double radius) {
    return CircleAvatar(
        radius: radius, backgroundImage: AssetImage("images/profile.jpg"));
  }

  Container buttonContainer({IconData? icon, String? text}) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      padding: EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.blue,
      ),
      child: (icon == null)
          ? Center(
              child: Text(text ?? "", style: TextStyle(color: Colors.white)))
          : Icon(icon, color: Colors.white),
    );
  }

  Widget SectionTitleText(String text) {
    return Padding(
        padding: EdgeInsets.all(15),
        child: Text(text,
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18)));
  }

  Widget AboutRow({required icon, required text}) {
    return Row(
      children: [
        Icon(icon),
        Padding(
          padding: EdgeInsets.all(5),
          child: Text(text),
        )
      ],
    );
  }

  Column FrindsImage(String name, String imagePath, double width) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(5),
          width: width,
          height: width,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage(imagePath),fit: BoxFit.cover),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [BoxShadow(color: Colors.grey)],
            color: Colors.blue
          ),
        ),
        Text(name)
      ],
    );
  }
  Row allFriends(double width){
    Map<String,String> frinds={
      "José":"images/cat.jpg",
      "Maggie":"images/sunflower.jpg",
      "Doggy":"images/duck.jpg"
    };
    List<Widget> children=[];
    frinds.forEach((name, imagePath) {
      children.add(FrindsImage(name,imagePath,width));
    });
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: children,
    );
  }
  Container post({required String timee, required String image, required String desc,  int likes=0 ,  int comments=0}){
    return Container(
margin: EdgeInsets.only(top: 8,left: 3,right: 3),
      padding: EdgeInsets.all(10),
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white70,
      ),
      child: Column(
        children: [
          Row(
            children: [
              myProfilPic(20),
              Padding(padding: EdgeInsets.only(left: 8)),
              Text("Mamadou Diallo"),
              Spacer(),
              timerText(timee)
            ],
          ),
          Padding(padding: EdgeInsets.only(top: 8,bottom: 8), child:
          Image.asset(image,fit: BoxFit.fitWidth,)
          ),

          Text(desc,style: TextStyle(color: Colors.blueAccent),textAlign: TextAlign.center,),
          Divider(),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Icon(Icons.favorite),
              Text("$likes likes"),
              Icon(Icons.message),
              Text("$comments messages")
            ],
          )
        ],
      ),
    );
  }
  Text timerText(String time){
    return Text("Il y'a $time",style: TextStyle(color: Colors.blue),);

  }
}
