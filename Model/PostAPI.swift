import Foundation
import Firebase

//Start by creating a reference to the Firebase Database's child folder (sub-folder) called "Posts"

class PostAPI {
  var REF_POSTS = Database.database().reference().child("posts")
  
}
