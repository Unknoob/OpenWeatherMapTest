//
//  Loadable.swift
//  OpenWeatherTest
//
//  Created by Gabriel Beltrame Silva on 19/06/18.
//  Copyright © 2018 Gabriel Beltrame Silva. All rights reserved.
//

import UIKit

protocol Loadable: class {
    func startLoading()
    func stopLoading()
}

extension Loadable where Self: UIViewController {
    
    func startLoading() {
        addFadeView()
        addIndicatorView()
        fadeIn()
    }
    
    func stopLoading() {
        fadeOut() {
            self.getFadeView()?.removeFromSuperview()
            self.getIndicatorView()?.removeFromSuperview()
        }
    }
    
    private func fadeIn() {
        let fadeView = getFadeView()
        let indicatorView = getIndicatorView()
        
        DispatchQueue.main.async {
            indicatorView?.startAnimating()
            UIView.animate(withDuration: 0.4, animations: {
                fadeView?.alpha = 0.2
                indicatorView?.alpha = 1
            })
        }
    }
    
    private func fadeOut(completion: @escaping () -> ()) {
        let fadeView = getFadeView()
        let indicatorView = getIndicatorView()
        
        DispatchQueue.main.async {
            UIView.animate(withDuration: 0.2, animations: {
                fadeView?.alpha = 0
                indicatorView?.alpha = 0
            }, completion: { _ in
                indicatorView?.stopAnimating()
                completion()
            })
        }
    }
    
    private func addFadeView() {
        let fadeView = UIView(frame: view.bounds)
        fadeView.backgroundColor = UIColor.black
        fadeView.alpha = 0
        fadeView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        fadeView.tag = 998123
        
        view.addSubview(fadeView)
    }
    
    private func addIndicatorView() {
        let activityIndicator = UIActivityIndicatorView(activityIndicatorStyle: .gray)
        activityIndicator.center = view.center
        activityIndicator.tag = 998127
        activityIndicator.alpha = 0
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(activityIndicator)
        
        let centerX = NSLayoutConstraint(item: activityIndicator, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0)
        let centerY = NSLayoutConstraint(item: activityIndicator, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0)

        view.addConstraints([centerX, centerY])
    }
    
    private func getFadeView() -> UIView? {
        return view.viewWithTag(998123)
    }
    
    private func getIndicatorView() -> UIActivityIndicatorView? {
        return view.viewWithTag(998127) as? UIActivityIndicatorView
    }
}
