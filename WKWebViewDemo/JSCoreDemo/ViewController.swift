import Foundation
import UIKit
import WebKit
import GCDWebServer

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let wkview = WKWebView()
        wkview.frame = view.frame
        view.addSubview(wkview)
        
        // 写自己的HTML部署的地址
        let url = URL(string: "http://10.110.37.90:8080/")
        let reuquest = URLRequest(url: url!)
        wkview.load(reuquest)
        
        let documentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        print("document:\(documentsPath)")
        
        // 本地开启Server服务
        initWebServer()
    }
    
    func initWebServer() {
        let webServer = GCDWebServer()
        webServer.addGETHandler(forBasePath: "/", directoryPath: NSHomeDirectory(), indexFilename: nil, cacheAge: 3600, allowRangeRequests: true)
        webServer.start(withPort: 9999, bonjourName: "GCD Web Server")
        print("Visit \(webServer.serverURL) in your web browser")
    }
    
}






