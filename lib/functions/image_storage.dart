import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/services.dart';

Future<String?> storeFile({required File file, String? filenameWithPath}) async {
  try {
    final storageInstance = FirebaseStorage.instance;
    Reference reference;
    if (filenameWithPath != null && filenameWithPath != '') {
      reference = storageInstance.ref().child(filenameWithPath);
    } else {
      reference = storageInstance.ref();
    }
    TaskSnapshot snapshot = await reference.putFile(file);
    final url = await snapshot.ref.getDownloadURL();
    return url;
  } on FirebaseException catch (e) {
    return e.message;
  } on PlatformException catch (e) {
    return e.message;
  } catch (e) {
    rethrow;
  }
}
