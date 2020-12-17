import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseServices {
  static CollectionReference divisiCollection =
      FirebaseFirestore.instance.collection('divisi');

  static Future<void> createMember(String divisi,
      {String nama, String noHP, String jK, String email}) async {
    await divisiCollection.doc(divisi).set({
      nama: [
        {
          'Nama': nama,
          'NoHp': noHP,
          'Jenis Kelamin': jK,
          'Email': email,
        }
      ]
    }
    );
  }
}
