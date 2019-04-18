import ObjectMapper

class APIOutput: APIOutputBase {
    var message: String?
    
    override func mapping(map: Map) {
        message <- map["message"]
    }
}
