
import 'package:flutter/material.dart';
import 'package:mybookapp/utils/mediaqueries.dart';


class ProductDetails extends StatefulWidget {
  @override
  State<ProductDetails> createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  child: Row(
                    children: [
                      IconButton(onPressed: (){
                       
                      }, icon: Icon(Icons.arrow_back, color: Colors.green),),
                      SizedBox(width: 8), // Add space between icon and text field
                      Expanded(
                        child: TextField(
                                 
                                 decoration: InputDecoration(
                                    prefixIcon: Icon(Icons.search) ,
                                   prefixIconColor: Colors.green,
                                   labelText: "Search",
                                   border: OutlineInputBorder(
                               borderRadius: BorderRadius.all(Radius.circular(5)),
                                    
                                   
                                   ), 
                                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green , width: 2)) , 
                                  
                                   focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green , width: 2)) , 
                                   
                                 ),
                               ),
                      )
                    ],
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: ScreenQuery.screenHeight(context)*0.4,
                    width: ScreenQuery.screenWidth(context),
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("assets/hp.jpg") , fit: BoxFit.cover)
                    ),
                  ) , 
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text("Name of Book"  , style: TextStyle(fontSize: 30),),
                            ),
                          ],
                        ),
                        Container(
                          
                          width: ScreenQuery.screenWidth(context)*0.9,
                          decoration: BoxDecoration(
                            color: Colors.blueGrey.shade900,
                            border: Border.all(width: 3 , color: Colors.green) , 
                            borderRadius: BorderRadius.all(Radius.circular(10))
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                  Text("Description :-"  , style: TextStyle(fontSize: 30),),
                            
                                                  Text("Escape to Hogwarts with the unmissable series that has sparked a lifelong reading journey for children and families all over the world. The magic starts here.Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. " , style: TextStyle(fontSize: 15))
                            , 
                              ],
                            ),
                          ),

                        ),
                         SizedBox(height: 18,),
                         Text(r" Base Price : 100$" , style: TextStyle(fontSize: 25),),
                         SizedBox(height: 10,),
                         Text(r" Current Price : 100$" , style: TextStyle(fontSize: 25),),
                         SizedBox(height: 18,),

                      
                           Center(
                             child: Container(
                              width: ScreenQuery.screenWidth(context)*.90,
                                   decoration: BoxDecoration(border: Border.all(color: Colors.green ,  width: 2) , borderRadius: BorderRadius.all(Radius.circular(55))),
                                    child: TextButton( 
                                     
                                     onPressed: (){
                                      
                             
                                     }, child: Text("           Place a Bid            ")),
                                  ),
                           ),
                         SizedBox(height: 18,),
                         Center(
                             child: Container(
                              width: ScreenQuery.screenWidth(context)*.90,
                                   decoration: BoxDecoration(border: Border.all(color: Colors.green ,  width: 2) , borderRadius: BorderRadius.all(Radius.circular(55))),
                                    child: TextButton( 
                                     
                                     onPressed: (){
                                      
                             
                                     }, child: Text("           Add to Watch List           ")),
                                  ),
                           ),
                        ],
                    )
                  )
          
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
