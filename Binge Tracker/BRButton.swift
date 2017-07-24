//
//  BRButton.swift
//  Binge Tracker
//
//  Created by Joel Sene on 24/07/17.
//  Copyright © 2017 Joel Sene. All rights reserved.
//

import UIKit


open class BRButton: UIButton {
	@IBInspectable
	open  var cornerRadius: CGFloat {
		get {
			return layer.cornerRadius
		}
		set(value) {
			layer.cornerRadius = value
		}
	}

	@IBInspectable var borderWidth: CGFloat = 0 {
		didSet {
			layer.borderWidth = borderWidth
		}
	}
	@IBInspectable var borderColor: UIColor? {
		didSet {
			layer.borderColor = borderColor?.cgColor
		}
	}
}
