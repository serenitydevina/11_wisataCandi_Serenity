import 'package:flutter/material.dart';
import 'package:wisata_candi/widget/profile_item_info.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  //TODO: 1. Deklarasi varoabe; yang dibutuhkan
    bool isSignedIn = true;
    String fullName ="DummyName";
    String userName = "DummyUserName";
    int FavoriteCandiCount =0;

    //TODO: 5.Implementasi Fungsi SignIn
    void signIn(){
        setState(() {
          isSignedIn = !isSignedIn;
        });
    }
    //TODO: 6.Implementasi Fungsi SignOut
    void signOut(){
      setState(() {
        isSignedIn = !isSignedIn;
      });
    }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200, width: double.infinity, color: Colors.deepPurple,
          ),
          Padding(padding: const EdgeInsets.symmetric(horizontal: 16),
          ),
          Column(
            children: [
              //TODO: 2. Buat bagian profileHeader yang berisi gambar profil
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 -50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.deepPurple,
                              width: 2,
                            ),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        if(isSignedIn)
                        IconButton(
                          onPressed: () {}, 
                          icon: Icon(Icons.camera_alt,
                          color: Colors.deepPurple[50], 
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              //TODO: 3. Buat bahian profileInfo yang berisi info profil
              SizedBox(height: 20,),
              Divider(color:  Colors.deepPurple[100],),
              SizedBox(height: 4,),
              Row(
                children: [
                  SizedBox(width: MediaQuery.of(context).size.width /3,
                  child: Row(
                    children: [
                      Icon(
                        Icons.lock, 
                        color: Colors.amber,
                        ),
                      SizedBox(
                        width: 8,
                        ),
                      Text(
                        'pengguna',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  ),
                  Expanded(child: Text(': $userName', style: const TextStyle(fontSize: 10),
                  ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Divider(color: Colors.deepPurple[100],),
              SizedBox(height: 4,),
              // Row(
              //   children: [
              //     SizedBox(width: MediaQuery.of(context).size.width /3,
              //     child: Row(
              //       children: [
              //         Icon(Icons.person, color :Colors.blue,
              //         ),
              //         SizedBox(width: 8,),
              //         Text('Nama',
              //         style: TextStyle(
              //           fontSize: 10, fontWeight: FontWeight.bold),
              //         ),
              //       ],
              //     ),
              //     ),
              //     Expanded(child: Text(
              //       ': $fullName',
              //       style: const TextStyle(fontSize: 10),
              //     ),
              //     ),
              //     if(isSignedIn) const Icon(Icons.edit),
              //   ],
              // ),

              ProfileItemInfo(icon: Icons.person, label: 'Name', value: fullName, onEditPressed: (){debugPrint('Icon Edit Ditekan');}, iconColor: Colors.blue
              ),
              SizedBox(height: 4,),
              Divider(color: Colors.deepPurple[100],),

              SizedBox(height: 4,),
              ProfileItemInfo(
                icon: Icons.favorite, 
                label: 'Favorit', 
                value: FavoriteCandiCount>0 ? '$FavoriteCandiCount': "", 
                iconColor: Colors.red
                ),
              //TODO: 4. Buat ProfileAction yang berisi TextButton sig in/sig out 
             const SizedBox(height: 4,),
              Divider(color: Colors.deepPurple[100],),
              SizedBox(height: 20,),
              isSignedIn ? TextButton(onPressed: signOut, child: const Text('Sign Out'))
              : TextButton(onPressed: signIn, child: const Text('Sign In')),
            ],
          ),
        ],
      ),
    );
  }
}

