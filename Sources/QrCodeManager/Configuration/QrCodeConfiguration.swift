//
//  QrCodeConfiguration.swift
//  
//
//  Created by Mikhail Borisov on 18.12.2021.
//

import UIKit

/// Configuration, that will be used for generating image
public struct QrCodeConfiguration: QrCodeConfigurationProtocol {

	public let content: String
	public let contentRadius: CGFloat?
	public let backgroundColor: UIColor
	public let tintColor: UIColor
	public let contentImage: UIImage?

	/// Inizalization
	/// - Parameters:
	///   - content: The content, that will be generated into qr code
	///   - contentRadius: The radius in output image
	///   - backgroundColor: Background color in output image
	///   - tintColor: Qr code output
	///   - contentImage: Image that wiil be set inside qr code
	public init(
		content: String,
		contentRadius: CGFloat? = nil,
		backgroundColor: UIColor = .white,
		tintColor: UIColor = .black,
		contentImage: UIImage? = nil
	) {
		self.content = content
		self.contentRadius = contentRadius
		self.backgroundColor = backgroundColor
		self.tintColor = tintColor
		self.contentImage = contentImage
	}
}
