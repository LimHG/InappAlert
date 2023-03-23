//
//  Value.swift
//  ios
//
//  Created by mac on 2017. 3. 31..
//  Copyright © 2017년 toomics. All rights reserved.
//
import UIKit

public class InappAlert: NSObject {
    public var alertController: UIAlertController? = nil
    private var viewController: UIViewController? = nil
    
    public init(_ viewC : UIViewController) {
        super.init()
        #if DEBUG
        print("IA init")
        #endif
        self.viewController = viewC
    }

    public func IAinit(_ msg : String) {
        // 닫기 버튼이 없는 팝업 생성
        self.alertController = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.center = CGPoint(x: 25, y: 30)
        indicator.startAnimating();
        self.alertController!.view.addSubview(indicator)
        if let viewC = self.viewController {
            viewC.present(self.alertController!, animated: true, completion: nil)
        }
    }
    
    public func IAinit(_ msg : String, _ x: CGFloat, _ y: CGFloat) {
        // 닫기 버튼이 없는 팝업 생성
        self.alertController = UIAlertController(title: "", message: msg, preferredStyle: .alert)
        let indicator = UIActivityIndicatorView(style: .gray)
        indicator.center = CGPoint(x: x, y: y)
        indicator.startAnimating();
        self.alertController!.view.addSubview(indicator)
        if let viewC = self.viewController {
            viewC.present(self.alertController!, animated: true, completion: nil)
        }
    }
    
    public func IAmessageChange(_ msg : String) {
        if self.alertController != nil  {
            self.alertController?.dismiss(animated: true, completion: { () in
                self.alertController = nil
                self.alertController = UIAlertController(title: "", message: msg, preferredStyle: .alert)
                let indicator = UIActivityIndicatorView(style: .gray)
                indicator.center = CGPoint(x: 25, y: 30)
                indicator.startAnimating();
                self.alertController!.view.addSubview(indicator)
                if let viewC = self.viewController {
                    viewC.present(self.alertController!, animated: true, completion: nil)
                }
            })
        } else {
            #if DEBUG
            print("IA IAmessageChange CALL IAinit")
            #endif
            self.IAinit(msg)
        }
    }
    
    public func IAmessageChange(_ msg : String, _ x: CGFloat, _ y: CGFloat) {
        if self.alertController != nil {
            self.alertController?.dismiss(animated: true, completion: { () in
                self.alertController = nil
                self.alertController = UIAlertController(title: "", message: msg, preferredStyle: .alert)
                let indicator = UIActivityIndicatorView(style: .gray)
                indicator.center = CGPoint(x: x, y: y)
                indicator.startAnimating();
                self.alertController!.view.addSubview(indicator)
                if let viewC = self.viewController {
                    viewC.present(self.alertController!, animated: true, completion: nil)
                }
            })
        } else {
            self.IAinit(msg, x, y)
        }
    }
    
    public func IAdismiss() {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: {
            DispatchQueue.main.async {
                if self.alertController != nil {
                    self.alertController?.dismiss(animated: true, completion: { () in
                        self.alertController = nil
                    })
                }
            }
        })
    }
    
    public func IAdismiss(withHandler ourBlock: @escaping () -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 0.5, execute: {
            DispatchQueue.main.async {
                if self.alertController != nil {
                    self.alertController?.dismiss(animated: true, completion: ourBlock)
                }
            }
        })
    }
    
    deinit {
        #if DEBUG
        print("IA deinit")
        #endif
        self.alertController = nil
    }
}
