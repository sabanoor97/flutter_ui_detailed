class Post {
  //mimic all the item in json array

  int id;
  int userId;
  String title;
  String body;

  Post({this.id, this.userId, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> jsonPodo) {
    return Post(
        id: jsonPodo['id'],
        userId: jsonPodo['userId'],
        title: jsonPodo['title'],
        body: jsonPodo['body']);
  }
}

class PostList {
  final List<Post> allPosts;

  PostList(this.allPosts);

  factory PostList.fromJson(List<dynamic> posts) {
    // List<Post> allPosts = new List<Post>;

    List<Post> allPosts = new List.empty();

    //now adding all the objects/items to list
    allPosts = posts.map((e) => Post.fromJson(e)).toList();

    return new PostList(allPosts);
  }
}
