//
//  ViewController.swift
//  WebCamilo
//
//  Created by camilo on 1/22/24.
//  Copyright © 2024 camilo. All rights reserved.
//

import UIKit
import WebKit
import Foundation
import Network

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    private let searchBar = UISearchBar()
    private let refreshControl = UIRefreshControl()
    private let baseUrl = "https://www.elc.cl/"
    private let searchPath = "/search?q="
    
    override func viewDidLoad() {
       print("hola")
        
        guard let urlpost = URL(string: "https://www.elc.cl/test2/iOS/registrarTelefono.php") else {
            return
        }
        
        
        let user1 = "12345"
        let pass = "192.168."
        print(user1)
        print(pass)
        let data : Data = "telefono=\(user1)&ip=\(pass)&grant_type=password".data(using: .utf8)!
        var request : URLRequest = URLRequest(url: urlpost)
        request.httpMethod = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField:"Content-Type");
        request.setValue(NSLocalizedString("lang", comment: ""), forHTTPHeaderField:"Accept-Language");
        request.httpBody = data
        
        print("one called")
        func getLocalIPAddress() -> String? {
            var ipAddress: String?

            let nwPath = NWPathMonitor()
            let queue = DispatchQueue(label: "Monitor")
            nwPath.start(queue: queue)

            nwPath.pathUpdateHandler = { path in
                if let ipv4Interface = path.availableInterfaces.filter({ $0.type == .wifi || $0.type == .wiredEthernet }).first,
                let ipv4Address = ipv4Interface.ipv4Addresses.first {
                    ipAddress = ipv4Address
                }
            }

            return ipAddress
        }

        // Example usage
        if let localIPAddress = getLocalIPAddress() {
            print("Local IP Address: \(localIPAddress)")
        } else {
            print("Unable to retrieve local IP address.")
        }
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
        
        
        webView = WKWebView()
        webView.navigationDelegate = self
        view = webView
        super.viewDidLoad()
        
        //
       
        let url = URL(string : "https://www.elc.cl/elcapp1/login.php")!
        webView.load(URLRequest(url:url))
        // Do any additional setup after loading the view, typically from a nib.
    }
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!){
        if let currentURL = webView.url{
            print("URL cambiada")
        }
    }
    func webView (_ webView: WKWebView, didFinish navigation:WKNavigation!){
        if let currentURL = webView.url{
            print ("URL : ")
        }
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

