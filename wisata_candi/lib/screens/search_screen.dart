import 'package:flutter/material.dart';
import 'package:wisata_candi/data/candi_data.dart';
import 'package:wisata_candi/models/candi.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  //TODO: 1. Deklarasikan variabel yang dibutuhkan
    List<Candi> _filteredCandis =candiList;
    String _searchQuery = '';
    final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //TODO: 2. Buat appbar dengan judul pencarian Candi
      appBar: AppBar(
        title: const Text('Pencarian Candi'),
        ),
      //TODO: 3. Buat body berupa Column
      body: Column(
        children: [
           //TODO: 4. Buat TextFormField untuk pencarian sebagai anak dari Column
           Padding(
             padding: const EdgeInsets.all(16.0),
             child: Container(
             decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Colors.deepPurple[50],
              ),
               child: const TextField(
                autofocus: false,
                //TODO: 6. Implementasi fitur pencarian
                decoration: InputDecoration(
                  hintText: 'Cari Candi...',
                  prefixIcon: Icon(Icons.search),
                  //TODO: 7. Implementasi pengosongan Input
                  border: InputBorder.none,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.deepPurple),
                  ),
                  contentPadding: EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 12,
                  ),
                  
                ),
               ),
             ),
           ),
          //TODO: 5. Buat ListView hasil pencarian sebagai anak dari Column

          Expanded(
            child: ListView.builder(
              itemCount: _filteredCandis.length,
              itemBuilder: (context, index) {
                final candi = _filteredCandis[index];
                //TODO: 8.Implementasi Gesture Detector dan Hero Animation
                return Card(
                  margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(8),
                        width: 100,
                        height: 100,
                        child: ClipRRect(child: Image(image: AssetImage(candi.imageAsset),fit: BoxFit.cover,),
                        borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(candi.name,style:  const TextStyle(fontSize: 16,fontWeight: FontWeight.bold),),
                            const SizedBox(height: 4,),
                            Text(candi.location),
                          ],
                        ),
                      )
                    ],
                    
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}