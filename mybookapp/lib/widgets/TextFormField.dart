import 'package:flutter/material.dart';

class CustomTextForm extends StatefulWidget {
  final String hinttext;
  final Icon prefixicon;
  final bool obscure;
  final TextEditingController controller;
  const CustomTextForm({super.key, required this.hinttext, required this.prefixicon, required this.obscure, required this.controller});

  @override
  State<CustomTextForm> createState() => _CustomTextFormState();
}

class _CustomTextFormState extends State<CustomTextForm> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: widget.obscure,
      decoration: InputDecoration(
        
        prefixIconColor: Colors.green , 
        hintText: widget.hinttext , 
        prefixIcon: widget.prefixicon, 
         border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(5)),
                
                
                ), 
                  enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green , width: 2)) , 
               
                focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: Colors.green , width: 2)) , 
                
      ),
    );
  }
}