//
//  POITableViewCell.swift
//  Grail Diary
//
//  Created by Percy Ngan on 8/14/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import UIKit

class POITableViewCell: UITableViewCell {

	@IBOutlet weak var locationLabel: UILabel!
	@IBOutlet weak var countryLabel: UILabel!
	@IBOutlet weak var numberOfClueLabel: UILabel!
	
	var poi1: POI? {
		didSet {
			updateViews()
		}
	}

	private func updateViews() {
		guard let poi1 = poi1 else { return }

		locationLabel.text = poi1.location
		countryLabel.text = poi1.country
		numberOfClueLabel.text = "\(poi1.clues.count)"
	}
}
