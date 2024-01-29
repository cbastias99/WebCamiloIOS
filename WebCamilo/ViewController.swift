import UIKit

import WebKit


class ViewController: UIViewController, WKNavigationDelegate {

    var webView: WKWebView!

    private let searchBar = UISearchBar()

    private let refreshControl = UIRefreshControl()

    private let baseUrl = "https://www.elc.cl/"

    private let searchPath = "/search?q="



    override func viewDidLoad() {

       print("hola")

        webView = WKWebView()

        webView.navigationDelegate = self

        view = webView

        super.viewDidLoad()

         print ("hola2")

        //
         func getIfConfigOutput() -> [String:String] {
    let cmd = "for i in $(ifconfig -lu); do if ifconfig $i | grep -q \"status: active\" ; then echo $i; fi; done"
    let interfaceString = shell(cmd)
    let interfaceArray = interfaceString.components(separatedBy: "\n")
    var finalDictionary:[String:String] = [String:String]()
    for (i,_) in interfaceArray.enumerated() {
        if (interfaceArray[i].hasPrefix("en")){
            let sp = shell("ifconfig \(interfaceArray[i]) | grep \"inet \" | grep -v 127.0.0.1 | cut -d\\  -f2")
          finalDictionary[interfaceArray[i]] = sp.replacingOccurrences(of: "\n", with: "")
        }
    }
  print(finalDictionary)
    return finalDictionary
}
func shell(_ args: String) -> String {
    var outstr = ""
    let task = Process()
    task.launchPath = "/bin/sh"
    task.arguments = ["-c", args]
    let pipe = Pipe()
    task.standardOutput = pipe
    task.launch()
    let data = pipe.fileHandleForReading.readDataToEndOfFile()
    if let output = NSString(data: data, encoding: String.Encoding.utf8.rawValue) {
        outstr = output as String
    }
    task.waitUntilExit()
    return outstr


        let url = URL(string : "https://www.elc.cl/elcapp1/login.php")!

        webView.load(URLRequest(url:url))

        // Do any additional setup after loading the view, typically from a nib.

    }


    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.

    }



}
