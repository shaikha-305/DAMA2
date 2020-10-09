//
//  Models.swift
//  DAMA2
//
//  Created by shaikha aljenaidel on 10/6/20.
//  Copyright © 2020 shaikha aljenaidel. All rights reserved.
//

import Foundation

enum Type{
    case none, black, white
    var player: String{
        switch self{
        case .none: return " "
        case .black: return "♟"
        case .white: return "♙"
        }
    }
}

struct Checker{
    var location: Int
    var type: Type
}

