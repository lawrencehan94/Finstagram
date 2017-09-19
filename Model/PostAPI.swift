import Foundation
import Firebase


class PostAPI {
  
  // Start by creating a reference to the Firebase Database's child folder (sub-folder) called "Posts"
  var REF_POSTS = Database.database().reference().child("posts")
  
  // Turn snapshot
  // An escaping function invokes the closure after the function returns - newPost is of type, Post and is used after the lifetime of the function
  // First, we're observing the database to see when a child is added to the REF_POSTS database
  // This observation will return a snapshot of the REF_POSTS database in the form of a dictionary [String: Any]
  // A new post will be created in the form of the Post class by transforming that postDictionary and snapshot key into a Post() object
  // Completion will return newPost with type Post
  
  func observePosts(completion: @escaping (Post) -> Void) {
    REF_POSTS.observe(.childAdded) { (snapshot: DataSnapshot) in
      if let postDictionary = snapshot.value as? [String: Any] {
        let newPost = Post.transformPost(postDictionary: postDictionary, key: snapshot.key) 
        completion(newPost)
      }
    }
  }
  
  func observePost(withID id: String, completion: @escaping (Post) -> Void) {
    REF_POSTS.child(id).observeSingleEvent(of: .value, with: {
      snapshot in
      if let postDictionary = snapshot.value as? [String: Any] {
        let post = Post.transformPost(postDictionary: postDictionary, key: snapshot.key)
        completion(post)
      }
    }
  }
  
}
