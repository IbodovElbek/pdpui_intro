import 'package:flutter/material.dart';
import 'package:pdpui_intro/Pages/HomePage.dart';
import 'package:pdpui_intro/Utils/Strings.dart';
class IntroPage extends StatefulWidget {
  static final id='IntroPage';
  const IntroPage({Key? key}) : super(key: key);

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController? _pageController;
  int currentindex=0;
  bool onlastPage=false;
  @override
void initState() {
    _pageController=PageController(
      initialPage: 0
    );
    // TODO: implement initState
    super.initState();
  }
  @override
  void dispose() {
    _pageController!.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: _pageController,
            onPageChanged: (int page){
              setState(() {
                currentindex=page;
                onlastPage=(currentindex==2);
              });
            },
            children: [
                makePage(
                  title: Strings.stepOneTitle,
                  content: Strings.stepOneContent,
                  image: 'assets/images/image_1.png'
                ),
              makePage(
                  title: Strings.stepTwoTitle,
                  content: Strings.stepTwoContent,
                  image: 'assets/images/image_2.png'
              ),
              makePage(
                  title: Strings.stepThreeTitle,
                  content: Strings.stepThreeContent,
                  image: 'assets/images/image_3.png'
              )
            ],
          ),
          Container(
            alignment: Alignment.bottomCenter,
            margin: EdgeInsets.only(bottom: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.center,
              children: _buildIndicator(),
            ),
          ),
          Column(
          mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(margin: EdgeInsets.all(10),
                alignment: Alignment.bottomRight,
                child: onlastPage ? GestureDetector(
                  onTap: (){
                    Navigator.pushReplacementNamed(context, HomePage.id);
                  },
                  child: Text('Skip',style: TextStyle(fontSize: 20,color: Colors.blue),),
                )
                    :
                GestureDetector(
                  onTap: (){},
                  child: Text('',),
                ),
              )
            ],
          )

        ],
      ),
    );
  }
 Widget makePage({image,title,content}){
    return Container(padding: EdgeInsets.only(left: 50,right: 50,bottom: 50),
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title,style: TextStyle(color: Colors.red,fontSize: 30),),
            Text(content,style: TextStyle(color: Colors.grey,fontSize: 20),textAlign: TextAlign.center),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Image.asset(image),
            )
          ],
        ),
    );
 }
 Widget _indicator(bool isActive){
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
        height: 6,
      width: isActive ? 30:6,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        color: Colors.green,
        borderRadius: BorderRadius.circular(5),
      ),
    );
 }
 List<Widget>_buildIndicator(){
    List<Widget>indicators=[];
    for(int i=0;i<3;i++){
      if(currentindex==i){
        indicators.add(_indicator(true));
      }else{
        indicators.add(_indicator(false));
      }
    }
    return indicators;
 }
}
