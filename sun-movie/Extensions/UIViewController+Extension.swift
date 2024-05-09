//
//  UIViewController+Extension.swift
//  sun-movie
//
//  Created by Duy Nguyễn on 02/05/2024.
//

import UIKit
import SafariServices

extension UIViewController {
    func loading(_ isShow: Bool) {
        DispatchQueue.main.async {
            if isShow {
                if self.view.subviews.first(where: { $0.isKind(of: UIActivityIndicatorView.self) }) == nil {
                    let activityIndicator = UIActivityIndicatorView(style: .large)
                    activityIndicator.color = .darkGray
                    activityIndicator.translatesAutoresizingMaskIntoConstraints = false
                    self.view.addSubview(activityIndicator)
                    activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
                    activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
                    activityIndicator.startAnimating()
                }
            } else {
                let indicator = self.view.subviews.first(where: { $0.isKind(of: UIActivityIndicatorView.self) })
                indicator?.removeFromSuperview()
            }
        }
    }
    
    func showError(error: Error) {
        switch error {
        case let AppError.normalError(message):
            self.showError(message: message)
        case AppError.noInternet:
            self.showError(title: AppError.noInternet.description)
        default:
            self.showError(message: error.localizedDescription)
        }
    }
    
    func showError(title: String = "Error", message: String = "Failed to load data") {
        DispatchQueue.main.async {
            let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
            let OkAction = UIAlertAction(title: "OK", style: .default) { (_: UIAlertAction!) in
            }
            alertController.addAction(OkAction)
            self.present(alertController, animated: true)
        }
    }
    
    func presentSafariViewController(with urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }
        let safariViewController = SFSafariViewController(url: url)
        present(safariViewController, animated: true, completion: nil)
    }
}
