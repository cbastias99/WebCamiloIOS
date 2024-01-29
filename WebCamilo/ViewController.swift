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


class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!
    private let searchBar = UISearchBar()
    private let refreshControl = UIRefreshControl()
    private let baseUrl = "https://www.elc.cl/"
    private let searchPath = "/search?q="
    
    override func viewDidLoad() {
       print("hola")
func getLocalIPAddress() -> String? {
    var address: String?

    // Get list of all interfaces on the local machine
    var ifaddr: UnsafeMutablePointer<ifaddrs>?
    guard getifaddrs(&ifaddr) == 0 else { return nil }
    guard let firstAddr = ifaddr else { return nil }

    // Iterate through the list of interfaces
    for ptr in sequence(first: firstAddr, next: { $0.pointee.ifa_next }) {
        let flags = Int32(ptr.pointee.ifa_flags)
        let addr = ptr.pointee.ifa_addr.pointee

        // Check for running IPv4 or IPv6 interfaces
        if (flags & (IFF_UP | IFF_RUNNING | IFF_LOOPBACK)) == (IFF_UP | IFF_RUNNING) {
            if addr.sa_family == UInt8(AF_INET) || addr.sa_family == UInt8(AF_INET6) {
                var hostname = [CChar](repeating: 0, count: Int(NI_MAXHOST))
                if (getnameinfo(ptr.pointee.ifa_addr, socklen_t(addr.sa_len),
                                &hostname, socklen_t(hostname.count),
                                nil, socklen_t(0), NI_NUMERICHOST) == 0) {
                    address = String(cString: hostname)
                    break
                }
            }
        }
    }

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

