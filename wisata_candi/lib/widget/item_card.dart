import 'package:flutter/material.dart';
import 'package:wisata_candi/models/candi.dart';

class ItemCard extends StatelessWidget {
  //TODO: 1. Deklarasikan variabel yang dibutuhkan dan pasang pada konstruktor
  const ItemCard({super.key, required this.candi});
  final Candi candi;
  @override
  Widget build(BuildContext context) {
    //TODO: 6.Implementasi routing ke Detail Screen
    return Card(
       shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          margin:EdgeInsets.all(4),
          elevation: 1,
      //TODO: 2. Tteapkan paramteter shape, margin dan elevation dari Card
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //TODO: 3. Buat Image sebagai anak dari Column
          Expanded(
            //TODO: 7. Implementasi Hero Animation
            child: ClipRRect(
              child: Image.asset(
                candi.imageAsset, 
                width: double.infinity, 
                fit: BoxFit.cover,))),
      
      //TODO: 4. Buat Text sebagai anak dari Column
      Padding(
        padding: const EdgeInsets.only(left: 16,top: 8),
        child: Text(candi.name, 
        style: const TextStyle(
          fontSize: 16,fontWeight: FontWeight.bold),
          ),
      ),
      //TODO: 5. Buat Text sebagai anak dari Column
      Padding(
        padding: const EdgeInsets.only(left: 16, bottom: 8),
        child: Text(candi.type, 
          style: const TextStyle(
            fontSize: 12),
        ),
      ),
      ],
      ),
    );
  }
}