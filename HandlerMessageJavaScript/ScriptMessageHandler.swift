//
//  ScriptMessageHandler.swift
//  HandlerMessageJavaScript
//
//  Created by hossein on 2/6/22.
//

import Foundation
import WebKit

protocol ScriptMessageDelegate: AnyObject {
    func showName(userName: String)
}

class ScriptMessageHandler: NSObject, WKScriptMessageHandler {
    
    weak var delegate: ScriptMessageDelegate?
    
    func userContentController(_ userContentController: WKUserContentController, didReceive message: WKScriptMessage) {
        if message.name == "login" {
            guard let body = message.body as? [String: String],
                  let userName = body["userName"] else {
                      return
            }
            delegate?.showName(userName: userName)
        }
    }
    
    func getWKWebViewConfiguration() -> WKWebViewConfiguration {
        let userController = WKUserContentController()
        userController.add(self, name: "login")
        let configuration = WKWebViewConfiguration()
        configuration.userContentController = userController
        return configuration
    }
    
}
