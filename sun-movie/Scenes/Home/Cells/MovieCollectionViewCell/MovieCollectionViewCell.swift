//
//  MovieCollectionViewCell.swift
//  sun-movie
//
//  Created by Duy Nguyễn on 02/05/2024.
//

import UIKit
import SDWebImage
import Reusable

final class MovieCollectionViewCell: UICollectionViewCell, NibReusable {

    @IBOutlet private weak var containerView: UIView!
    @IBOutlet private weak var posterImageView: UIImageView!
    @IBOutlet private weak var movieNameLabel: UILabel!
    @IBOutlet private weak var releaseDateLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        configView()
    }
    
    private func configView() {
        posterImageView.layer.cornerRadius = 12
        releaseDateLabel.textColor = .secondaryLabel
    }
    
    func configCell(movie: Movie) {
        movieNameLabel.text = movie.title
        releaseDateLabel.text = movie.releaseDate
        let posterImageString = Urls.shared.getImage(urlString: movie.poster ?? "")
        posterImageView.sd_setImage(with: URL(string: posterImageString))
    }
}
