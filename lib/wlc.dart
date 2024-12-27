import 'package:finalproject/sign_up.dart';
import 'package:finalproject/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class wlcc extends StatelessWidget {
  const wlcc({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class wlcview extends StatefulWidget {
  const wlcview({super.key});

  @override
  State<wlcview> createState() => _wlcviewState();
}

class _wlcviewState extends State<wlcview> {
  int currentIndex = 0;
  final PageController pageController=PageController();

  // Sample onboarding data
  final List<OnboardingItem> onBoardingItems = [
    OnboardingItem(
      title: "Welcome to App!",
      subtitle: 'Our aim is to provide you better quality food!',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Stack(
        children: [
          Center(
            child: Lottie.asset(
              'assets/images/second.json',
            //  width: 200,
              //height: 200,
              //fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 270,
              child: PageView.builder(
                itemCount: onBoardingItems.length,
                onPageChanged: (index) {
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (context, index) {
                  final item = onBoardingItems[index];
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(height: 50),
                      Text(
                        item.subtitle,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.black45,
                        ),





                      //  onPageChanged:(value){

                          //setState(() {
                            //currentIndex=value;
                          //});
                        //},
                      ),

                      //dot indicator

                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          for (int index=0;index<onBoardingItems.length;index++)
                          dotIndicator(isSelected: index == currentIndex)
                        ],

                      ),
                      const SizedBox(height: 50),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(onPressed: (){
        pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.linear);
      },
        elevation: 0,
        backgroundColor: Colors.orange,
        child:TextButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>WrapperState()),);
        },child: Icon(Icons.arrow_forward_ios,color:Colors.white,),)



      ),
    );
  }
  Widget dotIndicator({required bool isSelected}){
    return Padding(padding: EdgeInsets.only(right: 7),
    child: AnimatedContainer(duration: Duration(microseconds: 500),
     height: isSelected ?8:6,
    width: isSelected ?8:6,
    decoration: BoxDecoration(shape: BoxShape.circle,color: isSelected ? Colors.black:Colors.black26),),
);

}
}

class OnboardingItem {
  final String title;
  final String subtitle;

  OnboardingItem({required this.title, required this.subtitle});
}