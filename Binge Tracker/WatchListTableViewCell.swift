//
//  WatchListTableViewCell.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import UIKit

class WatchListTableViewCell: UITableViewCell {


	//MARK: Variables &  OUTLETS

	@IBOutlet weak var seriesNameLabelOUTLET: UILabel!
	@IBOutlet weak var percentageLabelOUTLET: UILabel!
	@IBOutlet weak var nextEpsiodeLabelOUTLET: UILabel!
	@IBOutlet weak var sinopseLabelOUTLET: UILabel!
	@IBOutlet weak var containerView: UIView!
	@IBOutlet weak var circle: UIView!

	override func awakeFromNib() {
		super.awakeFromNib()
		prepareView()
	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state
	}

	func prepareView() {
		containerView.layer.borderColor = Util.ruivo.cgColor
		containerView.layer.borderWidth = 2
		containerView.layer.cornerRadius = 5
		circle.layer.cornerRadius = 10
		circle.backgroundColor = Util.ruivo
	}

	var serie: Serie? {
		didSet {
			seriesNameLabelOUTLET.text = serie?.name
			percentageLabelOUTLET.text = serie?.porcentagem
			nextEpsiodeLabelOUTLET.text = serie?.nextEP
			sinopseLabelOUTLET.text = serie?.sinopse
		}
	}

}
