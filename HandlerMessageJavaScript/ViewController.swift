//
//  ViewController.swift
//  HandlerMessageJavaScript
//
//  Created by hossein on 2/6/22.
//

import UIKit
import WebKit

class ViewController: UIViewController {
    
    private var wkWebView: WKWebView!
    private lazy var scriptMessagerHanlderLogin: ScriptMessageHandler = {
        let scriptMessagerHanlder = ScriptMessageHandler()
        scriptMessagerHanlder.delegate = self
        return scriptMessagerHanlder
    }()

    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidLoad()
        self.setupWKWebview()
        self.loadPage()
    }

    private func setupWKWebview() {
        self.wkWebView = WKWebView(frame: self.view.bounds, configuration: scriptMessagerHanlderLogin.getWKWebViewConfiguration())
        self.view.addSubview(self.wkWebView)
    }
    
    private func loadPage() {
        if let url = Bundle.main.url(forResource: "form", withExtension: "html") {
            self.wkWebView.load(URLRequest(url: url))
        }
    }
    
    private func showUser(name: String) {
        let userDescription = "Login userName \(name)"
        let alertController = UIAlertController(title: "Sucess", message: userDescription, preferredStyle: .alert)
        alertController.addAction(UIAlertAction(title: "OK", style: .default))
        present(alertController, animated: true)
    }
}

extension ViewController: ScriptMessageDelegate {
    func showName(userName: String) {
        showUser(name: userName)
    }
}
