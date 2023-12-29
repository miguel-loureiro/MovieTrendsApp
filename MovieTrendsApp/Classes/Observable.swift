//
//  Observable.swift
//  MovieTrendsApp
//
//  Created by António Loureiro on 28/12/2023.
//

import Foundation

/// This class is going to have the role of observe the passing of dat to the view controller
/// It is generic because it is going to be used in various types of variables(Int, String, [], ....)
class Observable<T> {

    /// When value changes we have some data, so we need to do something about it
    /// It will be an Generic Optional because the data coming from server can be nil,
    var value: T? {
        didSet {
            DispatchQueue.main.async {
                self.listener?(self.value)
            }
        }
    }

    /// initializer is needed
    init( _ value: T?) {

        self.value = value
    }

    ///Binding

    private var listener: ((T?) -> Void)?

    func bind( _ listener: @escaping ((T?) -> Void)) {
        listener(value)
        self.listener = listener
    }

}
