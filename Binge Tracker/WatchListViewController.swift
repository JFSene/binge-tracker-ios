//
//  WatchListViewController.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import UIKit
import RealmSwift
import PKHUD


class WatchListViewController: UIViewController {

	//MARK: Variables & OUTLETS
	@IBOutlet weak var tableView: UITableView!
	let reusableIdentifier = "WatchListTableViewCell"
	var show = Serie()
	var series: [Serie] = {
		var gOt = Serie()

		return [gOt]
	}()

	var realmSerie = RealmSeries()


	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		prepareNavBar()


	}

	override func viewDidLoad() {
		super.viewDidLoad()
		prepareTableView()
		prepareSeriesList()
		tableView.reloadData()

	}


}

//MARK: Prepare Functions
extension WatchListViewController {
	func prepareTableView() {
		tableView.register(UINib(nibName:reusableIdentifier, bundle: nil), forCellReuseIdentifier: reusableIdentifier)
		tableView.delegate = self
		tableView.dataSource = self
		tableView.reloadData()
		tableView.allowsMultipleSelection = false

	}

	func prepareSeriesList() {
		TraktManager.sharedManager.getShowSummary(showID: "game-of-thrones", extended: [.Full]) { (result) in
			HUD.show(.progress)
			switch result {
			case .success(let result):
				self.show.title = result.title
				self.show.rating = result.rating
				self.show.firstAired = result.firstAired!
				self.show.overview = result.overview
				self.series.append(self.show)

				print(self.series)
				break
			case .error(let error):
				print(error?.localizedDescription)
				break
			}
			HUD.hide()
		}
	}


	func prepareNavBar() {
		self.tabBarController?.navigationItem.title = "Watch List"
	}
}

//MARK: TableView DataSource & DataSource
extension WatchListViewController: UITableViewDelegate, UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return series.count
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: reusableIdentifier, for: indexPath) as! WatchListTableViewCell

	
		cell.seriesNameLabelOUTLET.text = show.title
		cell.percentageLabelOUTLET.text = "Ratings: \(show.rating!)"
		cell.nextEpsiodeLabelOUTLET.text = "First time aired: \(Util.dateParaString(data: show.firstAired!, formato: "dd/MM/yyyy"))"
		cell.sinopseLabelOUTLET.text = show.overview

		return cell
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 200
	}

	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		navigationController?.pushViewController(DetailsViewController(), animated: true)
		print(indexPath.row)
	}
}
