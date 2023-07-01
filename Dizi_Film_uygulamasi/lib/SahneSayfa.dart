import 'dart:math';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:video_player/video_player.dart';
import 'package:workout_program/Siklar.dart';
import 'package:workout_program/SonucSayfasi.dart';
import 'package:workout_program/constants.dart';

class SahneSayfa extends StatefulWidget {
  final String seviye;
  const SahneSayfa({super.key, required this.seviye});
  @override
  _SahneSayfaState createState() => _SahneSayfaState();
}

class _SahneSayfaState extends State<SahneSayfa> {
  final FirebaseStorage storage = FirebaseStorage.instance;
  VideoPlayerController? vkontrol;
  List<String> cevaplar = ["", "", "", ""];
  List<InkWell> siklar = [];
  List<String> oynatilanVideolar = [];
  int dsayac = 0;
  int ysayac = 0;
  int ssayac = 0;
  String dCevap = "";
  String selectedOption = '';
  bool isAnswered = false;
  LinearGradient secenekRenk=secimRenk;
  @override
  void initState() {
    super.initState();
    _selectRandomVideoAndPlay();
  }

  @override
  void dispose() {
    vkontrol?.dispose();
    super.dispose();
  }

  void dogruKontrol(String cevap) {
    if (dCevap == cevap) {
      dsayac++;
    } else {
      ysayac++;
    }
  }
  void selectOption(String option) {
    if (!isAnswered&&option==dCevap) {
      setState(() {
        isAnswered = true;
        secenekRenk=dogrusecenek;
      });
    }
  }

  void soruSayacKontrol() {
    ssayac++;
    if (ssayac != 5) {
      _selectRandomVideoAndPlay();
    } else {
      Navigator.push(context, MaterialPageRoute(builder: (context) => SonucSayfasi(dogruSayisi: dsayac, yanlisSayisi: ysayac)));
    }
  }

  Future<void> _selectRandomVideoAndPlay() async {
    final ListResult result = await storage.ref().child(widget.seviye).listAll();
    List<String> videoUrls = [];
    List<String> fileNames = [];
    for (final ref in result.items) {
      final url = await ref.getDownloadURL();
      videoUrls.add(url);
      final name = ref.name;
      fileNames.add(name);
    }
    final random = Random();
    final randomIndex = random.nextInt(videoUrls.length);
    if (oynatilanVideolar.contains(fileNames[randomIndex])) {
      _selectRandomVideoAndPlay();
      return;
    }
    final randomVideoUrl = videoUrls[randomIndex];
    oynatilanVideolar.add(fileNames[randomIndex]);
    var database = FirebaseDatabase.instance.ref().child(widget.seviye);
    database.onValue.listen((event) {
      Map<dynamic, dynamic> gelenDegerler = event.snapshot.value as Map;
      gelenDegerler.forEach((key, nesne) {
        String isim = "$key.mp4";
        var gelenSec = Siklar.fromJson(nesne);
        if (fileNames[randomIndex] == isim) {
          cevaplar[0] = gelenSec.dogru;
          cevaplar[1] = gelenSec.y1;
          cevaplar[2] = gelenSec.y2;
          cevaplar[3] = gelenSec.y3;
          dCevap = gelenSec.dogru;
        }
      });
    });
    vkontrol = VideoPlayerController.network(randomVideoUrl);
    vkontrol!.initialize().then((_) {
      setState(() {});
      vkontrol!.play();
    });
  }

  @override
  Widget build(BuildContext context) {
    cevaplar.shuffle();
    var ekranBilgisi=MediaQuery.of(context);
    final double ekranYuksekligi=ekranBilgisi.size.height;
    final double ekrangenisligi=ekranBilgisi.size.width;
    siklar = [
      InkWell(
        onTap: (){
          dogruKontrol(cevaplar[0]);
          soruSayacKontrol();
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(kDefaultPadding * 0.85), // 15
          decoration:  const BoxDecoration(
            gradient: secimRenk,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Text(cevaplar[0], style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.black,fontSize: 24),
          ),
        ),
      ),
      InkWell(
        onTap: (){
          dogruKontrol(cevaplar[1]);
          soruSayacKontrol();
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(kDefaultPadding * 0.85), // 15
          decoration: const BoxDecoration(
            gradient: secimRenk,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Text(cevaplar[1], style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.black,fontSize: 24),
          ),
        ),
      ),
      InkWell(
        onTap: (){
          dogruKontrol(cevaplar[2]);
          soruSayacKontrol();
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(kDefaultPadding * 0.85),
          decoration: const BoxDecoration(
            gradient: secimRenk,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Text(cevaplar[2], style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.black,fontSize: 24),
          ),
        ),
      ),
      InkWell(
        onTap: (){
          dogruKontrol(cevaplar[3]);
          soruSayacKontrol();
        },
        child: Container(
          width: double.infinity,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(kDefaultPadding * 0.85),
          decoration: const BoxDecoration(
            gradient: secimRenk,
            borderRadius: BorderRadius.all(Radius.circular(12)),
          ),
          child: Text(cevaplar[3], style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.black,fontSize: 24),
          ),
        ),
      ),
    ];

    final size=vkontrol?.value.size;
    final genislik=size?.width;
    final yukseklik=size?.height;
    return Scaffold(

      body:
      SingleChildScrollView(
        child: Stack(
          children: [
            SizedBox(
                width:ekrangenisligi,
                height: ekranYuksekligi,
                child: SvgPicture.asset("assets/icons/bg.svg",fit: BoxFit.fill,)),
            SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("Doğru:$dsayac",style: const TextStyle(fontStyle:FontStyle.italic,fontSize: 36,color: dsoru),),
                        Text("Yanlış:$ysayac",style: const TextStyle(fontStyle:FontStyle.italic,fontSize: 36,color: ysoru),),
                      ],
                    ),
                    vkontrol?.value.isInitialized == true
                        ? AspectRatio(
                      aspectRatio: vkontrol!.value.aspectRatio,
                      child: FittedBox(
                          child: SizedBox(width:genislik,height:yukseklik,child: VideoPlayer(vkontrol!))),
                    )
                        :const SizedBox(width: 300 ,height: 300,),
                    siklar[0],
                    const Padding(padding: EdgeInsets.only(top: 8.0),),
                    siklar[1],
                    const Padding(padding: EdgeInsets.only(top: 8.0),),
                    siklar[2],
                    const Padding(padding: EdgeInsets.only(top: 8.0),),
                    siklar[3],
                  ],
                ),
              ),
            ),
          ], ),
      ),
    );

  }
}