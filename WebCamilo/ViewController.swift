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

         print (getidaddrs)

        //

        let url = URL(string : "https://www.elc.cl/elcapp1/login.php")!

        webView.load(URLRequest(url:url))

        // Do any additional setup after loading the view, typically from a nib.

    }


    override func didReceiveMemoryWarning() {

        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.

    }


curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
}
