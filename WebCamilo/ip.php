
guard let url = URL(string: "http://192.168.88.129:81/authenticate") else {
    return
}


let user1 = username.text!
let pass = passwordfield.text!
print(user1)
print(pass)
let data : Data = "telefono=\(user1)&ip=\(pass)&grant_type=password".data(using: .utf8)!
var request : URLRequest = URLRequest(url: url)
request.httpMethod = "POST"
request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
request.httpBody = data

print("one called")

let config = URLSessionConfiguration.default
let session = URLSession(configuration: config)
// vs let session = URLSession.shared
// make the request
let task = session.dataTask(with: request, completionHandler: {
                            (data, response, error) in
                            
                            if let error = error
                            {
                            print(error)
                            }
                            else if let response = response {
                            print("her in resposne")
                            
                            }else if let data = data
                            {
                            print("here in data")
                            print(data)
                            }
                            
                            DispatchQueue.main.async { // Correct
                            
                            guard let responseData = data else {
                            print("Error: did not receive data")
                            return
                            }
                            
                            let decoder = JSONDecoder()
                            print(String(data: responseData, encoding: .utf8))
                            do {
                            //  let todo = try decoder.decode(T.self, from: responseData)
                            //  NSAssertionHandler(.success(todo))
                            } catch {
                            print("error trying to convert data to JSON")
                            //print(error)
                            //  NSAssertionHandler(.failure(error))
                            }
                            }
                            })
task.resume()


}
