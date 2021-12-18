//
//  QrCodeManager.swift
//
//
//  Created by Mikhail Borisov on 18.12.2021.
//

import UIKit

final public class QrCodeManager {

	private let configuration: QrCodeConfigurationProtocol

	private lazy var filter: CIFilter? = {
		guard let filter = CIFilter(name: Constant.qrCodeGenerator) else {
			assertionFailure("Code generator name has invalid name")
			return nil
		}
		filter.setValue(configuration.content.data(using: .ascii), forKey: Constant.inputMessage)
		return filter
	}()

	private var qrImage: UIImage? {
		let qrTransform = CGAffineTransform(scaleX: Constant.scale, y: Constant.scale)
		guard let image = filter?
				.outputImage?
				.tinted(using: configuration.tintColor)?
				.combined(with: configuration.contentImage?.ciImage)?
				.transformed(by: qrTransform)
		else { return nil }
		return UIImage(ciImage: image)
	}

	/// Generated Qr code
	public var imageView: UIImageView? {
		guard let image = qrImage else { return nil }
		let imageView = UIImageView(image: image)
		imageView.contentMode = .scaleAspectFit
		imageView.layer.backgroundColor = configuration.backgroundColor.cgColor
		imageView.layer.masksToBounds = true
		imageView.layer.cornerRadius = configuration.contentRadius ?? .zero
		return imageView
	}

	/// Inizialization
	/// - Parameter configuration: ui and others configurtions
	init(configuration: QrCodeConfigurationProtocol) {
		self.configuration = configuration
	}
}
