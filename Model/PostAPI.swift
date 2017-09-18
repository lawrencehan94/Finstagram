import Foundation
import Firebase


class PostAPI {
  
  // Start by creating a reference to the Firebase Database's child folder (sub-folder) called "Posts"
  var REF_POSTS = Database.database().reference().child("posts")
  
  // Then get a snapshot of the post data (in the form of a dictionary), which we can use our transformPost function to turn it into a Post Class
  func observePosts(completion: @escaping (Post) -> Void) {
    REF_POSTS.observe(.childAdded) {
  }
  
}
