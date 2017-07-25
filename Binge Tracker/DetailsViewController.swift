//
//  DetailsViewController.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import UIKit
import RealmSwift

class DetailsViewController: UIViewController {
	//MARK: Variables & OUTLETS

	@IBOutlet weak var titulo: UILabel!
	@IBOutlet weak var ano: UILabel!
	@IBOutlet weak var sinopse: UILabel!
	@IBOutlet weak var primeiraexibição: UILabel!
	@IBOutlet weak var trailer: UILabel!
	@IBOutlet weak var homepage: UILabel!
	@IBOutlet weak var avaliacao: UILabel!
	@IBOutlet weak var votos: UILabel!
	let realm = try! Realm()

    override func viewDidLoad() {
        super.viewDidLoad()

    }



}

//MARK: Prepare Functions
extension DetailsViewController {
	func prepareLabels() {

	}
}
