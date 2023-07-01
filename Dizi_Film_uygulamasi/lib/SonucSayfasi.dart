import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workout_program/welcome_screen.dart';

import 'constants.dart';

class SonucSayfasi extends StatefulWidget {

 final int dogruSayisi;
 final int yanlisSayisi;

  SonucSayfasi({required this.dogruSayisi,required this.yanlisSayisi});

  @override
  State<SonucSayfasi> createState() => _SonucSayfasiState();
}

class _SonucSayfasiState extends State<SonucSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fitWidth,width: 800),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text("TEBRİKLER,",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 24),
                  ),
                  Spacer(flex: 2), //2/6
                  Text("DOĞRU SAYİSİ:${widget.dogruSayisi}",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 24),
                  ),
                  Text(
                    "YANLIŞ SAYİSİ: ${widget.yanlisSayisi}",
                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: Colors.white, fontWeight: FontWeight.bold,fontSize: 24),
                  ),
                  Spacer(), // 1/6

                  InkWell(
                    onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomeScreen())),
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: const BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Tekrar Deneyelim",
                        style: Theme.of(context)
                            .textTheme
                            .labelLarge
                            ?.copyWith(color: Colors.black),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
