//
//  SummaryTableViewCell.swift
//  Movie-Demo
//
//  Created by Mayank Srivastava on 30/12/20.
//

import UIKit

class SummaryTableViewCell: UITableViewCell {
    
    @IBOutlet private var catagoryLabel: UILabel!
    @IBOutlet private var durationLabel: UILabel!
    @IBOutlet private var ratingLabel: UILabel!
    @IBOutlet private var summaryLabel: UILabel!
    @IBOutlet private var scoreLabel: UILabel!
    @IBOutlet private var reviewsLabel: UILabel!
    @IBOutlet private var popularityLabel: UILabel!
    var catagory: Catagory? {
        didSet {
            setUpCell()
        }
    }

    func setUpCell() {
        catagoryLabel.text = catagory?.catoagry ?? ""
        updateRatingLabel()
        
        durationLabel.text = catagory?.duration ?? ""
        summaryLabel.text = catagory?.summary ?? ""
        updateScore()
        updateReviews()
        updatePopularity()
    }
    
    private func updateRatingLabel() {
        let attachment = NSTextAttachment(image: #imageLiteral(resourceName: "star"))
        attachment.bounds = CGRect(x: 0, y: -5, width: 20, height: 20)
        let mutableAttributedString = NSMutableAttributedString(attachment: attachment)
        let string = " " + (catagory?.rating ?? "")
        let attributedString = NSAttributedString(string: string)
        mutableAttributedString.append(attributedString)
        ratingLabel.attributedText = mutableAttributedString
    }
    
    private func updateScore() {
        scoreLabel.text = "Score\n" + (catagory?.score ?? "")
    }
    
    private func updateReviews() {
        reviewsLabel.text = "Reviews\n" + (catagory?.reviews ?? "")
    }
    
    private func updatePopularity() {
        popularityLabel.text = "Popularity\n" + (catagory?.popularity ?? "")
    }
}
