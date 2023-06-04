//
//  TriangleView.swift
//  Onenex_CodeTest
//
//  Created by Zin Min Phyo on 04/06/2023.
//

import Foundation
import UIKit

class OverlayView : UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    override func draw(_ rect: CGRect) {

        guard let context = UIGraphicsGetCurrentContext() else { return }

        context.beginPath()
        context.move(to: CGPoint(x: rect.minX, y: rect.minY))
        context.addLine(to: CGPoint(x: rect.maxX / 1.7, y: rect.minY))
        context.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        context.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        context.closePath()

        context.setFillColor(UIColor.systemOrange.cgColor)
        context.fillPath()
    }
}
