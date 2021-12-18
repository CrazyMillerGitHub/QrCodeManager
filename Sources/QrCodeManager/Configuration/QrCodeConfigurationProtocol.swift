//
//  QrCodeConfigurationProtocol.swift
//  
//
//  Created by Mikhail Borisov on 18.12.2021.
//

import UIKit

public protocol QrCodeConfigurationProtocol {
	/// The content, that will be generated into qr code
	var content: String { get }
	/// The radius in output image
	var contentRadius: CGFloat? { get }
	/// Background color in output image
	var backgroundColor: UIColor { get }
	/// Qr code output
	var tintColor: UIColor { get }
	/// Image that wiil be set inside qr code
	var contentImage: UIImage? { get }
}
