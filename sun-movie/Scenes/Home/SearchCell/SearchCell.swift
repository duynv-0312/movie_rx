//
//  SearchCell.swift
//  sun-movie
//
//  Created by Duy Nguyễn on 02/05/2024.
//

import UIKit
import Reusable

final class SearchCell: UITableViewCell, NibReusable {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var bioLabel: UILabel!
    @IBOutlet private weak var searchView: UIView!
    @IBOutlet private weak var searchImageView: UIImageView!
    @IBOutlet private weak var searchButton: UIButton!
    
    @IBOutlet private weak var searcPlaceolderLabel: UILabel!
    var tappedSearch: (() -> Void)?

    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        titleLabel.text = "home.welcome".localized()
        bioLabel.text = "home.bio".localized()
        searchImageView.addGradientOverlay()
        searchView.layer.cornerRadius = 12.0
        searchView.layer.cornerCurve = .continuous
        searcPlaceolderLabel.font = .systemFont(ofSize: 14)
        searcPlaceolderLabel.textColor = .secondaryLabel
        searcPlaceolderLabel.text = "home.search".localized()
    }
    
    @IBAction func searchAction(_ sender: Any) {
        tappedSearch?()
    }
}
