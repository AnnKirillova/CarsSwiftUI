//
//  SwiftUIAndUIKitHelpers.swift
//  CarsSwifrUI
//
//  Created by Ann on 08.09.2021.
//

import Foundation
import UIKit
import SwiftUI

struct UIKitDetails: UIViewControllerRepresentable {
    func makeUIViewController(context: UIViewControllerRepresentableContext<UIKitDetails>) -> UIViewController {
        let viewController = CarViewController()
        return viewController
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<UIKitDetails>) {
        // pass
    }
}
