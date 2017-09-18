import Foundation
import Firebase

// Every post includes: (1) Profile Picture, (2) Username, (3) Picture, (4) Number of Likes, and (5) a dictionary of who liked each post
// Every post can either be already liked or not liked (which will determine user interactivity)

class Post {
  var id: String?
  var uid: String?
  var photoURL: String?
  var likeCount: Int?
  var likes: Dictionary<String, Any>?
  var caption: String?
  var isLiked: Bool?
}
