import Foundation
import Firebase

class PostAPI {
  
  var REF_POSTS = Database.database().reference().child("posts")
  
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

  // What's the point of PostAPI (in other words, a post's communication with Firebase)? 
  // (1) To create a child database in firebase for posts -- child("posts") 
  // (2) To get a dictionary of values from the Firebase database, and converting these values (from a Firebase snapshot) into a Post class
