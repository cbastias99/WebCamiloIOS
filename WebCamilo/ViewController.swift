import UIKit

import WebKit
import Foundation


class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!

    private let searchBar = UISearchBar()

    private let refreshControl = UIRefreshControl()

    private let baseUrl = "https://www.elc.cl/"

    private let searchPath = "/search?q="



    override func viewDidLoad() {

       print("hola")

    freeifaddrs(ifaddr)

    return address
}

// Example usage
if let localIPAddress = getLocalIPAddress() {
    print("Local IP Address: \(localIPAddress)")
} else {
    print("Unable to retrieve local IP address.")
}

        guard let urlpost = URL(string: "https://www.elc.cl/test2/iOS/registrarTelefono.php") else {
            return
        }
        
          let user1 = "12345"
       
       
        print(user1)
        let data : Data = "telefono=\(user1)&ip=\("sublime")&grant_type=password".data(using: .utf8)!
        var request : URLRequest = URLRequest(url: urlpost)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
        request.httpBody = data
        
        print("one called")
       
 
      
                				
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
        
        
        webView = WKWebView()

        webView.navigationDelegate = self

        view = webView

        super.viewDidLoad()

         print ("hola2")

        //



        let url = URL(string : "https://www.elc.cl/elcapp1/login.php")!

        webView.load(URLRequest(url:url))

        // Do any additional setup after loading the view, typically from a nib.

    }


    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.

    }



}