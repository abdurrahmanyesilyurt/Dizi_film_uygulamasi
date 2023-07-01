import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:workout_program/SahneSayfa.dart';

import 'constants.dart';
class SahneSecim extends StatefulWidget {
  const SahneSecim({Key? key}) : super(key: key);

  @override
  State<SahneSecim> createState() => _SahneSecimState();
}

class _SahneSecimState extends State<SahneSecim> {
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
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children :[
                  InkWell(
                    onTap: (){  Navigator.push(context, MaterialPageRoute(builder: (context) => const SahneSayfa(seviye: 'lvl1/',)));},
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.85), // 15
                      decoration: const BoxDecoration(
                        gradient: secimRenk,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text("Level 1", style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.black,fontSize: 24),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){  Navigator.push(context, MaterialPageRoute(builder: (context) => const SahneSayfa(seviye: 'lvl2/',)));},
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.85), // 15
                      decoration: const BoxDecoration(
                        gradient: secimRenk,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text("Level 2", style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.black,fontSize: 24),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){  Navigator.push(context, MaterialPageRoute(builder: (context) => const SahneSayfa(seviye: 'lvl3/',)));},
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.85), // 15
                      decoration: const BoxDecoration(
                        gradient: secimRenk,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text("Level 3", style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.black,fontSize: 24),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){  Navigator.push(context, MaterialPageRoute(builder: (context) => const SahneSayfa(seviye: 'lvl4/',)));},
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.85), // 15
                      decoration: const BoxDecoration(
                        gradient: secimRenk,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text("Level 4", style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.black,fontSize: 24),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: (){  Navigator.push(context, MaterialPageRoute(builder: (context) => const SahneSayfa(seviye: 'lvl5/',)));},
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(kDefaultPadding * 0.85), // 15
                      decoration: const BoxDecoration(
                        gradient: secimRenk,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text("Level 5", style: Theme.of(context).textTheme.labelLarge?.copyWith(color: Colors.black,fontSize: 24),
                      ),
                    ),
                  ),

              ],
           ),
         ),
       ),
       ], ),


    );
  }
}
