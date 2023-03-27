// import 'dart:convert';
// import 'dart:developer';

// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// // Delete Data from json to map

// void main() {
//   runApp(
  
//     const MaterialApp(
//       home: HomePage(),
//     ),
//   );
// }

// class HomePage extends StatefulWidget {
//   const HomePage({
//     Key? key,
//   }) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: FutureBuilder<Post>(
//         future: fetchAllPost(),
//         builder: (_, snapshot) {
//           if (snapshot.connectionState == ConnectionState.done) {
//             return Column(
//               children: [
//                 Text(snapshot.data?.title ?? 'No Data'),
//                 ElevatedButton(
//                   onPressed: () {
//                     deletePost(snapshot.data!.id);
//                   },
//                   child: const Text("Delete Data"),
//                 ),
//               ],
//             );
//           } else {
//             return const Center(
//               child: CircularProgressIndicator(),
//             );
//           }
//         },
//       ),
//     );
//   }
// }

// final url = Uri.https("jsonplaceholder.typicode.com", "/posts/1");
// Future<Post> fetchAllPost() async {
//   final response = await http.get(url);
//   if (response.statusCode != 200) {
//     throw Exception("Post Request Failure");
//   }
//   final fromJson = json.decode(response.body) as Map<String, dynamic>;
//   return Post.fromMap(fromJson);
// }

// Future<void> deletePost(int id) async {
//   final response = await http.delete(url, body: json.encode(id));
//   log(response.statusCode.toString());
// }

// class Post {
//   final int id;
//   final int userId;
//   final String title;
//   final String body;
//   Post({
//     required this.id,
//     required this.userId,
//     required this.title,
//     required this.body,
//   });

//   factory Post.fromMap(Map<String, dynamic> map) {
//     return Post(
//       id: map['id'] as int,
//       userId: map['userId'] as int,
//       title: map['title'] as String,
//       body: map['body'] as String,
//     );
//   }
// }

// Post Data from json to map
import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Json to Object"),
          actions: [
            IconButton(
              onPressed: () async {
                await addPost();
              },
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: FutureBuilder<List<Post>>(
          future: fetchAllPost(),
          builder: (_, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return ListView.builder(
                itemCount: snapshot.data?.length ?? 0,
                itemBuilder: (_, index) {
                  final todo = snapshot.data?.elementAt(index);
                  return ListTile(
                    leading: Text(todo?.id.toString() ?? 'No Data'),
                    title: Text(todo?.title ?? 'No Data'),
                    subtitle: Text(todo?.body ?? 'No Data'),
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    ),
  );
}

final url = Uri.https('jsonplaceholder.typicode.com', '/posts');
Future<List<Post>> fetchAllPost() async {
  final response = await http.get(url);
  if (response.statusCode != 200) {
    throw Exception('Post Request Failure');
  }
  final fromJson = json.decode(response.body) as List;
  final List<Post> todos =
      fromJson.map((index) => Post.fromMap(index)).toList();
  return todos;
}

Future<void> addPost() async {
  final response = await http.post(
    url,
    body: json.encode(
      {
        'userId': 102,
        'title': 'Hafsa Shaykh',
        'body': 'I create a new resource',
      },
    ),
    headers: {
      'Content-type': 'application/json; charset=UTF-8',
    },
  );
  if (response.statusCode != 201) {
    throw Exception('Resource are not Created');
  }
  log('Resource Are Created');
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;
  Post({
    required this.userId,
    required this.id,
    required this.title,
    required this.body,
  });

  factory Post.fromMap(Map<String, dynamic> map) {
    return Post(
      userId: map['userId'] as int,
      id: map['id'] as int,
      title: map['title'] as String,
      body: map['body'] as String,
    );
  }
}
