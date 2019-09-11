//
//  POIsTableViewController.swift
//  Grail Diary
//
//  Created by Percy Ngan on 8/14/19.
//  Copyright © 2019 Lamdba School. All rights reserved.
//

import UIKit

class POIsTableViewController: UIViewController {

	@IBOutlet weak var tableView: UITableView!

	var POIs: [POI] = []


	override func viewDidLoad() {
		super.viewDidLoad()
		tableView.dataSource = self
	}
}
extension POIsTableViewController: UITableViewDataSource {

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return POIs.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		guard let cell = tableView.dequeueReusableCell(withIdentifier: "POICell", for: indexPath) as? POITableViewCell else { return UITableViewCell() }

		let poi1 = POIs[indexPath.row]
		cell.poi1 = poi1

		return cell
	}


	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "AddPOIModalSegue" {
			if let addPOIVC = segue.destination as? AddPOIViewController {
				addPOIVC.delegate = self
			}
		} else if segue.identifier == "ShowPOIDetailSegue" {
			if let indexPath = tableView.indexPathForSelectedRow,
				let POIDetailVC = segue.destination as? POIDetailViewController {
				POIDetailVC.poi1 = POIs[indexPath.row]
			}
		}
	}
}


extension POIsTableViewController: AddPOIDelegate {

	func POICreated(_ poi: POI) {
		POIs.append(poi)
		dismiss(animated: true, completion: nil)
		tableView.reloadData()
	}
}

