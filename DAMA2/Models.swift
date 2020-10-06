//
//  Models.swift
//  DAMA2
//
//  Created by shaikha aljenaidel on 10/6/20.
//  Copyright © 2020 shaikha aljenaidel. All rights reserved.
//

import Foundation
func fillTheArray(){
    for i in 1...64{
        checkers.append(Checker(location: i, type: .none))
    }
    for b in 9...24{
        checkers[b-1].type = .black
    }
    for w in 41...56{
        checkers[w-1].type = .white
    }
}

func printTable(){
    print("------------------------------------------------------------------------")
    for i in 1...64{
        if i != 9 && i != 8 && i != 7 && i != 6 && i != 5 && i != 4 && i != 3 && i != 2 && i != 1{
        print(" \(checkers[i-1].location)   \(checkers[i-1].type.player) |", terminator: "")
        }else {
            print(" \(checkers[i-1].location)    \(checkers[i-1].type.player) |", terminator: "")
        }
        if i == 8 || i == 16 || i == 24 || i == 32 || i == 40 || i == 48 || i == 56 || i == 64{
            print("")
            print("------------------------------------------------------------------------")
        }
    }
}
