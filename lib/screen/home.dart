import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:muslim_app/Model/category.dart';
import 'package:muslim_app/Reusable/ColourfulBox.dart';
import 'package:muslim_app/Reusable/action_chip.dart';
import 'package:muslim_app/Reusable/imageCarousel.dart';
import 'package:muslim_app/constants/colorConstants.dart';
import 'package:muslim_app/screen/Quran.dart';






 class Home extends StatefulWidget {
   @override
   _HomeState createState() => _HomeState();
 }

 class _HomeState extends State<Home> {
   @override
   Widget build(BuildContext context) {
     return Scaffold(
       appBar: AppBar(
         backgroundColor: kPrimaryColor,

         title: Text("Muslim App"),
       ),
       body: Stack(
         children: <Widget>[
           ClipPath(
           clipper: WaveClipperTwo(),
           child: Container(
             decoration: BoxDecoration(
                 color: Theme.of(context).primaryColor
             ),
             height: 200,
           ),
         ),
           CustomScrollView(
               physics: BouncingScrollPhysics(),
               slivers: <Widget>[
                 SliverToBoxAdapter(
                   child: Padding(
                     padding: const EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
                     child: Text("Select a category to start the quiz", style: TextStyle(
                         color: Colors.white,
                         fontWeight: FontWeight.w500,
                         fontSize: 20.0
                     ),),
                   ),
                 ),
//                 SliverPadding(
//                   padding: const EdgeInsets.all(16.0),
//                   sliver: SliverList(
//                     delegate: SliverChildListDelegate(
//                         [
//
//                           Padding(
//                             padding: const EdgeInsets.only(top: 20,),
//                             child: Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//                               children: <Widget>[
//                                 Expanded(
//
//                                   child: InkWell(
//                                     onTap: (){
//                                       Navigator.push(context, MaterialPageRoute(builder: (context)=>Quran()));
//                                     },
//                                     child: ColourfulBox(
//
//                                       text: 'Stay' ,
//                                     ),
//                                   ),
//                                 ),
//
//                                 SizedBox(width: 15.0,),
//                                 Expanded(
//                                   child: InkWell(
//                                     onTap: (){
////                                 Navigator.push(context, MaterialPageRoute(builder: (context)=>EatScreen()));
//                                     },
//                                     child: ColourfulBox(
//
//                                       text: 'Eat' ,
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ),
//                      SizedBox(height: 20.0,),
//                      Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
//                        children: <Widget>[
//                          Expanded(
//                            child: InkWell(
//                              onTap: (){},
//                              child: ColourfulBox(
//
//                                text: 'Event' ,
//                              ),
//                            ),
//                          ),
//
//                          SizedBox(width: 15.0,),
//                          Expanded(
//                            child: InkWell(
//                              onTap: (){},
//                              child: ColourfulBox(
//
//                                text: 'Unwind' ,
//                              ),
//                            ),
//                          ),
//                        ],
//                      ),
//
//
//
//
//
//                         ]
//                     ),
//                   ),
//                 ),
                 SliverPadding(
                   padding: const EdgeInsets.all(16.0),
                   sliver: SliverGrid(
                       gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                           crossAxisCount: 2,
                           childAspectRatio: 1.2,
                           crossAxisSpacing: 10.0,
                           mainAxisSpacing: 10.0
                       ),
                       delegate: SliverChildBuilderDelegate(
                         _buildCategoryItem,
                         childCount: categories.length,

                       )

                   ),
                 ),



               ]
           ),
         ],
       ),

     );
   }
   Widget _buildCategoryItem(BuildContext context, int index) {
     Category category = categories[index];
     return MaterialButton(
       elevation: 1.0,
       highlightElevation: 1.0,
       onPressed: () => _categoryPressed(context,category),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(10.0),
       ),
       color: Colors.grey.shade800,
       textColor: Colors.white70,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,
         children: <Widget>[
           if(category.icon != null)
             Icon(category.icon),
           if(category.icon != null)
             SizedBox(height: 5.0),
           AutoSizeText(
             category.name,
             minFontSize: 10.0,
             textAlign: TextAlign.center,
             maxLines: 3,
             wrapWords: false,),
         ],
       ),
     );
   }



   _categoryPressed(BuildContext context,Category category) {
     showModalBottomSheet(
       context: context,
       builder: (sheetContext) => BottomSheet(
         builder: (_) => QuizOptionsDialog(category: category,),
         onClosing: (){},

       ),

     );

   }


 }
