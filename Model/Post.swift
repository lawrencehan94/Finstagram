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

// Turn the post class into a dictionary
// For example, a post by Bob playing basketball would have a key (230asdfs082) as a unique identifier for the post, and then would have a ID: bobmarley32, a caption: "Watch me play ball", a photoURL: "fdsadsfd.png", a likeCount: 3, etc.
// We are setting the properties of our post equal to the dictionary values inputted by a function (likely from Firebase)

extension Post {
  static func transformPost(postDictionary: [String, Any], key: String) -> Post {
    
    let post = Post()
    
    post.id = key
    post.uid = postDictionary["uid"] as? String
    post.photoURL = postDictionary["photoURL"] as? String
    post.likecount = postDictionary["likeCount"] as? String
    post.likes = postDictionary["likes"] as? Dictionary<String, Any>
    post.caption = postDictionary["caption"] as? String
    post isLiked = postDictionary["isLiked"] as? Bool
    
  }
