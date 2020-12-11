import 'package:firebase_database/firebase_database.dart';

class DbControl {
  var nama, email, divisi, nohp, context;
  static final dbRef = FirebaseDatabase.instance.reference();
  static void registData(context, email, nama, divisi, nohp) {
      dbRef.child("myKantor/"+divisi+"/"+nama).set({
        'Email': email,
        'Nama': nama,
        'NoHp': nohp,
      });
    
  }
}
