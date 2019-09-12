//
//  Reuseable.swift
//  StudioMosaicAssignment
//
//  Created by alice singh on 11/09/19.
//  Copyright © 2019 alice singh. All rights reserved.
//

import Foundation
import UIKit

protocol ReuseableView: class {
    static var reuseId: String { get }
}

extension ReuseableView where Self: UIView  {
    static var reuseId: String {
        return String(describing: self)
    }
}

extension UITableViewCell: ReuseableView { }
extension UICollectionViewCell: ReuseableView { }

extension UITableView {
    func dequeueReusableCell<T: ReuseableView>(_ indexPath: IndexPath) -> T {
        return self.dequeueReusableCell(withIdentifier: T.reuseId, for: indexPath) as! T
    }
    
    func register<T: UITableViewCell>(_ cellType: T.Type) {
        self.register(T.self, forCellReuseIdentifier: T.reuseId)
    }
}
