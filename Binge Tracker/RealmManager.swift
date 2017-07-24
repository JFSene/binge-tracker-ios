//
//  RealmManager.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import Foundation
import RealmSwift

protocol Adapter {
	associatedtype Output

	func adapt() -> Output
}
