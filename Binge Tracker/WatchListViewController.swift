//
//  WatchListViewController.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import UIKit

class WatchListViewController: UIViewController {

	//MARK: Variables & OUTLETS
	@IBOutlet weak var tableView: UITableView!
	let reusableIdentifier = "WatchListTableViewCell"
	var show = Serie()

	 var series: [Serie] = {
		var gOt = Serie()
		return [gOt]
	}()

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		prepareNavBar()
		TraktManager.sharedManager.getShowSummary(showID: "game-of-thrones", extended: [.Full]) { (result) in
			switch result {
			case .success(object: let result):
				print(result)
				self.show.name = result.title
				self.show.nextEP = String(describing: result.firstAired)
				self.show.porcentagem = "\(String(describing: result.rating))"
				self.show.sinopse = result.overview
				break
			case .error(let error):
				print(error?.localizedDescription)
				break
			}
		}
		tableView.reloadData()
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		prepareTableView()
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
		cell.seriesNameLabelOUTLET.text = show.name
		cell.percentageLabelOUTLET.text = show.porcentagem
		cell.nextEpsiodeLabelOUTLET.text = show.nextEP
		cell.sinopseLabelOUTLET.text = show.sinopse

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
